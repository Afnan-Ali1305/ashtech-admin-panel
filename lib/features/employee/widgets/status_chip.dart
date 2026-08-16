import 'package:flutter/material.dart';

class StatusChip extends StatelessWidget {
  final String? status;

  const StatusChip({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveStatus = status?.toLowerCase() ?? 'unknown';
    final isProbation = effectiveStatus == 'probation';

    final chipColor = isProbation
        ? Theme.of(context).colorScheme.tertiaryContainer.withOpacity(0.5)
        : Theme.of(context).colorScheme.primaryContainer.withOpacity(0.4);

    final textColor = isProbation
        ? Theme.of(context).colorScheme.onTertiaryContainer
        : Theme.of(context).colorScheme.primary;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: chipColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        effectiveStatus,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: textColor,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}