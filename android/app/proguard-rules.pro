# Optimization settings
-optimizationpasses 5
-allowaccessmodification
-repackageclasses ''

# Flutter default ProGuard rules
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }

# NewPipe Extractor
-keep class org.schabi.newpipe.extractor.** { *; }
-keepclassmembers class org.schabi.newpipe.extractor.** { *; }

# Mozilla Rhino JavaScript Engine (used by NewPipe for signature decryption)
-keep class org.mozilla.javascript.** { *; }
-keepclassmembers class org.mozilla.javascript.** { *; }
-dontwarn org.mozilla.javascript.**

# OkHttp
-dontwarn okhttp3.**
-dontwarn okio.**
-keep class okhttp3.** { *; }
-keep interface okhttp3.** { *; }
-keep class okio.** { *; }

# Gson
-keepattributes Signature
-keepattributes *Annotation*
-dontwarn sun.misc.**
-keep class com.google.gson.** { *; }
-keep class * extends com.google.gson.TypeAdapter
-keep class * implements com.google.gson.TypeAdapterFactory
-keep class * implements com.google.gson.JsonSerializer
-keep class * implements com.google.gson.JsonDeserializer
-keepclassmembers,allowobfuscation class * {
  @com.google.gson.annotations.SerializedName <fields>;
}

# Jsoup and RE2J (regex engine used by jsoup)
-keep class org.jsoup.** { *; }
-keepclassmembers class org.jsoup.** { *; }
-dontwarn org.jsoup.**
-dontwarn com.google.re2j.**
-keep class com.google.re2j.** { *; }

# Kotlin Coroutines
-keepnames class kotlinx.coroutines.internal.MainDispatcherFactory {}
-keepnames class kotlinx.coroutines.CoroutineExceptionHandler {}
-keepclassmembers class kotlinx.coroutines.** {
    volatile <fields>;
}
-dontwarn kotlinx.coroutines.**

# Keep data classes for JSON serialization
-keepclassmembers class com.fazilvk.fluxtube.newpipe.models.** { *; }

# Prevent R8 from removing classes needed at runtime
-keep class * extends java.lang.Exception

# Audio Service / Media Session
-keep class com.ryanheise.audioservice.** { *; }
-keep class androidx.media.** { *; }
-keep class android.support.v4.media.** { *; }

# Android Notification classes
-keep class android.app.Notification { *; }
-keep class android.app.Notification$* { *; }
-keep class android.app.NotificationManager { *; }
-keep class android.app.NotificationChannel { *; }
-keep class androidx.core.app.NotificationCompat { *; }
-keep class androidx.core.app.NotificationCompat$* { *; }

# Muxer handlers - invoked by name from the method channel.
# FFmpegMuxerHandler is kept because NewPipeMuxerHandler delegates the legacy
# `resolveMuxPlan` / `muxVideoAudio` calls to it.
-keep class com.fazilvk.fluxtube.FFmpegMuxerHandler { *; }
-keepclassmembers class com.fazilvk.fluxtube.FFmpegMuxerHandler { *; }
# NewPipe pure-Java muxers (vendored from NewPipe 0.29.1) and the handler that
# drives them. R8 must not strip or rename them because the MethodChannel
# handler calls into them.
-keep class com.fazilvk.fluxtube.NewPipeMuxerHandler { *; }
-keepclassmembers class com.fazilvk.fluxtube.NewPipeMuxerHandler { *; }
-keep class org.schabi.newpipe.streams.** { *; }

# Google Play Core (Flutter deferred components)
-dontwarn com.google.android.play.core.splitcompat.SplitCompatApplication
-dontwarn com.google.android.play.core.splitinstall.SplitInstallException
-dontwarn com.google.android.play.core.splitinstall.SplitInstallManager
-dontwarn com.google.android.play.core.splitinstall.SplitInstallManagerFactory
-dontwarn com.google.android.play.core.splitinstall.SplitInstallRequest$Builder
-dontwarn com.google.android.play.core.splitinstall.SplitInstallRequest
-dontwarn com.google.android.play.core.splitinstall.SplitInstallSessionState
-dontwarn com.google.android.play.core.splitinstall.SplitInstallStateUpdatedListener
-dontwarn com.google.android.play.core.tasks.OnFailureListener
-dontwarn com.google.android.play.core.tasks.OnSuccessListener
-dontwarn com.google.android.play.core.tasks.Task

# MediaStore save handler - invoked by name from the method channel
-keep class com.fazilvk.fluxtube.MediaStoreHandler { *; }
-keep class com.fazilvk.fluxtube.DeviceCapabilityHandler { *; }
-keep class com.fazilvk.fluxtube.StorageMethodHandler { *; }

# media_kit / libmpv native bindings. The Dart side reaches these through
# dart:ffi, so R8 cannot see the references and would strip them.
-keep class io.flutter.plugins.** { *; }
-keep class com.alexmercerind.** { *; }
-dontwarn com.alexmercerind.**

# flutter_local_notifications - the plugin resolves its own classes and the
# notification receiver reflectively from the manifest.
-keep class com.dexterous.** { *; }
-dontwarn com.dexterous.**

# audio_service / media session (background playback)
-keep class com.ryanheise.** { *; }
-dontwarn com.ryanheise.**

# ExoPlayer / Media3 - the player is constructed reflectively by the platform
# view factory and by media_kit's Android backend.
-keep class androidx.media3.** { *; }
-dontwarn androidx.media3.**
-keep class com.google.android.gms.cast.** { *; }
-dontwarn com.google.android.gms.cast.**
