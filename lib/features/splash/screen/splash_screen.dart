import 'package:ashtech_app/core/extension/extension_constant.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Ashtech", style: context.textTheme.displayLarge),
      ),
    );
  }
}
