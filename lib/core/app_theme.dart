import 'package:flutter/material.dart';
import 'package:vyplay/core/colors.dart';

abstract class AppTheme {
  /// Shared shape language: rounded cards and thumbnails everywhere, so the
  /// app reads as one consistent product instead of a mix of default widgets.
  /// LibreTube-style: subtle elevation, smooth rounded corners.
  static const double _cardRadius = 16.0;

  static CardThemeData _cardTheme(Color surface, Color outline) =>
      CardThemeData(
        elevation: 2,
        color: surface,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_cardRadius),
          side: BorderSide(color: outline, width: 0.5),
        ),
      );

  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        tabBarTheme: TabBarThemeData(indicatorColor: kGreyColor),
        primaryColorLight: kWhiteColor,
        primaryColorDark: kBlackColor,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.brand,
          primary: AppColors.brand,
        ),
        primaryIconTheme: const IconThemeData().copyWith(color: kBlackColor),
        scaffoldBackgroundColor: kWhiteColor,
        cardTheme: _cardTheme(AppColors.surface, AppColors.surfaceVariant),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyLarge: const TextStyle(
                fontSize: 25,
                color: kBlackColor,
              ),
              bodySmall: const TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 15,
                color: kBlackColor,
              ),
            ),
        appBarTheme: const AppBarTheme(
            backgroundColor: kWhiteColor, foregroundColor: kBlackColor),
        fontFamily: 'Montserrat',
        iconTheme: const IconThemeData().copyWith(color: kGreyColor),
      );

  static ThemeData get darkTheme => ThemeData(
      useMaterial3: true,
      primaryColorLight: kWhiteColor,
      primaryColorDark: kBlackColor,
      tabBarTheme: TabBarThemeData(indicatorColor: kWhiteColor.withValues(alpha: 0.5)),
      primaryIconTheme: const IconThemeData().copyWith(color: kWhiteColor),
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.brand,
        brightness: Brightness.dark,
        primary: AppColors.brandLight,
      ),
      scaffoldBackgroundColor: kDarkColor,
      cardTheme: _cardTheme(AppColors.surfaceDark, AppColors.surfaceVariantDark),
      dividerTheme: const DividerThemeData().copyWith(color: kGreyOpacityColor),
      textTheme: ThemeData.dark().textTheme.copyWith(
            bodyLarge: const TextStyle(
              fontSize: 25,
              color: kWhiteColor,
            ),
            bodySmall: const TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 15,
              color: kWhiteColor,
            ),
          ),
      appBarTheme: AppBarTheme(
        backgroundColor: kBlackColor,
        foregroundColor: kWhiteColor,
        iconTheme: const IconThemeData().copyWith(color: kWhiteColor),
        actionsIconTheme: const IconThemeData().copyWith(color: kWhiteColor),
      ),
      fontFamily: 'Montserrat',
      iconTheme:
          const IconThemeData().copyWith(color: kWhiteColor.withValues(alpha: 0.7)),
      inputDecorationTheme: const InputDecorationTheme().copyWith(
        iconColor: kWhiteColor,
        prefixIconColor: kWhiteColor,
        suffixIconColor: kWhiteColor,
      ));

  static ThemeData get oledTheme => ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColorLight: kWhiteColor,
      primaryColorDark: const Color(0xFF000000),
      tabBarTheme: const TabBarThemeData(indicatorColor: Colors.white),
      primaryIconTheme: const IconThemeData().copyWith(color: kWhiteColor),
      colorScheme: const ColorScheme.dark(
        surface: Color(0xFF000000),
        onSurface: Colors.white,
        primary: Colors.white,
        onPrimary: Color(0xFF000000),
      ),
      scaffoldBackgroundColor: const Color(0xFF000000),
      dividerTheme: const DividerThemeData().copyWith(color: Colors.white12),
      textTheme: ThemeData.dark().textTheme.copyWith(
            bodyLarge: const TextStyle(fontSize: 25, color: kWhiteColor),
            bodySmall: const TextStyle(
                fontStyle: FontStyle.italic, fontSize: 15, color: kWhiteColor),
          ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF000000),
        foregroundColor: kWhiteColor,
        elevation: 0,
        iconTheme: IconThemeData(color: kWhiteColor),
        actionsIconTheme: IconThemeData(color: kWhiteColor),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF000000),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
      ),
      fontFamily: 'Montserrat',
      iconTheme: const IconThemeData().copyWith(color: kWhiteColor.withValues(alpha: 0.7)),
      inputDecorationTheme: const InputDecorationTheme().copyWith(
        iconColor: kWhiteColor,
        prefixIconColor: kWhiteColor,
        suffixIconColor: kWhiteColor,
      ),
      cardColor: const Color(0xFF0A0A0A),
      dialogTheme: const DialogThemeData(
          backgroundColor: Color(0xFF0A0A0A)),
    );

  static ThemeData lightThemeWithAccent(Color accent) =>
      lightTheme.copyWith(
        colorScheme: lightTheme.colorScheme.copyWith(
          primary: accent,
          secondary: accent,
        ),
      );

  static ThemeData darkThemeWithAccent(Color accent) =>
      darkTheme.copyWith(
        colorScheme: darkTheme.colorScheme.copyWith(
          primary: accent,
          secondary: accent,
        ),
      );

  static ThemeData oledThemeWithAccent(Color accent) =>
      oledTheme.copyWith(
        colorScheme: oledTheme.colorScheme.copyWith(
          primary: accent,
          secondary: accent,
          onPrimary: accent.computeLuminance() > 0.45
              ? Colors.black
              : Colors.white,
        ),
      );

  static ThemeData dynamicThemeWithAccent(
    ColorScheme colorScheme,
    Color accent,
  ) => dynamicTheme(
        colorScheme.copyWith(primary: accent, secondary: accent),
      );

  static ThemeData dynamicTheme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme,
        tabBarTheme: TabBarThemeData(
            indicatorColor: colorScheme.onSurface.withValues(alpha: 0.6)),
        scaffoldBackgroundColor: colorScheme.surface,
        appBarTheme: AppBarTheme(
          backgroundColor: colorScheme.surface,
          foregroundColor: colorScheme.onSurface,
          iconTheme: IconThemeData(color: colorScheme.onSurface),
          actionsIconTheme: IconThemeData(color: colorScheme.onSurface),
        ),
        fontFamily: 'Montserrat',
        textTheme: ThemeData(
          brightness: colorScheme.brightness,
          useMaterial3: true,
        ).textTheme.copyWith(
              bodyLarge:
                  TextStyle(fontSize: 25, color: colorScheme.onSurface),
              bodySmall: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 15,
                  color: colorScheme.onSurface),
            ),
        iconTheme: IconThemeData(
            color: colorScheme.onSurface.withValues(alpha: 0.7)),
        dividerTheme: DividerThemeData(
            color: colorScheme.onSurface.withValues(alpha: 0.12)),
      );
}
