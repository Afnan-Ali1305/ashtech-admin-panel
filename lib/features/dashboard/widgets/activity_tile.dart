import 'package:ashtech_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ActivityTile extends StatelessWidget {
  final String name;
  final String action;
  final String date;
  final String time;
  final IconData icon;

  const ActivityTile({
    required this.name,
    required this.action,
    required this.date,
    required this.time,
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
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest.withAlpha(100),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            // Profile Avatar / Icon
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.chartLine.withValues(alpha: 0.5),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 20, color: colorScheme.primary),
            ),
            const Gap(12),

            // User Name & Detail
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: textTheme.titleSmall),
                  const Gap(2),
                  Text(action, style: textTheme.bodyMedium),
                ],
              ),
            ),

            // Action Badge
            const Gap(12),

            // Date & Time Stamp
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(date, style: textTheme.bodySmall),
                const Gap(2),
                Text(time, style: textTheme.bodySmall),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
