import 'package:ashtech_app/core/extension/extension_constant.dart';
import 'package:ashtech_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class StatCardWidget extends StatelessWidget {
  final String title;
  final String value;

  const StatCardWidget({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(16),
      color: context.colorScheme.surface,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: context.colorScheme.surface),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: context.textTheme.bodySmall?.copyWith(
                color: AppColors.textMuted,
              ),
            ),
            const SizedBox(height: 6),
            Text(value, style: context.textTheme.displayLarge?.copyWith()),
          ],
        ),
      ),
    );
  }
}
