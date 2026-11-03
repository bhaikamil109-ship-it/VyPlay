import 'model/app_info_model.dart';

/// Central application identity.
///
/// Everything user-visible about the app's name, links and attribution is read
/// from here. Changing the product name should only ever require editing this
/// file plus the Android/iOS labels and the launcher icon.
class AppInfo {
  static final myApp = AppInfoModel(
    name: 'VyPlay',
    nickname: 'vyplay',
    url: 'https://github.com/vyplay-app/vyplay',
    description: 'A clean, ad-free YouTube client built for speed',
    image: 'vyplay.png',
  );

  static List<AppInfoModel> developerInfos = <AppInfoModel>[
    AppInfoModel(
      name: 'VyPlay Team',
      url: 'https://github.com/vyplay-app',
      description: 'Maintainers',
    ),
  ];

  /// Attribution for the upstream open-source projects this app builds on.
  ///
  /// VyPlay is a derivative work. The GPLv3 licence requires preserving the
  /// original authors' attribution, so this list must not be stripped.
  static List<AppInfoModel> upstreamInfos = <AppInfoModel>[
    AppInfoModel(
      name: 'FluxTube',
      url: 'https://github.com/mu-fazil-vk/fluxtube',
      description: 'Upstream project (GPLv3)',
    ),
    AppInfoModel(
      name: 'NewPipe Extractor',
      url: 'https://github.com/TeamNewPipe/NewPipeExtractor',
      description: 'Stream extraction library',
    ),
  ];

  static List<AppInfoModel> translatorsInfos = <AppInfoModel>[
    AppInfoModel(
      name: 'Fazil vk',
      url: 'https://github.com/mu-fazil-vk',
      description: 'English, Malayalam',
    ),
    AppInfoModel(
      name: 'ShLerP',
      url: 'https://github.com/mikropsoft',
      description: 'Turkish',
    ),
    AppInfoModel(
      name: 'Arthur',
      url: 'https://github.com/un-logic',
      description: 'Russian',
    ),
    AppInfoModel(
      name: 'longlegmax',
      url: 'https://github.com/longlegmax',
      description: 'Chinese (Simplified)',
    ),
    AppInfoModel(
      name: 'Danilo Lutz',
      url: 'https://danilolutz.dev',
      description: 'Portuguese (Brazil)',
    ),
    AppInfoModel(
      name: 'Islam Shoman',
      url: 'https://crowdin.com/profile/drshoman',
      description: 'Arabic',
    ),
    AppInfoModel(
      name: 'maboroshin',
      url: 'https://github.com/maboroshin',
      description: 'Japanese',
    ),
    AppInfoModel(
      name: '미르냥',
      url: 'https://crowdin.com/profile/miryang',
      description: 'Korean',
    ),
    AppInfoModel(
      name: 'Patriot77',
      url: 'https://crowdin.com/profile/patriot77',
      description: 'Polish',
    ),
    AppInfoModel(
      name: 'Liu Zehao',
      url: 'https://crowdin.com/profile/tonyblur',
      description: 'Chinese (Simplified)',
    ),
    AppInfoModel(
      name: 'Hualiang',
      url: 'https://crowdin.com/profile/hualiong',
      description: 'Chinese (Simplified)',
    ),
    AppInfoModel(
      name: 'Mathis Serrieres Maniecki',
      url: 'https://crowdin.com/profile/minarox',
      description: 'French',
    ),
    AppInfoModel(
      name: 'Mickael81',
      url: 'https://crowdin.com/profile/mickael81',
      description: 'French',
    ),
  ];
}
