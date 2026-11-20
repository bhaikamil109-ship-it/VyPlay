package com.kamil.vyplay

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.app.Service
import android.content.Context
import android.content.Intent
import android.os.Build
import android.os.IBinder
import androidx.core.app.NotificationCompat

/**
 * Keeps the process alive while downloads are running.
 *
 * Why this exists: a plain `Service` start is killed once the app leaves the
 * foreground, and Android 8+ additionally refuses to keep an app alive without
 * a matching foreground-service type. Downloads are long, network-bound and
 * must survive the user switching apps or locking the screen, so they run under
 * a `dataSync` foreground service.
 *
 * This service deliberately owns only the *lifetime* notification ("Downloading
 * N videos"). Per-download progress notifications already exist in
 * `DownloadNotificationService` on the Dart side; duplicating them here would
 * show two competing notifications for the same transfer.
 */
class DownloadsForegroundService : Service() {

    companion object {
        private const val ACTION_START = "com.kamil.vyplay.downloads.START"
        private const val ACTION_UPDATE = "com.kamil.vyplay.downloads.UPDATE"
        private const val ACTION_STOP = "com.kamil.vyplay.downloads.STOP"

        private const val EXTRA_TEXT = "text"
        private const val EXTRA_COUNT = "count"

        private const val CHANNEL_ID = "vyplay_downloads_foreground"
        private const val NOTIFICATION_ID = 4021

        /** True while the service holds a foreground notification. */
        @Volatile
        var isRunning: Boolean = false
            private set

        /** Starts (or refreshes) the foreground download session. */
        fun start(context: Context, text: String?, count: Int) {
            val intent = Intent(context, DownloadsForegroundService::class.java).apply {
                action = ACTION_START
                putExtra(EXTRA_TEXT, text ?: defaultText(count))
                putExtra(EXTRA_COUNT, count)
            }
            try {
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                    context.startForegroundService(intent)
                } else {
                    context.startService(intent)
                }
            } catch (e: Exception) {
                // Android 12+ throws when the app is in the background without
                // an exemption. The downloads themselves keep running; only the
                // keep-alive guarantee is lost, so this must not crash the app.
                isRunning = false
            }
        }

        /** Updates the wording after the active count changes. */
        fun update(context: Context, text: String?, count: Int) {
            if (!isRunning) {
                // Nothing to update; a stale start is worse than no start.
                return
            }
            val intent = Intent(context, DownloadsForegroundService::class.java).apply {
                action = ACTION_UPDATE
                putExtra(EXTRA_TEXT, text ?: defaultText(count))
                putExtra(EXTRA_COUNT, count)
            }
            try {
                context.startService(intent)
            } catch (e: Exception) {
                // Ignore: the notification keeps its previous text.
            }
        }

        /** Ends the session; the system is free to reclaim the process again. */
        fun stop(context: Context) {
            try {
                context.stopService(Intent(context, DownloadsForegroundService::class.java))
            } catch (e: Exception) {
                // Nothing to stop.
            }
            isRunning = false
        }

        private fun defaultText(count: Int): String = when {
            count <= 0 -> "Finishing downloads"
            count == 1 -> "Downloading 1 video"
            else -> "Downloading $count videos"
        }
    }

    override fun onBind(intent: Intent?): IBinder? = null

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        if (intent?.action == ACTION_STOP) {
            stopForegroundCompat()
            stopSelf()
            isRunning = false
            return START_NOT_STICKY
        }

        val count = intent?.getIntExtra(EXTRA_COUNT, 0) ?: 0
        val text = intent?.getStringExtra(EXTRA_TEXT) ?: defaultText(count)

        val notification = buildNotification(text)
        if (!isRunning) {
            startForegroundCompat(notification)
            isRunning = true
        } else {
            notificationManager()?.notify(NOTIFICATION_ID, notification)
        }

        // Not sticky: a restarted service would have no transfer to supervise.
        // Interrupted rows are picked up by
        // DownloadService.resumeInterruptedDownloads on the next app start.
        return START_NOT_STICKY
    }

    override fun onDestroy() {
        isRunning = false
        stopForegroundCompat()
        super.onDestroy()
    }

    private fun startForegroundCompat(notification: Notification) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            startForeground(
                NOTIFICATION_ID,
                notification,
                android.content.pm.ServiceInfo.FOREGROUND_SERVICE_TYPE_DATA_SYNC,
            )
        } else {
            startForeground(NOTIFICATION_ID, notification)
        }
    }

    private fun stopForegroundCompat() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            stopForeground(STOP_FOREGROUND_REMOVE)
        } else {
            @Suppress("DEPRECATION")
            stopForeground(true)
        }
    }

    private fun notificationManager(): NotificationManager? =
        getSystemService(Context.NOTIFICATION_SERVICE) as? NotificationManager

    private fun buildNotification(text: String): Notification {
        ensureChannel()

        val openApp = PendingIntent.getActivity(
            this,
            0,
            Intent(this, MainActivity::class.java).apply {
                flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TOP
            },
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE,
        )

        return NotificationCompat.Builder(this, CHANNEL_ID)
            .setContentTitle("VyPlay downloads")
            .setContentText(text)
            .setSmallIcon(R.drawable.ic_vyplay_notification)
            .setOngoing(true)
            .setOnlyAlertOnce(true)
            .setShowWhen(false)
            .setPriority(NotificationCompat.PRIORITY_LOW)
            .setCategory(NotificationCompat.CATEGORY_PROGRESS)
            .setContentIntent(openApp)
            .build()
    }

    private fun ensureChannel() {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.O) return
        val manager = notificationManager() ?: return
        if (manager.getNotificationChannel(CHANNEL_ID) != null) return

        val channel = NotificationChannel(
            CHANNEL_ID,
            "Background downloads",
            NotificationManager.IMPORTANCE_LOW,
        ).apply {
            description = "Keeps VyPlay downloads running while the app is in the background"
            setShowBadge(false)
        }
        manager.createNotificationChannel(channel)
    }
}
