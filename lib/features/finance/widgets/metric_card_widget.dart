import 'package:ashtech_app/core/extension/extension_constant.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MetricCardWidget extends StatelessWidget {
  final String label;
  final String amount;
  final Color valueColor;

  const MetricCardWidget({
    super.key,
    required this.label,
    required this.amount,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerHighest.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: context.textTheme.bodySmall?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
          const Gap(8),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              amount,
              style: context.textTheme.titleLarge?.copyWith(
                color: valueColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}