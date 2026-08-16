import 'package:ashtech_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColorSchemes {
  static const lightColorScheme = ColorScheme.light(
    primary: AppColors.primary,
    onPrimary: Colors.white,
    secondary: AppColors.secondaryLight,
    onSecondary: AppColors.textPrimary,
    surface: AppColors.surface,
    onSurface: AppColors.textPrimary,
    background: AppColors.background,
    onBackground: AppColors.textPrimary,
    error: AppColors.danger,
    onError: Colors.white,
    outline: AppColors.border,
    inverseSurface: AppColors.textPrimary,
    tertiaryContainer: AppColors.secondaryLight,
  );

  static const darkColorScheme = ColorScheme.dark(
    primary: AppColors.primary,
    onPrimary: Colors.white,
    secondary: AppColors.secondaryLight,
    onSecondary: Colors.white,
    surface: AppColors.primaryLight,
    onSurface: Colors.white,
    background: AppColors.primary,
    onBackground: Colors.white,
    error: AppColors.danger,
    onError: Colors.white,
    outline: AppColors.border,
    inverseSurface: Colors.white,
    tertiaryContainer: AppColors.primaryLight,
  );
}

class AppTheme {
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: AppColors.border),
      ),
    ),
    
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.surface,
      iconTheme: IconThemeData(color: AppColors.textPrimary),
      titleTextStyle: TextStyle(
        color: AppColors.textPrimary,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
    
    textTheme: AppTextTheme.textTheme(AppColorSchemes.lightColorScheme),
    primaryTextTheme: AppTextTheme.textTheme(AppColorSchemes.lightColorScheme),
    
    datePickerTheme: const DatePickerThemeData(
      backgroundColor: AppColors.surface,
      headerBackgroundColor: AppColors.primary,
    ),
    
    listTileTheme: ListTileThemeData(
      tileColor: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: AppColors.border),
      ),
    ),
    
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(6),
      ),
      textStyle: AppTextTheme.textTheme(AppColorSchemes.lightColorScheme)
          .bodySmall
          ?.copyWith(color: Colors.white),
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

  static final darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: AppColorSchemes.darkColorScheme,
    scaffoldBackgroundColor: AppColors.primary,
    
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.primary,
    ),
    
    textTheme: AppTextTheme.textTheme(AppColorSchemes.darkColorScheme),
    primaryTextTheme: AppTextTheme.textTheme(AppColorSchemes.darkColorScheme),
    
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
  );
}

class AppTextTheme {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        displayLarge: GoogleFonts.plusJakartaSans(
          color: colorScheme.inverseSurface,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        
        displayMedium: GoogleFonts.plusJakartaSans(
          color: colorScheme.inverseSurface,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),

        titleLarge: GoogleFonts.plusJakartaSans(
          color: colorScheme.inverseSurface,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),

        titleMedium: GoogleFonts.plusJakartaSans(
          color: colorScheme.inverseSurface,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),

        titleSmall: GoogleFonts.plusJakartaSans(
          color: colorScheme.inverseSurface,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),

        bodyLarge: GoogleFonts.plusJakartaSans(
          color: colorScheme.inverseSurface,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),

        bodyMedium: GoogleFonts.plusJakartaSans(
          color: colorScheme.inverseSurface,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),

        bodySmall: GoogleFonts.plusJakartaSans(
          color: colorScheme.inverseSurface,
          fontSize: 11,
          fontWeight: FontWeight.w400,
        ),

        labelSmall: GoogleFonts.plusJakartaSans(
          color: colorScheme.inverseSurface,
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
      );
}