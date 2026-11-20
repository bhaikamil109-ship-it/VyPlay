import 'package:flutter/widgets.dart';

/// Localized label for the compact navigation's secondary destination.
/// Keep this in sync with the twelve locales currently shipped by VyPlay.
String moreNavigationLabel(Locale locale) => switch (locale.languageCode) {
      'ar' => 'المزيد',
      'en' => 'More',
      'fr' => 'Plus',
      'hi' => 'अधिक',
      'ja' => 'その他',
      'ko' => '더보기',
      'ml' => 'കൂടുതൽ',
      'pl' => 'Więcej',
      'pt' => 'Mais',
      'ru' => 'Ещё',
      'tr' => 'Daha fazla',
      'zh' => '更多',
      _ => 'More',
    };
