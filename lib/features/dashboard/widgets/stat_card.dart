import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const StatCard({
    required this.title,
    required this.value,
    required this.icon,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(14.0),
        decoration: BoxDecoration(
          // color: colorScheme.surfaceContainerHighest.withAlpha(120),
          borderRadius: BorderRadius.circular(16),
          // border: Border.all(
          //   color: colorScheme.outlineVariant.withAlpha(100),
          //   width: 1,
          // ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: textTheme.bodyMedium),
            const Gap(10),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: colorScheme.primary.withAlpha(20),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, size: 20, color: colorScheme.primary),
                ),
                const Gap(12),
                Text(value, style: textTheme.displayLarge),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
