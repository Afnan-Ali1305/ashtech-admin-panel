import 'package:ashtech_app/core/extension/extension_constant.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MetricCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const MetricCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: context.colorScheme.outline.withOpacity(0.5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: context.textTheme.titleMedium?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
          const Gap(12),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: context.colorScheme.primary.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  icon,
                  size: 20,
                  color: context.colorScheme.primary,
                ),
              ),
              const Gap(12),
              Text(
                value,
                style: context.textTheme.displayLarge?.copyWith(
                  color: context.colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}