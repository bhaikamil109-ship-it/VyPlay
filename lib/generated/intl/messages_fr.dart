// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'fr';

  static String m0(name) => "Ajouté à ${name}";

  static String m1(device) => "Diffusion vers ${device}";

  static String m2(count) =>
      "${Intl.plural(count, zero: 'Aucun abonné', one: 'abonné', other: 'abonnés')}";

  static String m3(name) => "Supprimer ${name} ?";

  static String m4(title) => "Échec du téléchargement : ${title}";

  static String m5(count) =>
      "${Intl.plural(count, one: 'Réponse', other: 'Réponses')}";

  static String m6(count) => "${count} minutes";

  static String m7(count) => "${count} min";

  static String m8(count) => "${count} vidéos";

  static String m9(count) =>
      "${Intl.plural(count, zero: 'Aucune vue', one: 'vue', other: 'vues')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("À propos"),
    "addProfile": MessageLookupByLibrary.simpleMessage("Ajouter un profil"),
    "addToQueue": MessageLookupByLibrary.simpleMessage("Ajouter à la file"),
    "addVideosHint": MessageLookupByLibrary.simpleMessage(
      "Appuyez longuement sur une vidéo pour l\'enregistrer dans une playlist",
    ),
    "addedToPlayNext": MessageLookupByLibrary.simpleMessage(
      "Ajouté pour lecture suivante",
    ),
    "addedToPlaylist": m0,
    "addedToQueue": MessageLookupByLibrary.simpleMessage("Ajouté à la file"),
    "all": MessageLookupByLibrary.simpleMessage("Tout"),
    "audio": MessageLookupByLibrary.simpleMessage("Audio"),
    "audioFocus": MessageLookupByLibrary.simpleMessage("Focus audio"),
    "audioFocusDescription": MessageLookupByLibrary.simpleMessage(
      "Mettre en pause lors des interruptions",
    ),
    "audioOnly": MessageLookupByLibrary.simpleMessage("Audio seul"),
    "audioQuality": MessageLookupByLibrary.simpleMessage("Qualité audio"),
    "autoPip": MessageLookupByLibrary.simpleMessage(
      "Image dans l\'image automatique",
    ),
    "autoPipDescription": MessageLookupByLibrary.simpleMessage(
      "Passer automatiquement en mode PiP en appuyant sur Accueil pendant la lecture",
    ),
    "autoScrollOff": MessageLookupByLibrary.simpleMessage(
      "Défilement auto désactivé",
    ),
    "autoScrollOn": MessageLookupByLibrary.simpleMessage(
      "Défilement auto activé",
    ),
    "backupRestore": MessageLookupByLibrary.simpleMessage(
      "Sauvegarde et restauration",
    ),
    "backupRestoreDescription": MessageLookupByLibrary.simpleMessage(
      "Exportez ou importez vos abonnements",
    ),
    "canada": MessageLookupByLibrary.simpleMessage("Canada"),
    "cancel": MessageLookupByLibrary.simpleMessage("Annuler"),
    "cancelled": MessageLookupByLibrary.simpleMessage("Annulé"),
    "cannotDeleteDefault": MessageLookupByLibrary.simpleMessage(
      "Impossible de supprimer le profil par défaut",
    ),
    "cannotRenameDefault": MessageLookupByLibrary.simpleMessage(
      "Impossible de renommer le profil par défaut",
    ),
    "castConnected": MessageLookupByLibrary.simpleMessage("Connecté"),
    "castConnectedTo": m1,
    "castFailed": MessageLookupByLibrary.simpleMessage(
      "Cette vidéo ne peut pas être diffusée",
    ),
    "castStop": MessageLookupByLibrary.simpleMessage("Arrêter la diffusion"),
    "castTitle": MessageLookupByLibrary.simpleMessage("Diffuser"),
    "castUnavailable": MessageLookupByLibrary.simpleMessage(
      "La diffusion n\'est pas disponible sur cet appareil",
    ),
    "channelSubscribers": m2,
    "channels": MessageLookupByLibrary.simpleMessage("Chaînes"),
    "clearAll": MessageLookupByLibrary.simpleMessage("Tout effacer"),
    "clearAllHistory": MessageLookupByLibrary.simpleMessage(
      "Effacer tout l\'historique",
    ),
    "clearAllHistoryConfirm": MessageLookupByLibrary.simpleMessage(
      "Voulez-vous vraiment effacer tout l\'historique de visionnage ?",
    ),
    "clearAllSaved": MessageLookupByLibrary.simpleMessage(
      "Effacer tous les enregistrements",
    ),
    "clearAllSavedConfirm": MessageLookupByLibrary.simpleMessage(
      "Voulez-vous vraiment supprimer toutes les vidéos enregistrées ?",
    ),
    "clearLogs": MessageLookupByLibrary.simpleMessage("Effacer les journaux"),
    "commentAuthorNotFound": MessageLookupByLibrary.simpleMessage(
      "Introuvable",
    ),
    "commentsDisabled": MessageLookupByLibrary.simpleMessage(
      "Les commentaires sont désactivés",
    ),
    "commonSettingsTitle": MessageLookupByLibrary.simpleMessage("Général"),
    "completed": MessageLookupByLibrary.simpleMessage("Terminé"),
    "copiedToClipboard": MessageLookupByLibrary.simpleMessage(
      "Copié dans le presse-papiers",
    ),
    "copyLink": MessageLookupByLibrary.simpleMessage("Copier le lien"),
    "createAction": MessageLookupByLibrary.simpleMessage("Créer"),
    "dateAdded": MessageLookupByLibrary.simpleMessage("Date d\'ajout"),
    "debugConsole": MessageLookupByLibrary.simpleMessage("Console de débogage"),
    "defaultProfile": MessageLookupByLibrary.simpleMessage("Par défaut"),
    "defaultQuality": MessageLookupByLibrary.simpleMessage(
      "Qualité par défaut",
    ),
    "delete": MessageLookupByLibrary.simpleMessage("Supprimer"),
    "deleteDownload": MessageLookupByLibrary.simpleMessage(
      "Supprimer le téléchargement",
    ),
    "deleteDownloadConfirm": MessageLookupByLibrary.simpleMessage(
      "Voulez-vous vraiment supprimer ce téléchargement ?",
    ),
    "deletePlaylistAction": MessageLookupByLibrary.simpleMessage(
      "Supprimer la playlist",
    ),
    "deletePlaylistConfirm": m3,
    "deletePlaylistTitle": MessageLookupByLibrary.simpleMessage(
      "Supprimer la playlist",
    ),
    "deleteProfile": MessageLookupByLibrary.simpleMessage(
      "Supprimer le profil",
    ),
    "deleteVideo": MessageLookupByLibrary.simpleMessage("Supprimer la vidéo"),
    "deleteVideoConfirm": MessageLookupByLibrary.simpleMessage(
      "Voulez-vous vraiment retirer cette vidéo ?",
    ),
    "developer": MessageLookupByLibrary.simpleMessage("Développeur"),
    "disablePipPlayer": MessageLookupByLibrary.simpleMessage(
      "Désactiver le lecteur PIP",
    ),
    "disableVideoHistory": MessageLookupByLibrary.simpleMessage(
      "Désactiver l\'historique des vidéos",
    ),
    "dislike": MessageLookupByLibrary.simpleMessage("Je n\'aime pas"),
    "distractionFree": MessageLookupByLibrary.simpleMessage("Sans distraction"),
    "download": MessageLookupByLibrary.simpleMessage("Télécharger"),
    "downloadFailed": m4,
    "downloadStarted": MessageLookupByLibrary.simpleMessage(
      "Téléchargement démarré",
    ),
    "downloadType": MessageLookupByLibrary.simpleMessage(
      "Type de téléchargement",
    ),
    "downloading": MessageLookupByLibrary.simpleMessage("Téléchargement"),
    "downloadingAudio": MessageLookupByLibrary.simpleMessage(
      "Téléchargement de l\'audio",
    ),
    "downloadingVideo": MessageLookupByLibrary.simpleMessage(
      "Téléchargement de la vidéo",
    ),
    "downloads": MessageLookupByLibrary.simpleMessage("Téléchargements"),
    "duration": MessageLookupByLibrary.simpleMessage("Durée"),
    "enableHlsPlayerDescription": MessageLookupByLibrary.simpleMessage(
      "Activez le lecteur HLS pour déverrouiller toutes les options de qualité. Désactivez-le si des erreurs se produisent.",
    ),
    "exportData": MessageLookupByLibrary.simpleMessage("Exporter les données"),
    "exportSubscriptions": MessageLookupByLibrary.simpleMessage(
      "Exporter les abonnements",
    ),
    "exportSuccess": MessageLookupByLibrary.simpleMessage(
      "Exportation réussie",
    ),
    "failed": MessageLookupByLibrary.simpleMessage("Échec"),
    "failedToOpenFile": MessageLookupByLibrary.simpleMessage(
      "Impossible d\'ouvrir le fichier",
    ),
    "fileNotFound": MessageLookupByLibrary.simpleMessage("Fichier introuvable"),
    "filterAll": MessageLookupByLibrary.simpleMessage("Tout"),
    "filterChannels": MessageLookupByLibrary.simpleMessage("Chaînes"),
    "filterMusic": MessageLookupByLibrary.simpleMessage("Musique"),
    "filterPlaylists": MessageLookupByLibrary.simpleMessage("Playlists"),
    "filterVideos": MessageLookupByLibrary.simpleMessage("Vidéos"),
    "france": MessageLookupByLibrary.simpleMessage("France"),
    "hideComments": MessageLookupByLibrary.simpleMessage(
      "Masquer les commentaires",
    ),
    "hideCommentsButtonFromWatchScreen": MessageLookupByLibrary.simpleMessage(
      "Masquer le bouton des commentaires de l\'écran de visionnage.",
    ),
    "hideRelated": MessageLookupByLibrary.simpleMessage(
      "Masquer les vidéos similaires",
    ),
    "hideRelatedVideosFromWatchScreen": MessageLookupByLibrary.simpleMessage(
      "Masquer les vidéos similaires de l\'écran de visionnage",
    ),
    "history": MessageLookupByLibrary.simpleMessage("Historique"),
    "hlsPlayer": MessageLookupByLibrary.simpleMessage("Lecteur HLS"),
    "home": MessageLookupByLibrary.simpleMessage("Accueil"),
    "homeFeedMode": MessageLookupByLibrary.simpleMessage("Fil d\'accueil"),
    "homeFeedModeAuto": MessageLookupByLibrary.simpleMessage("Auto"),
    "homeFeedModeAutoHint": MessageLookupByLibrary.simpleMessage(
      "Afficher les abonnements si disponibles, sinon les tendances",
    ),
    "homeFeedModeFeedOnly": MessageLookupByLibrary.simpleMessage("Abonnements"),
    "homeFeedModeFeedOnlyHint": MessageLookupByLibrary.simpleMessage(
      "Afficher uniquement les vidéos des chaînes abonnées",
    ),
    "homeFeedModeTrendingOnly": MessageLookupByLibrary.simpleMessage(
      "Tendances",
    ),
    "homeFeedModeTrendingOnlyHint": MessageLookupByLibrary.simpleMessage(
      "Toujours afficher uniquement les vidéos tendance",
    ),
    "imageCacheLabel": MessageLookupByLibrary.simpleMessage("Cache d\'images"),
    "importData": MessageLookupByLibrary.simpleMessage("Importer les données"),
    "importError": MessageLookupByLibrary.simpleMessage(
      "Échec de l\'importation",
    ),
    "importSubscriptions": MessageLookupByLibrary.simpleMessage(
      "Importer les abonnements",
    ),
    "importSuccess": MessageLookupByLibrary.simpleMessage(
      "Importation réussie",
    ),
    "includeTitle": MessageLookupByLibrary.simpleMessage("Inclure un titre"),
    "india": MessageLookupByLibrary.simpleMessage("Inde"),
    "instances": MessageLookupByLibrary.simpleMessage("Instances"),
    "interaction": MessageLookupByLibrary.simpleMessage("Interaction"),
    "intro": MessageLookupByLibrary.simpleMessage("Intro"),
    "language": MessageLookupByLibrary.simpleMessage("Langue"),
    "library": MessageLookupByLibrary.simpleMessage("Bibliothèque"),
    "like": MessageLookupByLibrary.simpleMessage("J\'aime"),
    "localPlaylists": MessageLookupByLibrary.simpleMessage("Playlists"),
    "logsLabel": MessageLookupByLibrary.simpleMessage("Journaux"),
    "merging": MessageLookupByLibrary.simpleMessage("Fusion"),
    "musicOfftopic": MessageLookupByLibrary.simpleMessage(
      "Musique : non musical",
    ),
    "netherlands": MessageLookupByLibrary.simpleMessage("Pays-Bas"),
    "newNameHint": MessageLookupByLibrary.simpleMessage("Nouveau nom"),
    "newPlaylist": MessageLookupByLibrary.simpleMessage("Nouvelle playlist"),
    "newPlaylistShort": MessageLookupByLibrary.simpleMessage("+ Nouveau"),
    "newProfileName": MessageLookupByLibrary.simpleMessage(
      "Nouveau nom de profil",
    ),
    "newVideoNotifications": MessageLookupByLibrary.simpleMessage(
      "Notifications de nouvelles vidéos",
    ),
    "newVideoNotificationsDescription": MessageLookupByLibrary.simpleMessage(
      "Soyez notifié quand les chaînes auxquelles vous êtes abonné publient",
    ),
    "noCommentsFound": MessageLookupByLibrary.simpleMessage(
      "Aucun commentaire trouvé",
    ),
    "noDownloads": MessageLookupByLibrary.simpleMessage("Aucun téléchargement"),
    "noDownloadsHint": MessageLookupByLibrary.simpleMessage(
      "Les vidéos téléchargées apparaîtront ici",
    ),
    "noHistory": MessageLookupByLibrary.simpleMessage("Aucun historique"),
    "noLogs": MessageLookupByLibrary.simpleMessage(
      "Aucun journal pour l\'instant",
    ),
    "noPlaylists": MessageLookupByLibrary.simpleMessage(
      "Aucune playlist disponible",
    ),
    "noPlaylistsYet": MessageLookupByLibrary.simpleMessage(
      "Aucune playlist pour l\'instant.\nAppuyez sur + pour en créer une.",
    ),
    "noPlaylistsYetPicker": MessageLookupByLibrary.simpleMessage(
      "Aucune playlist pour l\'instant.\nAppuyez sur + Nouveau pour en créer une.",
    ),
    "noSavedVideos": MessageLookupByLibrary.simpleMessage(
      "Aucune vidéo enregistrée",
    ),
    "noShorts": MessageLookupByLibrary.simpleMessage("Aucun Short disponible"),
    "noShortsHint": MessageLookupByLibrary.simpleMessage(
      "Short videos will appear here",
    ),
    "noSubscriptions": MessageLookupByLibrary.simpleMessage("Aucun abonnement"),
    "noSubscriptionsHint": MessageLookupByLibrary.simpleMessage(
      "Abonnez-vous à des chaînes pour voir leurs vidéos ici",
    ),
    "noUploadDate": MessageLookupByLibrary.simpleMessage("Aucune date"),
    "noUploaderName": MessageLookupByLibrary.simpleMessage("Aucun nom"),
    "noVideoAvailableChangedToHls": MessageLookupByLibrary.simpleMessage(
      "Aucune source vidéo disponible, HLS automatiquement sélectionné",
    ),
    "noVideoDescription": MessageLookupByLibrary.simpleMessage(
      "Aucune description",
    ),
    "noVideoTitle": MessageLookupByLibrary.simpleMessage("Aucun titre"),
    "noVideosFound": MessageLookupByLibrary.simpleMessage(
      "Aucune vidéo trouvée",
    ),
    "noVideosInPlaylist": MessageLookupByLibrary.simpleMessage(
      "Aucune vidéo pour l\'instant",
    ),
    "notificationsDenied": MessageLookupByLibrary.simpleMessage(
      "L\'autorisation de notification a été refusée",
    ),
    "openInBrowser": MessageLookupByLibrary.simpleMessage(
      "Ouvrir dans le navigateur",
    ),
    "openLinksExternally": MessageLookupByLibrary.simpleMessage(
      "Ouvrir les liens dans le navigateur externe",
    ),
    "outro": MessageLookupByLibrary.simpleMessage("Outro"),
    "pause": MessageLookupByLibrary.simpleMessage("Pause"),
    "pauseOnCall": MessageLookupByLibrary.simpleMessage(
      "Pause lors d\'un appel",
    ),
    "pauseOnHeadphones": MessageLookupByLibrary.simpleMessage(
      "Pause à la déconnexion du casque",
    ),
    "paused": MessageLookupByLibrary.simpleMessage("En pause"),
    "pending": MessageLookupByLibrary.simpleMessage("En attente"),
    "pinned": MessageLookupByLibrary.simpleMessage("Épinglé"),
    "platformLabel": MessageLookupByLibrary.simpleMessage("Plateforme"),
    "playAll": MessageLookupByLibrary.simpleMessage("Tout lire"),
    "playNext": MessageLookupByLibrary.simpleMessage("Lire ensuite"),
    "playlist": MessageLookupByLibrary.simpleMessage("Playlist"),
    "playlistNameHint": MessageLookupByLibrary.simpleMessage(
      "Nom de la playlist",
    ),
    "playlistNotFound": MessageLookupByLibrary.simpleMessage(
      "Playlist introuvable",
    ),
    "playlists": MessageLookupByLibrary.simpleMessage("Playlists"),
    "pluginCapabilityChannel": MessageLookupByLibrary.simpleMessage(
      "Channel metadata",
    ),
    "pluginCapabilityDiagnostics": MessageLookupByLibrary.simpleMessage(
      "Diagnostics",
    ),
    "pluginCapabilityNetwork": MessageLookupByLibrary.simpleMessage(
      "Network access",
    ),
    "pluginCapabilityPlayback": MessageLookupByLibrary.simpleMessage(
      "Playback",
    ),
    "pluginCapabilitySearch": MessageLookupByLibrary.simpleMessage(
      "Search content",
    ),
    "pluginCapabilitySettingsRead": MessageLookupByLibrary.simpleMessage(
      "Read settings",
    ),
    "pluginCapabilityTrending": MessageLookupByLibrary.simpleMessage(
      "Trending / home feed",
    ),
    "pluginContributions": MessageLookupByLibrary.simpleMessage(
      "Plugin contributions",
    ),
    "pluginContributionsDescription": MessageLookupByLibrary.simpleMessage(
      "Extensions published by installed plugins. A contribution appears once its plugin is enabled and the capability it needs is granted.",
    ),
    "pluginContributionsNone": MessageLookupByLibrary.simpleMessage(
      "No plugin contributions available yet.",
    ),
    "pluginInfo": MessageLookupByLibrary.simpleMessage("Plugin info"),
    "pluginMenuContributions": MessageLookupByLibrary.simpleMessage(
      "Plugin menu items",
    ),
    "pluginPermissions": MessageLookupByLibrary.simpleMessage(
      "Permissions des plugins",
    ),
    "pluginPermissionsAllGranted": MessageLookupByLibrary.simpleMessage(
      "All granted",
    ),
    "pluginPermissionsApplyNow": MessageLookupByLibrary.simpleMessage(
      "Apply now",
    ),
    "pluginPermissionsCustomDescription": MessageLookupByLibrary.simpleMessage(
      "Some capabilities for this plugin have been revoked. Revoked capabilities cannot be used until re-granted.",
    ),
    "pluginPermissionsCustomPolicy": MessageLookupByLibrary.simpleMessage(
      "Custom policy",
    ),
    "pluginPermissionsDefaultDescription": MessageLookupByLibrary.simpleMessage(
      "This plugin has not been restricted. It may use every capability it declared. You can revoke individual capabilities below.",
    ),
    "pluginPermissionsDefaultPolicy": MessageLookupByLibrary.simpleMessage(
      "Default policy",
    ),
    "pluginPermissionsDenied": MessageLookupByLibrary.simpleMessage("denied"),
    "pluginPermissionsDescription": MessageLookupByLibrary.simpleMessage(
      "Control which capabilities each installed plugin can use.",
    ),
    "pluginPermissionsGranted": MessageLookupByLibrary.simpleMessage("granted"),
    "pluginPermissionsNone": MessageLookupByLibrary.simpleMessage(
      "No plugins installed yet.",
    ),
    "pluginPermissionsNoneDeclared": MessageLookupByLibrary.simpleMessage(
      "This plugin does not declare any capabilities.",
    ),
    "pluginPermissionsNotDeclared": MessageLookupByLibrary.simpleMessage(
      "Not declared by this plugin",
    ),
    "pluginPermissionsReloadRequiredDescription":
        MessageLookupByLibrary.simpleMessage(
          "To apply new permissions to a running plugin, it must be disabled and re-enabled. Its current session keeps the old permissions until reloaded.",
        ),
    "pluginPermissionsReloadRequiredTitle":
        MessageLookupByLibrary.simpleMessage(
          "Permission change requires reload",
        ),
    "pluginPermissionsReloaded": MessageLookupByLibrary.simpleMessage(
      "Plugin permissions applied.",
    ),
    "pluginPermissionsRestricted": MessageLookupByLibrary.simpleMessage(
      "Restricted capabilities",
    ),
    "pluginPermissionsRestrictedDescription": MessageLookupByLibrary.simpleMessage(
      "The following capabilities were declared by the plugin but are not granted. The plugin cannot use them until you grant them here.",
    ),
    "profileInUse": MessageLookupByLibrary.simpleMessage("Actif"),
    "profileName": MessageLookupByLibrary.simpleMessage("Nom du profil"),
    "profiles": MessageLookupByLibrary.simpleMessage("Profils"),
    "profilesDescription": MessageLookupByLibrary.simpleMessage(
      "Créez des profils séparés pour différents comptes ou préférences",
    ),
    "quality1080p": MessageLookupByLibrary.simpleMessage("1080p"),
    "quality1440p": MessageLookupByLibrary.simpleMessage("1440p"),
    "quality144p": MessageLookupByLibrary.simpleMessage("144p"),
    "quality240p": MessageLookupByLibrary.simpleMessage("240p"),
    "quality360p": MessageLookupByLibrary.simpleMessage("360p"),
    "quality480p": MessageLookupByLibrary.simpleMessage("480p"),
    "quality720p": MessageLookupByLibrary.simpleMessage("720p"),
    "queue": MessageLookupByLibrary.simpleMessage("File d\'attente"),
    "queueClear": MessageLookupByLibrary.simpleMessage("Effacer"),
    "queueEmpty": MessageLookupByLibrary.simpleMessage(
      "La file d\'attente est vide",
    ),
    "queueShuffle": MessageLookupByLibrary.simpleMessage("Aléatoire"),
    "readMoreText": MessageLookupByLibrary.simpleMessage("Lire plus"),
    "recentSearches": MessageLookupByLibrary.simpleMessage(
      "Recherches récentes",
    ),
    "refresh": MessageLookupByLibrary.simpleMessage("Refresh"),
    "refreshToLoad": MessageLookupByLibrary.simpleMessage(
      "Tirez vers le bas pour actualiser",
    ),
    "region": MessageLookupByLibrary.simpleMessage("Région"),
    "relatedTitle": MessageLookupByLibrary.simpleMessage("Similaire"),
    "removeFromHistory": MessageLookupByLibrary.simpleMessage(
      "Retirer de l\'historique",
    ),
    "removeFromQueue": MessageLookupByLibrary.simpleMessage(
      "Retirer de la file",
    ),
    "removeFromSaved": MessageLookupByLibrary.simpleMessage(
      "Retirer des enregistrements",
    ),
    "renameAction": MessageLookupByLibrary.simpleMessage("Renommer"),
    "renamePlaylistTitle": MessageLookupByLibrary.simpleMessage(
      "Renommer la playlist",
    ),
    "renameProfile": MessageLookupByLibrary.simpleMessage("Renommer le profil"),
    "repliesNotSupported": MessageLookupByLibrary.simpleMessage(
      "Les réponses ne sont pas encore disponibles",
    ),
    "repliesPlural": m5,
    "resume": MessageLookupByLibrary.simpleMessage("Reprendre"),
    "retrieveDislikeCounts": MessageLookupByLibrary.simpleMessage(
      "Récupérer le compteur de dislikes",
    ),
    "retrieveDislikes": MessageLookupByLibrary.simpleMessage(
      "Récupérer les dislikes",
    ),
    "retry": MessageLookupByLibrary.simpleMessage("Réessayer"),
    "saveToDevice": MessageLookupByLibrary.simpleMessage(
      "Enregistrer sur l\'appareil",
    ),
    "saveToDeviceFailed": MessageLookupByLibrary.simpleMessage(
      "Échec de l\'enregistrement sur l\'appareil",
    ),
    "saveToPlaylist": MessageLookupByLibrary.simpleMessage(
      "Enregistrer dans une playlist",
    ),
    "saved": MessageLookupByLibrary.simpleMessage("Sauvegardées"),
    "savedToDevice": MessageLookupByLibrary.simpleMessage(
      "Enregistré sur l\'appareil",
    ),
    "savedVideosTitle": MessageLookupByLibrary.simpleMessage(
      "Vidéos enregistrées",
    ),
    "savingToDevice": MessageLookupByLibrary.simpleMessage(
      "Enregistrement sur l\'appareil...",
    ),
    "search": MessageLookupByLibrary.simpleMessage("Rechercher"),
    "searchFilters": MessageLookupByLibrary.simpleMessage("Filtres"),
    "searchForVideosChannels": MessageLookupByLibrary.simpleMessage(
      "Rechercher des vidéos, chaînes et playlists",
    ),
    "searchHistoryEnabled": MessageLookupByLibrary.simpleMessage(
      "Enregistrer l\'historique de recherche",
    ),
    "searchHistoryEnabledDescription": MessageLookupByLibrary.simpleMessage(
      "Enregistrez vos recherches pour un accès rapide",
    ),
    "searchSavedVideos": MessageLookupByLibrary.simpleMessage(
      "Rechercher dans les vidéos enregistrées...",
    ),
    "searchSubscriptions": MessageLookupByLibrary.simpleMessage(
      "Rechercher dans les abonnements...",
    ),
    "searchYouTube": MessageLookupByLibrary.simpleMessage(
      "Rechercher sur YouTube...",
    ),
    "seconds": MessageLookupByLibrary.simpleMessage("secondes"),
    "selectAll": MessageLookupByLibrary.simpleMessage("Tout sélectionner"),
    "selectFile": MessageLookupByLibrary.simpleMessage(
      "Sélectionner un fichier",
    ),
    "selectVideos": MessageLookupByLibrary.simpleMessage(
      "Sélectionner des vidéos",
    ),
    "selected": MessageLookupByLibrary.simpleMessage("sélectionné"),
    "selfPromotion": MessageLookupByLibrary.simpleMessage("Auto-promotion"),
    "serviceExplode": MessageLookupByLibrary.simpleMessage("Explode"),
    "serviceInvidious": MessageLookupByLibrary.simpleMessage("Invidious"),
    "serviceNewPipe": MessageLookupByLibrary.simpleMessage("NewPipe Extractor"),
    "servicePiped": MessageLookupByLibrary.simpleMessage("Piped"),
    "settings": MessageLookupByLibrary.simpleMessage("Paramètres"),
    "share": MessageLookupByLibrary.simpleMessage("Partager"),
    "shareLogs": MessageLookupByLibrary.simpleMessage("Partager les journaux"),
    "shareVia": MessageLookupByLibrary.simpleMessage("Partager via"),
    "shorts": MessageLookupByLibrary.simpleMessage("Shorts"),
    "showLessText": MessageLookupByLibrary.simpleMessage("Voir moins"),
    "showSearchHistory": MessageLookupByLibrary.simpleMessage(
      "Afficher l\'historique de recherche",
    ),
    "showSearchHistoryDescription": MessageLookupByLibrary.simpleMessage(
      "Afficher vos recherches récentes dans l\'écran de recherche",
    ),
    "skipInterval": MessageLookupByLibrary.simpleMessage("Intervalle de saut"),
    "skipIntervalDescription": MessageLookupByLibrary.simpleMessage(
      "Durée du saut par double-tap en secondes",
    ),
    "sleepTimer": MessageLookupByLibrary.simpleMessage("Minuteur de sommeil"),
    "sleepTimerCustom": MessageLookupByLibrary.simpleMessage("Personnalisé"),
    "sleepTimerCustomTitle": MessageLookupByLibrary.simpleMessage(
      "Minuteur personnalisé",
    ),
    "sleepTimerEndOfVideo": MessageLookupByLibrary.simpleMessage(
      "Fin de la vidéo",
    ),
    "sleepTimerEnded": MessageLookupByLibrary.simpleMessage(
      "Minuteur de sommeil terminé",
    ),
    "sleepTimerEnterMinutes": MessageLookupByLibrary.simpleMessage(
      "Saisir les minutes",
    ),
    "sleepTimerMinutes": m6,
    "sleepTimerMinutesShort": m7,
    "sleepTimerOff": MessageLookupByLibrary.simpleMessage("Désactivé"),
    "sleepTimerSet": MessageLookupByLibrary.simpleMessage("Définir"),
    "sort": MessageLookupByLibrary.simpleMessage("Trier"),
    "sortBy": MessageLookupByLibrary.simpleMessage("Trier par"),
    "sponsor": MessageLookupByLibrary.simpleMessage("Sponsor"),
    "sponsorBlock": MessageLookupByLibrary.simpleMessage("SponsorBlock"),
    "sponsorBlockCategories": MessageLookupByLibrary.simpleMessage(
      "Catégories à ignorer",
    ),
    "sponsorBlockDescription": MessageLookupByLibrary.simpleMessage(
      "Ignorer automatiquement les segments sponsorisés",
    ),
    "startDownload": MessageLookupByLibrary.simpleMessage(
      "Démarrer le téléchargement",
    ),
    "startSavingVideos": MessageLookupByLibrary.simpleMessage(
      "Enregistrez des vidéos pour les regarder plus tard",
    ),
    "subscribe": MessageLookupByLibrary.simpleMessage("S\'abonner"),
    "subscriptions": MessageLookupByLibrary.simpleMessage("Abonnements"),
    "subtitleSize": MessageLookupByLibrary.simpleMessage(
      "Taille des sous-titres",
    ),
    "subtitleSizeDescription": MessageLookupByLibrary.simpleMessage(
      "Ajuster la taille des sous-titres sur la vidéo",
    ),
    "subtitleSizeExtraLarge": MessageLookupByLibrary.simpleMessage(
      "Très grande",
    ),
    "subtitleSizeLarge": MessageLookupByLibrary.simpleMessage("Grande"),
    "subtitleSizeMedium": MessageLookupByLibrary.simpleMessage("Moyenne"),
    "subtitleSizeSmall": MessageLookupByLibrary.simpleMessage("Petite"),
    "swipeDownToDismissDisabled": MessageLookupByLibrary.simpleMessage(
      "« Glisser vers le bas pour ignorer » désactivé",
    ),
    "swipeUpToDismissEnabled": MessageLookupByLibrary.simpleMessage(
      "« Glisser vers le haut pour ignorer » activé",
    ),
    "switchProfile": MessageLookupByLibrary.simpleMessage("Changer de profil"),
    "switchRegion": MessageLookupByLibrary.simpleMessage(
      "Merci de sélectionner une autre région pour de meilleurs résultats.",
    ),
    "theme": MessageLookupByLibrary.simpleMessage("Thème"),
    "themeDark": MessageLookupByLibrary.simpleMessage("Sombre"),
    "themeDynamic": MessageLookupByLibrary.simpleMessage("Material You"),
    "themeLight": MessageLookupByLibrary.simpleMessage("Clair"),
    "themeOled": MessageLookupByLibrary.simpleMessage("Noir OLED"),
    "themeSystem": MessageLookupByLibrary.simpleMessage("Système"),
    "thereIsNoSavedOrHistoryVideos": MessageLookupByLibrary.simpleMessage(
      "Il n\'y a pas de vidéos enregistrées, ni d\'historique",
    ),
    "thereIsNoSavedVideos": MessageLookupByLibrary.simpleMessage(
      "Il n\'y a pas de vidéos enregistrées",
    ),
    "title": MessageLookupByLibrary.simpleMessage("Titre"),
    "translators": MessageLookupByLibrary.simpleMessage("Traducteurs"),
    "trending": MessageLookupByLibrary.simpleMessage("Tendance"),
    "unitedKingdom": MessageLookupByLibrary.simpleMessage("Angleterre"),
    "unitedStates": MessageLookupByLibrary.simpleMessage("États-Unis"),
    "unknown": MessageLookupByLibrary.simpleMessage("inconnu"),
    "unknownError": MessageLookupByLibrary.simpleMessage(
      "Une erreur inconnue s\'est produite",
    ),
    "unknownQuality": MessageLookupByLibrary.simpleMessage("Qualité inconnue"),
    "unsubscribe": MessageLookupByLibrary.simpleMessage("Se désabonner"),
    "unsubscribeConfirm": MessageLookupByLibrary.simpleMessage(
      "Se désabonner de cette chaîne ?",
    ),
    "version": MessageLookupByLibrary.simpleMessage("Version"),
    "video": MessageLookupByLibrary.simpleMessage("Vidéo"),
    "videoAudio": MessageLookupByLibrary.simpleMessage("Vidéo+audio"),
    "videoCountLabel": m8,
    "videoFit": MessageLookupByLibrary.simpleMessage("Ajustement vidéo"),
    "videoFitContain": MessageLookupByLibrary.simpleMessage("Contenir"),
    "videoFitCover": MessageLookupByLibrary.simpleMessage("Couvrir"),
    "videoFitFill": MessageLookupByLibrary.simpleMessage("Remplir"),
    "videoFitFitHeight": MessageLookupByLibrary.simpleMessage(
      "Ajuster à la hauteur",
    ),
    "videoFitFitWidth": MessageLookupByLibrary.simpleMessage(
      "Ajuster à la largeur",
    ),
    "videoOnly": MessageLookupByLibrary.simpleMessage("Vidéo seule"),
    "videoQuality": MessageLookupByLibrary.simpleMessage("Qualité vidéo"),
    "videoViews": m9,
    "videoWithAudio": MessageLookupByLibrary.simpleMessage("Vidéo + audio"),
    "videos": MessageLookupByLibrary.simpleMessage("Vidéos"),
    "views": MessageLookupByLibrary.simpleMessage("vues"),
    "watchSomeVideos": MessageLookupByLibrary.simpleMessage(
      "Les vidéos que vous regardez apparaîtront ici",
    ),
    "youtubeService": MessageLookupByLibrary.simpleMessage("Service YouTube"),
  };
}
