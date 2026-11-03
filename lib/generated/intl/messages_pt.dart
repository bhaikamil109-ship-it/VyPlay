// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pt locale. All the
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
  String get localeName => 'pt';

  static String m0(name) => "Adicionado a ${name}";

  static String m1(device) => "Transmitindo para ${device}";

  static String m2(count) =>
      "${Intl.plural(count, zero: 'Sem assinantes', one: 'assinante', other: 'assinantes')}";

  static String m3(name) => "Excluir ${name}?";

  static String m4(title) => "Falha no download: ${title}";

  static String m5(count) =>
      "${Intl.plural(count, one: 'Resposta', other: 'Respostas')}";

  static String m6(count) => "${count} minutos";

  static String m7(count) => "${count} min";

  static String m8(count) => "${count} vídeos";

  static String m9(count) =>
      "${Intl.plural(count, zero: 'Sem visualizações', one: 'visualização', other: 'visualizações')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "about": MessageLookupByLibrary.simpleMessage("Sobre"),
    "addProfile": MessageLookupByLibrary.simpleMessage("Adicionar perfil"),
    "addToQueue": MessageLookupByLibrary.simpleMessage("Adicionar à fila"),
    "addVideosHint": MessageLookupByLibrary.simpleMessage(
      "Pressione e segure um vídeo para salvá-lo em uma playlist",
    ),
    "addedToPlayNext": MessageLookupByLibrary.simpleMessage(
      "Adicionado para reproduzir a seguir",
    ),
    "addedToPlaylist": m0,
    "addedToQueue": MessageLookupByLibrary.simpleMessage("Adicionado à fila"),
    "all": MessageLookupByLibrary.simpleMessage("Tudo"),
    "audio": MessageLookupByLibrary.simpleMessage("Áudio"),
    "audioFocus": MessageLookupByLibrary.simpleMessage("Foco de áudio"),
    "audioFocusDescription": MessageLookupByLibrary.simpleMessage(
      "Pausar a reprodução em interrupções",
    ),
    "audioOnly": MessageLookupByLibrary.simpleMessage("Somente áudio"),
    "audioQuality": MessageLookupByLibrary.simpleMessage("Qualidade do áudio"),
    "autoPip": MessageLookupByLibrary.simpleMessage(
      "Picture-in-picture automático",
    ),
    "autoPipDescription": MessageLookupByLibrary.simpleMessage(
      "Entrar automaticamente no modo PiP ao pressionar o botão inicial durante a reprodução",
    ),
    "autoScrollOff": MessageLookupByLibrary.simpleMessage(
      "Rolagem automática desativada",
    ),
    "autoScrollOn": MessageLookupByLibrary.simpleMessage(
      "Rolagem automática ativada",
    ),
    "backupRestore": MessageLookupByLibrary.simpleMessage(
      "Backup e restauração",
    ),
    "backupRestoreDescription": MessageLookupByLibrary.simpleMessage(
      "Exporte ou importe suas inscrições",
    ),
    "canada": MessageLookupByLibrary.simpleMessage("Canadá"),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancelar"),
    "cancelled": MessageLookupByLibrary.simpleMessage("Cancelado"),
    "cannotDeleteDefault": MessageLookupByLibrary.simpleMessage(
      "Não é possível excluir o perfil padrão",
    ),
    "cannotRenameDefault": MessageLookupByLibrary.simpleMessage(
      "Não é possível renomear o perfil padrão",
    ),
    "castConnected": MessageLookupByLibrary.simpleMessage("Conectado"),
    "castConnectedTo": m1,
    "castFailed": MessageLookupByLibrary.simpleMessage(
      "Este vídeo não pode ser transmitido",
    ),
    "castStop": MessageLookupByLibrary.simpleMessage("Parar transmissão"),
    "castTitle": MessageLookupByLibrary.simpleMessage("Transmitir"),
    "castUnavailable": MessageLookupByLibrary.simpleMessage(
      "A transmissão não está disponível neste dispositivo",
    ),
    "channelSubscribers": m2,
    "channels": MessageLookupByLibrary.simpleMessage("Canais"),
    "clearAll": MessageLookupByLibrary.simpleMessage("Limpar tudo"),
    "clearAllHistory": MessageLookupByLibrary.simpleMessage(
      "Limpar todo o histórico",
    ),
    "clearAllHistoryConfirm": MessageLookupByLibrary.simpleMessage(
      "Tem certeza de que deseja limpar todo o histórico de exibição?",
    ),
    "clearAllSaved": MessageLookupByLibrary.simpleMessage(
      "Limpar todos os salvos",
    ),
    "clearAllSavedConfirm": MessageLookupByLibrary.simpleMessage(
      "Tem certeza de que deseja remover todos os vídeos salvos?",
    ),
    "clearLogs": MessageLookupByLibrary.simpleMessage("Limpar logs"),
    "commentAuthorNotFound": MessageLookupByLibrary.simpleMessage(
      "Não encontrado",
    ),
    "commentsDisabled": MessageLookupByLibrary.simpleMessage(
      "Os comentários estão desativados",
    ),
    "commonSettingsTitle": MessageLookupByLibrary.simpleMessage("Comum"),
    "completed": MessageLookupByLibrary.simpleMessage("Concluído"),
    "copiedToClipboard": MessageLookupByLibrary.simpleMessage(
      "Copiado para a área de transferência",
    ),
    "copyLink": MessageLookupByLibrary.simpleMessage("Copiar link"),
    "createAction": MessageLookupByLibrary.simpleMessage("Criar"),
    "dateAdded": MessageLookupByLibrary.simpleMessage("Data de adição"),
    "debugConsole": MessageLookupByLibrary.simpleMessage(
      "Console de depuração",
    ),
    "defaultProfile": MessageLookupByLibrary.simpleMessage("Padrão"),
    "defaultQuality": MessageLookupByLibrary.simpleMessage("Qualidade padrão"),
    "delete": MessageLookupByLibrary.simpleMessage("Excluir"),
    "deleteDownload": MessageLookupByLibrary.simpleMessage("Excluir download"),
    "deleteDownloadConfirm": MessageLookupByLibrary.simpleMessage(
      "Tem certeza de que deseja excluir este download?",
    ),
    "deletePlaylistAction": MessageLookupByLibrary.simpleMessage(
      "Excluir playlist",
    ),
    "deletePlaylistConfirm": m3,
    "deletePlaylistTitle": MessageLookupByLibrary.simpleMessage(
      "Excluir playlist",
    ),
    "deleteProfile": MessageLookupByLibrary.simpleMessage("Excluir perfil"),
    "deleteVideo": MessageLookupByLibrary.simpleMessage("Excluir vídeo"),
    "deleteVideoConfirm": MessageLookupByLibrary.simpleMessage(
      "Tem certeza de que deseja remover este vídeo?",
    ),
    "developer": MessageLookupByLibrary.simpleMessage("Desenvolvedor"),
    "disablePipPlayer": MessageLookupByLibrary.simpleMessage(
      "Disable PIP player",
    ),
    "disableVideoHistory": MessageLookupByLibrary.simpleMessage(
      "Desativar histórico de vídeos",
    ),
    "dislike": MessageLookupByLibrary.simpleMessage("Não gostei"),
    "distractionFree": MessageLookupByLibrary.simpleMessage("Sem distração"),
    "download": MessageLookupByLibrary.simpleMessage("Baixar"),
    "downloadFailed": m4,
    "downloadStarted": MessageLookupByLibrary.simpleMessage(
      "Download iniciado",
    ),
    "downloadType": MessageLookupByLibrary.simpleMessage("Tipo de download"),
    "downloading": MessageLookupByLibrary.simpleMessage("Baixando"),
    "downloadingAudio": MessageLookupByLibrary.simpleMessage("Baixando áudio"),
    "downloadingVideo": MessageLookupByLibrary.simpleMessage("Baixando vídeo"),
    "downloads": MessageLookupByLibrary.simpleMessage("Downloads"),
    "duration": MessageLookupByLibrary.simpleMessage("Duração"),
    "enableHlsPlayerDescription": MessageLookupByLibrary.simpleMessage(
      "Ativa tocador HLS para habilitar todas as opções de qualidade.\nDesativar em caso de erros.",
    ),
    "exportData": MessageLookupByLibrary.simpleMessage("Exportar dados"),
    "exportSubscriptions": MessageLookupByLibrary.simpleMessage(
      "Exportar inscrições",
    ),
    "exportSuccess": MessageLookupByLibrary.simpleMessage(
      "Exportação concluída",
    ),
    "failed": MessageLookupByLibrary.simpleMessage("Falhou"),
    "failedToOpenFile": MessageLookupByLibrary.simpleMessage(
      "Falha ao abrir o arquivo",
    ),
    "fileNotFound": MessageLookupByLibrary.simpleMessage(
      "Arquivo não encontrado",
    ),
    "filterAll": MessageLookupByLibrary.simpleMessage("Tudo"),
    "filterChannels": MessageLookupByLibrary.simpleMessage("Canais"),
    "filterMusic": MessageLookupByLibrary.simpleMessage("Música"),
    "filterPlaylists": MessageLookupByLibrary.simpleMessage("Playlists"),
    "filterVideos": MessageLookupByLibrary.simpleMessage("Vídeos"),
    "france": MessageLookupByLibrary.simpleMessage("França"),
    "hideComments": MessageLookupByLibrary.simpleMessage(
      "Esconder Comentários",
    ),
    "hideCommentsButtonFromWatchScreen": MessageLookupByLibrary.simpleMessage(
      "Esconde botão comentários da tela.",
    ),
    "hideRelated": MessageLookupByLibrary.simpleMessage(
      "Esconder Relacionados",
    ),
    "hideRelatedVideosFromWatchScreen": MessageLookupByLibrary.simpleMessage(
      "Esconde vídeos relacionados da tela",
    ),
    "history": MessageLookupByLibrary.simpleMessage("Histórico"),
    "hlsPlayer": MessageLookupByLibrary.simpleMessage("Tocador Hls"),
    "home": MessageLookupByLibrary.simpleMessage("Início"),
    "homeFeedMode": MessageLookupByLibrary.simpleMessage("Feed inicial"),
    "homeFeedModeAuto": MessageLookupByLibrary.simpleMessage("Automático"),
    "homeFeedModeAutoHint": MessageLookupByLibrary.simpleMessage(
      "Mostrar inscrições se houver, caso contrário em alta",
    ),
    "homeFeedModeFeedOnly": MessageLookupByLibrary.simpleMessage("Inscrições"),
    "homeFeedModeFeedOnlyHint": MessageLookupByLibrary.simpleMessage(
      "Mostrar apenas vídeos de canais inscritos",
    ),
    "homeFeedModeTrendingOnly": MessageLookupByLibrary.simpleMessage("Em alta"),
    "homeFeedModeTrendingOnlyHint": MessageLookupByLibrary.simpleMessage(
      "Mostrar sempre apenas vídeos em alta",
    ),
    "imageCacheLabel": MessageLookupByLibrary.simpleMessage("Cache de imagens"),
    "importData": MessageLookupByLibrary.simpleMessage("Importar dados"),
    "importError": MessageLookupByLibrary.simpleMessage("Falha na importação"),
    "importSubscriptions": MessageLookupByLibrary.simpleMessage(
      "Importar inscrições",
    ),
    "importSuccess": MessageLookupByLibrary.simpleMessage(
      "Importação concluída",
    ),
    "includeTitle": MessageLookupByLibrary.simpleMessage("Incluir título"),
    "india": MessageLookupByLibrary.simpleMessage("Índia"),
    "instances": MessageLookupByLibrary.simpleMessage("Instâncias"),
    "interaction": MessageLookupByLibrary.simpleMessage("Interação"),
    "intro": MessageLookupByLibrary.simpleMessage("Introdução"),
    "language": MessageLookupByLibrary.simpleMessage("Idioma"),
    "library": MessageLookupByLibrary.simpleMessage("Biblioteca"),
    "like": MessageLookupByLibrary.simpleMessage("Gostei"),
    "localPlaylists": MessageLookupByLibrary.simpleMessage("Playlists"),
    "logsLabel": MessageLookupByLibrary.simpleMessage("Logs"),
    "merging": MessageLookupByLibrary.simpleMessage("Mesclando"),
    "musicOfftopic": MessageLookupByLibrary.simpleMessage(
      "Música: não musical",
    ),
    "netherlands": MessageLookupByLibrary.simpleMessage("Holanda"),
    "newNameHint": MessageLookupByLibrary.simpleMessage("Novo nome"),
    "newPlaylist": MessageLookupByLibrary.simpleMessage("Nova playlist"),
    "newPlaylistShort": MessageLookupByLibrary.simpleMessage("+ Nova"),
    "newProfileName": MessageLookupByLibrary.simpleMessage(
      "Novo nome do perfil",
    ),
    "newVideoNotifications": MessageLookupByLibrary.simpleMessage(
      "Notificações de novos vídeos",
    ),
    "newVideoNotificationsDescription": MessageLookupByLibrary.simpleMessage(
      "Receba notificações quando canais inscritos enviarem vídeos",
    ),
    "noCommentsFound": MessageLookupByLibrary.simpleMessage(
      "No Comments Found",
    ),
    "noDownloads": MessageLookupByLibrary.simpleMessage("Nenhum download"),
    "noDownloadsHint": MessageLookupByLibrary.simpleMessage(
      "Os vídeos baixados aparecerão aqui",
    ),
    "noHistory": MessageLookupByLibrary.simpleMessage(
      "Sem histórico de exibição",
    ),
    "noLogs": MessageLookupByLibrary.simpleMessage("Nenhum log ainda"),
    "noPlaylists": MessageLookupByLibrary.simpleMessage(
      "Nenhuma playlist disponível",
    ),
    "noPlaylistsYet": MessageLookupByLibrary.simpleMessage(
      "Nenhuma playlist ainda.\nToque em + para criar uma.",
    ),
    "noPlaylistsYetPicker": MessageLookupByLibrary.simpleMessage(
      "Nenhuma playlist ainda.\nToque em + Nova para criar uma.",
    ),
    "noSavedVideos": MessageLookupByLibrary.simpleMessage("Nenhum vídeo salvo"),
    "noShorts": MessageLookupByLibrary.simpleMessage("Nenhum Short disponível"),
    "noShortsHint": MessageLookupByLibrary.simpleMessage(
      "Short videos will appear here",
    ),
    "noSubscriptions": MessageLookupByLibrary.simpleMessage("Sem inscrições"),
    "noSubscriptionsHint": MessageLookupByLibrary.simpleMessage(
      "Inscreva-se em canais para ver os vídeos deles aqui",
    ),
    "noUploadDate": MessageLookupByLibrary.simpleMessage("Sem data"),
    "noUploaderName": MessageLookupByLibrary.simpleMessage("Sem nome"),
    "noVideoAvailableChangedToHls": MessageLookupByLibrary.simpleMessage(
      "Nenhuma fonte de vídeo disponível, mudando automaticamente para hls",
    ),
    "noVideoDescription": MessageLookupByLibrary.simpleMessage("Sem descrição"),
    "noVideoTitle": MessageLookupByLibrary.simpleMessage("Sem título"),
    "noVideosFound": MessageLookupByLibrary.simpleMessage(
      "Nenhum vídeo encontrado",
    ),
    "noVideosInPlaylist": MessageLookupByLibrary.simpleMessage(
      "Nenhum vídeo ainda",
    ),
    "notificationsDenied": MessageLookupByLibrary.simpleMessage(
      "A permissão de notificação foi negada",
    ),
    "openInBrowser": MessageLookupByLibrary.simpleMessage("Abrir no navegador"),
    "openLinksExternally": MessageLookupByLibrary.simpleMessage(
      "Abrir links no navegador externo",
    ),
    "outro": MessageLookupByLibrary.simpleMessage("Encerramento"),
    "pause": MessageLookupByLibrary.simpleMessage("Pausar"),
    "pauseOnCall": MessageLookupByLibrary.simpleMessage(
      "Pausar em chamada telefônica",
    ),
    "pauseOnHeadphones": MessageLookupByLibrary.simpleMessage(
      "Pausar ao desconectar fones",
    ),
    "paused": MessageLookupByLibrary.simpleMessage("Pausado"),
    "pending": MessageLookupByLibrary.simpleMessage("Pendente"),
    "pinned": MessageLookupByLibrary.simpleMessage("Fixado"),
    "platformLabel": MessageLookupByLibrary.simpleMessage("Plataforma"),
    "playAll": MessageLookupByLibrary.simpleMessage("Reproduzir tudo"),
    "playNext": MessageLookupByLibrary.simpleMessage("Reproduzir a seguir"),
    "playlist": MessageLookupByLibrary.simpleMessage("Playlist"),
    "playlistNameHint": MessageLookupByLibrary.simpleMessage(
      "Nome da playlist",
    ),
    "playlistNotFound": MessageLookupByLibrary.simpleMessage(
      "Playlist não encontrada",
    ),
    "playlists": MessageLookupByLibrary.simpleMessage("Playlists"),
    "profileInUse": MessageLookupByLibrary.simpleMessage("Ativo"),
    "profileName": MessageLookupByLibrary.simpleMessage("Nome do perfil"),
    "profiles": MessageLookupByLibrary.simpleMessage("Perfis"),
    "profilesDescription": MessageLookupByLibrary.simpleMessage(
      "Crie perfis separados para contas ou preferências diferentes",
    ),
    "quality1080p": MessageLookupByLibrary.simpleMessage("1080p"),
    "quality1440p": MessageLookupByLibrary.simpleMessage("1440p"),
    "quality144p": MessageLookupByLibrary.simpleMessage("144p"),
    "quality240p": MessageLookupByLibrary.simpleMessage("240p"),
    "quality360p": MessageLookupByLibrary.simpleMessage("360p"),
    "quality480p": MessageLookupByLibrary.simpleMessage("480p"),
    "quality720p": MessageLookupByLibrary.simpleMessage("720p"),
    "queue": MessageLookupByLibrary.simpleMessage("Fila"),
    "queueClear": MessageLookupByLibrary.simpleMessage("Limpar"),
    "queueEmpty": MessageLookupByLibrary.simpleMessage("A fila está vazia"),
    "queueShuffle": MessageLookupByLibrary.simpleMessage("Aleatório"),
    "readMoreText": MessageLookupByLibrary.simpleMessage("Ler mais"),
    "recentSearches": MessageLookupByLibrary.simpleMessage(
      "Pesquisas recentes",
    ),
    "refresh": MessageLookupByLibrary.simpleMessage("Refresh"),
    "refreshToLoad": MessageLookupByLibrary.simpleMessage(
      "Puxe para baixo para atualizar",
    ),
    "region": MessageLookupByLibrary.simpleMessage("Região"),
    "relatedTitle": MessageLookupByLibrary.simpleMessage("Relacionado"),
    "removeFromHistory": MessageLookupByLibrary.simpleMessage(
      "Remover do histórico",
    ),
    "removeFromQueue": MessageLookupByLibrary.simpleMessage("Remover da fila"),
    "removeFromSaved": MessageLookupByLibrary.simpleMessage(
      "Remover dos salvos",
    ),
    "renameAction": MessageLookupByLibrary.simpleMessage("Renomear"),
    "renamePlaylistTitle": MessageLookupByLibrary.simpleMessage(
      "Renomear playlist",
    ),
    "renameProfile": MessageLookupByLibrary.simpleMessage("Renomear perfil"),
    "repliesNotSupported": MessageLookupByLibrary.simpleMessage(
      "As respostas ainda não estão disponíveis",
    ),
    "repliesPlural": m5,
    "resume": MessageLookupByLibrary.simpleMessage("Retomar"),
    "retrieveDislikeCounts": MessageLookupByLibrary.simpleMessage(
      "Recupera contagem de dislikes",
    ),
    "retrieveDislikes": MessageLookupByLibrary.simpleMessage(
      "Recuperar Dislikes",
    ),
    "retry": MessageLookupByLibrary.simpleMessage("Tenta novamente"),
    "saveToDevice": MessageLookupByLibrary.simpleMessage(
      "Salvar no dispositivo",
    ),
    "saveToDeviceFailed": MessageLookupByLibrary.simpleMessage(
      "Falha ao salvar no dispositivo",
    ),
    "saveToPlaylist": MessageLookupByLibrary.simpleMessage(
      "Salvar em playlist",
    ),
    "saved": MessageLookupByLibrary.simpleMessage("Salvos"),
    "savedToDevice": MessageLookupByLibrary.simpleMessage(
      "Salvo no dispositivo",
    ),
    "savedVideosTitle": MessageLookupByLibrary.simpleMessage("Vídeos salvos"),
    "savingToDevice": MessageLookupByLibrary.simpleMessage(
      "Salvando no dispositivo...",
    ),
    "search": MessageLookupByLibrary.simpleMessage("Pesquisar"),
    "searchFilters": MessageLookupByLibrary.simpleMessage("Filtros"),
    "searchForVideosChannels": MessageLookupByLibrary.simpleMessage(
      "Pesquisar vídeos, canais e playlists",
    ),
    "searchHistoryEnabled": MessageLookupByLibrary.simpleMessage(
      "Salvar histórico de pesquisa",
    ),
    "searchHistoryEnabledDescription": MessageLookupByLibrary.simpleMessage(
      "Salve suas pesquisas para acesso rápido",
    ),
    "searchSavedVideos": MessageLookupByLibrary.simpleMessage(
      "Pesquisar vídeos salvos...",
    ),
    "searchSubscriptions": MessageLookupByLibrary.simpleMessage(
      "Pesquisar inscrições...",
    ),
    "searchYouTube": MessageLookupByLibrary.simpleMessage(
      "Pesquisar no YouTube...",
    ),
    "seconds": MessageLookupByLibrary.simpleMessage("segundos"),
    "selectAll": MessageLookupByLibrary.simpleMessage("Selecionar tudo"),
    "selectFile": MessageLookupByLibrary.simpleMessage("Selecionar arquivo"),
    "selectVideos": MessageLookupByLibrary.simpleMessage("Selecionar vídeos"),
    "selected": MessageLookupByLibrary.simpleMessage("selecionado"),
    "selfPromotion": MessageLookupByLibrary.simpleMessage("Autopromoção"),
    "serviceExplode": MessageLookupByLibrary.simpleMessage("Explode"),
    "serviceInvidious": MessageLookupByLibrary.simpleMessage("Invidious"),
    "serviceNewPipe": MessageLookupByLibrary.simpleMessage("NewPipe Extractor"),
    "servicePiped": MessageLookupByLibrary.simpleMessage("Piped"),
    "settings": MessageLookupByLibrary.simpleMessage("Configurações"),
    "share": MessageLookupByLibrary.simpleMessage("Compartilhar"),
    "shareLogs": MessageLookupByLibrary.simpleMessage("Compartilhar logs"),
    "shareVia": MessageLookupByLibrary.simpleMessage("Compartilhar via"),
    "shorts": MessageLookupByLibrary.simpleMessage("Shorts"),
    "showLessText": MessageLookupByLibrary.simpleMessage("Mostrar menos"),
    "showSearchHistory": MessageLookupByLibrary.simpleMessage(
      "Mostrar histórico de pesquisa",
    ),
    "showSearchHistoryDescription": MessageLookupByLibrary.simpleMessage(
      "Exibir suas pesquisas recentes na tela de pesquisa",
    ),
    "skipInterval": MessageLookupByLibrary.simpleMessage("Intervalo de avanço"),
    "skipIntervalDescription": MessageLookupByLibrary.simpleMessage(
      "Duração do avanço por toque duplo em segundos",
    ),
    "sleepTimer": MessageLookupByLibrary.simpleMessage("Temporizador de sono"),
    "sleepTimerCustom": MessageLookupByLibrary.simpleMessage("Personalizado"),
    "sleepTimerCustomTitle": MessageLookupByLibrary.simpleMessage(
      "Temporizador personalizado",
    ),
    "sleepTimerEndOfVideo": MessageLookupByLibrary.simpleMessage(
      "Fim do vídeo",
    ),
    "sleepTimerEnded": MessageLookupByLibrary.simpleMessage(
      "Temporizador de sono encerrado",
    ),
    "sleepTimerEnterMinutes": MessageLookupByLibrary.simpleMessage(
      "Digite os minutos",
    ),
    "sleepTimerMinutes": m6,
    "sleepTimerMinutesShort": m7,
    "sleepTimerOff": MessageLookupByLibrary.simpleMessage("Desativado"),
    "sleepTimerSet": MessageLookupByLibrary.simpleMessage("Definir"),
    "sort": MessageLookupByLibrary.simpleMessage("Ordenar"),
    "sortBy": MessageLookupByLibrary.simpleMessage("Ordenar por"),
    "sponsor": MessageLookupByLibrary.simpleMessage("Patrocínio"),
    "sponsorBlock": MessageLookupByLibrary.simpleMessage("SponsorBlock"),
    "sponsorBlockCategories": MessageLookupByLibrary.simpleMessage(
      "Categorias a pular",
    ),
    "sponsorBlockDescription": MessageLookupByLibrary.simpleMessage(
      "Pular segmentos patrocinados automaticamente",
    ),
    "startDownload": MessageLookupByLibrary.simpleMessage("Iniciar download"),
    "startSavingVideos": MessageLookupByLibrary.simpleMessage(
      "Comece a salvar vídeos para assistir depois",
    ),
    "subscribe": MessageLookupByLibrary.simpleMessage("Inscrever"),
    "subscriptions": MessageLookupByLibrary.simpleMessage("Inscrições"),
    "subtitleSize": MessageLookupByLibrary.simpleMessage(
      "Tamanho das legendas",
    ),
    "subtitleSizeDescription": MessageLookupByLibrary.simpleMessage(
      "Ajustar o tamanho das legendas no vídeo",
    ),
    "subtitleSizeExtraLarge": MessageLookupByLibrary.simpleMessage(
      "Muito grande",
    ),
    "subtitleSizeLarge": MessageLookupByLibrary.simpleMessage("Grande"),
    "subtitleSizeMedium": MessageLookupByLibrary.simpleMessage("Médio"),
    "subtitleSizeSmall": MessageLookupByLibrary.simpleMessage("Pequeno"),
    "swipeDownToDismissDisabled": MessageLookupByLibrary.simpleMessage(
      "\'Swipe down to dismiss\' disabled",
    ),
    "swipeUpToDismissEnabled": MessageLookupByLibrary.simpleMessage(
      "\'Swipe up to dismiss\' enabled",
    ),
    "switchProfile": MessageLookupByLibrary.simpleMessage("Trocar perfil"),
    "switchRegion": MessageLookupByLibrary.simpleMessage(
      "Por favor, considere trocar a região para melhores resultados.",
    ),
    "theme": MessageLookupByLibrary.simpleMessage("Tema"),
    "themeDark": MessageLookupByLibrary.simpleMessage("Escuro"),
    "themeDynamic": MessageLookupByLibrary.simpleMessage("Material You"),
    "themeLight": MessageLookupByLibrary.simpleMessage("Claro"),
    "themeOled": MessageLookupByLibrary.simpleMessage("Preto OLED"),
    "themeSystem": MessageLookupByLibrary.simpleMessage("Sistema"),
    "thereIsNoSavedOrHistoryVideos": MessageLookupByLibrary.simpleMessage(
      "Não existem vídeos/histórico salvos",
    ),
    "thereIsNoSavedVideos": MessageLookupByLibrary.simpleMessage(
      "Não existem vídeos salvos",
    ),
    "title": MessageLookupByLibrary.simpleMessage("Título"),
    "translators": MessageLookupByLibrary.simpleMessage("Tradutores"),
    "trending": MessageLookupByLibrary.simpleMessage("Tendência"),
    "unitedKingdom": MessageLookupByLibrary.simpleMessage("Reino Unido"),
    "unitedStates": MessageLookupByLibrary.simpleMessage("Estados Unidos"),
    "unknown": MessageLookupByLibrary.simpleMessage("desconhecido"),
    "unknownError": MessageLookupByLibrary.simpleMessage(
      "Ocorreu um erro desconhecido",
    ),
    "unknownQuality": MessageLookupByLibrary.simpleMessage(
      "Qualidade desconhecida",
    ),
    "unsubscribe": MessageLookupByLibrary.simpleMessage("Cancelar inscrição"),
    "unsubscribeConfirm": MessageLookupByLibrary.simpleMessage(
      "Cancelar inscrição neste canal?",
    ),
    "version": MessageLookupByLibrary.simpleMessage("Versão"),
    "video": MessageLookupByLibrary.simpleMessage("Vídeo"),
    "videoAudio": MessageLookupByLibrary.simpleMessage("Vídeo+áudio"),
    "videoCountLabel": m8,
    "videoFit": MessageLookupByLibrary.simpleMessage("Ajuste do vídeo"),
    "videoFitContain": MessageLookupByLibrary.simpleMessage("Conter"),
    "videoFitCover": MessageLookupByLibrary.simpleMessage("Cobrir"),
    "videoFitFill": MessageLookupByLibrary.simpleMessage("Preencher"),
    "videoFitFitHeight": MessageLookupByLibrary.simpleMessage(
      "Ajustar à altura",
    ),
    "videoFitFitWidth": MessageLookupByLibrary.simpleMessage(
      "Ajustar à largura",
    ),
    "videoOnly": MessageLookupByLibrary.simpleMessage("Somente vídeo"),
    "videoQuality": MessageLookupByLibrary.simpleMessage("Qualidade do vídeo"),
    "videoViews": m9,
    "videoWithAudio": MessageLookupByLibrary.simpleMessage("Vídeo + áudio"),
    "videos": MessageLookupByLibrary.simpleMessage("Vídeos"),
    "views": MessageLookupByLibrary.simpleMessage("visualizações"),
    "watchSomeVideos": MessageLookupByLibrary.simpleMessage(
      "Os vídeos que você assistir aparecerão aqui",
    ),
    "youtubeService": MessageLookupByLibrary.simpleMessage(
      "Serviço do YouTube",
    ),
  };
}
