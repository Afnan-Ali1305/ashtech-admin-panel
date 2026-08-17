import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';

final themeModeProvider = StateProvider<ThemeMode>((ref) {
  return ThemeMode.system; // or ThemeMode.light / ThemeMode.dark
});