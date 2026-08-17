import 'package:ashtech_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppColorSchemes {
  AppColorSchemes._();

  static const lightColorScheme = ColorScheme.light(
    primary: AppColors.primary,
    onPrimary: Colors.white,
    secondary: AppColors.secondaryLight,
    onSecondary: AppColors.textPrimary,
    surface: AppColors.surface,
    onSurface: AppColors.textPrimary,
    onSurfaceVariant: AppColors.textMuted,
    background: AppColors.background,
    onBackground: AppColors.textPrimary,
    error: AppColors.danger,
    onError: Colors.white,
    outline: AppColors.border,
    tertiaryContainer: AppColors.secondaryLight,
  );

  static const darkColorScheme = ColorScheme.dark(
    primary: AppColors.primary,
    onPrimary: Colors.white,
    secondary: AppColors.primaryLight,
    onSecondary: Colors.white,
    surface: AppColors.primaryLight,
    onSurface: Colors.white,
    onSurfaceVariant: AppColors.navUnSelected,
    background: AppColors.primary,
    onBackground: Colors.white,
    error: AppColors.danger,
    onError: Colors.white,
    outline: AppColors.primaryLight,
    tertiaryContainer: AppColors.primaryLight,
  );
}

abstract class AppTheme {
  AppTheme._();

  // Shared Card Decoration Properties
  static final _cardShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16),
  );

  // LIGHT THEME
  static final lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: AppColorSchemes.lightColorScheme,
    scaffoldBackgroundColor: AppColors.background,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.primary,
      selectionHandleColor: AppColors.primary,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,

    cardTheme: CardThemeData(
      color: AppColors.surface,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: _cardShape,
    ),

    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: AppColors.textPrimary),
      titleTextStyle: TextStyle(
        color: AppColors.textPrimary,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),

    textTheme: AppTextTheme.textTheme(AppColorSchemes.lightColorScheme),
    primaryTextTheme: AppTextTheme.textTheme(AppColorSchemes.lightColorScheme),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.surface,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.navUnSelected,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
    ),

    listTileTheme: ListTileThemeData(
      tileColor: AppColors.surface,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        minimumSize: const Size(double.infinity, 48),
        textStyle: GoogleFonts.plusJakartaSans(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primary,
        textStyle: GoogleFonts.plusJakartaSans(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.surface,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
  );

  // DARK THEME
  static final darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: AppColorSchemes.darkColorScheme,
    scaffoldBackgroundColor: AppColors.primary,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.white,
      selectionHandleColor: Colors.white,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,

    cardTheme: CardThemeData(
      color: AppColors.primaryLight,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: _cardShape,
    ),

    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),

    textTheme: AppTextTheme.textTheme(AppColorSchemes.darkColorScheme),
    primaryTextTheme: AppTextTheme.textTheme(AppColorSchemes.darkColorScheme),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.primary,
      selectedItemColor: Colors.white,
      unselectedItemColor: AppColors.navUnSelected,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
    ),

    listTileTheme: ListTileThemeData(
      tileColor: AppColors.primaryLight,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColors.primaryLight,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        minimumSize: const Size(double.infinity, 48),
        textStyle: GoogleFonts.plusJakartaSans(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        textStyle: GoogleFonts.plusJakartaSans(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),

    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.primaryLight,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
  );
}


abstract class AppTextTheme {
  AppTextTheme._();

  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        // Big Financial Values & Primary Numbers (e.g., "$1,203.00", "201", "23")
        displayLarge: GoogleFonts.plusJakartaSans(
          color: colorScheme.onSurface,
          fontSize: 28,
          fontWeight: FontWeight.bold,
          letterSpacing: -0.5,
        ),

        // Screen Titles & Main Headers
        displayMedium: GoogleFonts.plusJakartaSans(
          color: colorScheme.onSurface,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),

        // Section Headers (e.g., "Recent activity", "Financial charts")
        titleLarge: GoogleFonts.plusJakartaSans(
          color: colorScheme.onSurface,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),

        // Sub-headings & Card Titles (e.g., "Active employees", "Total Outflow")
        titleMedium: GoogleFonts.plusJakartaSans(
          color: colorScheme.onSurfaceVariant,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),

        // List Item Titles (e.g., "Soban Farooq...")
        titleSmall: GoogleFonts.plusJakartaSans(
          color: colorScheme.onSurface,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),

        // Primary Body Text & Action Labels (e.g., "Login", "Monthly dropdown")
        bodyLarge: GoogleFonts.plusJakartaSans(
          color: colorScheme.onSurface,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),

        // Subtitles & Secondary Information
        bodyMedium: GoogleFonts.plusJakartaSans(
          color: colorScheme.onSurfaceVariant,
          fontSize: 13,
          fontWeight: FontWeight.w400,
        ),

        // Timestamps & Minor Details (e.g., "Jul 29, 2023 17:02", Chart Months)
        bodySmall: GoogleFonts.plusJakartaSans(
          color: colorScheme.onSurfaceVariant.withOpacity(0.75),
          fontSize: 11,
          fontWeight: FontWeight.w400,
        ),

        // Bottom Navigation & Badges (e.g., "Dashboard", "Employees")
        labelSmall: GoogleFonts.plusJakartaSans(
          color: colorScheme.onSurface,
          fontSize: 10,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.2,
        ),
      );
}