import 'package:ashtech_app/core/extension/extension_constant.dart';
import 'package:ashtech_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class FinancialCardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String value;
  final Color valueColor;

  const FinancialCardWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(16),
      color: context.colorScheme.surface,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: context.colorScheme.surface),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  ' · $subtitle',
                  style: context.textTheme.bodySmall?.copyWith(
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: context.textTheme.displayLarge?.copyWith(
                color: valueColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
