import 'package:ashtech_app/core/routes/app_router.gr.dart';
import 'package:ashtech_app/core/string_constants/asset_images.dart';
import 'package:ashtech_app/core/theme/app_colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;

      context.router.replace(const NavigationRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(110),
          child: Image.asset(AssetImages.logo),
        ),
      ),
    );
  }
}
