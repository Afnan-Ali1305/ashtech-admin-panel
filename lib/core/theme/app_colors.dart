import 'package:flutter/material.dart';

abstract class AppColors {
  // Prevent instantiation
  AppColors._();

  // Brand / Theme Colors
  static const Color primary = Color(0xFF0F172A);
  static const Color primaryLight = Color(0xFF1E293B);
  static const Color secondaryLight = Color(0xFFF1F5F9);
  static const Color navUnSelected = Color(0xFF94A3B8);

  // Surface & Layout
  static const Color background = Color(0xFFF8FAFC);
  static const Color surface = Colors.white;
  static const Color textPrimary = Color(0xFF1E293B);
  static const Color textMuted = Color(0xFF64748B);
  static const Color border = Color(0xFFE2E8F0);

  // Financial & Status Indicators
  static const Color success = Color(0xFF10B981); // Inflow
  static const Color danger = Color(0xFFEF4444); // Outflow
  static const Color warning = Color(0xFFF59E0B);

  static const Color cardBorder = Color(0xFFE2E8F0);
  static const Color chartLine = Color(0xFFE07A5F);

  static const Color orange = Colors.deepOrange;
}
