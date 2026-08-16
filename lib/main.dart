import 'package:ashtech_app/core/routes/app_router.dart';
import 'package:ashtech_app/core/theme/app_text_theme.dart';
import 'package:ashtech_app/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final appRouter = AppRouter();

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode, // Riverpod state ke mutabiq dynamic switch hoga
      routerConfig: appRouter.config(),
    );
  }
}
