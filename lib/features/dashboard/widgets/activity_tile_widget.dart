import 'package:ashtech_app/core/extension/extension_constant.dart';
import 'package:ashtech_app/core/theme/app_colors.dart';
import 'package:ashtech_app/features/dashboard/provider/dashboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ActivityTileWidget extends StatelessWidget {
  final ActivityLog activity;

  const ActivityTileWidget({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
            child: Text(
              activity.tag,
              style: context.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Gap(10),
          Expanded(
            child: Text(
              activity.title,

              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.bodyMedium?.copyWith(),
            ),
          ),
          const Gap(20),
          Text(
            activity.timestamp,
            style: context.textTheme.bodySmall?.copyWith(
              color: AppColors.textMuted,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
