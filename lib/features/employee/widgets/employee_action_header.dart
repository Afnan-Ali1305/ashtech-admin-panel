import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EmployeeActionHeader extends StatelessWidget {
  final VoidCallback? onAddEmployeePressed;
  final VoidCallback? onDownloadPdfPressed;

  const EmployeeActionHeader({
    super.key,
    this.onAddEmployeePressed,
    this.onDownloadPdfPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Employees',
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
        ),
        Row(
          children: [
            OutlinedButton.icon(
              onPressed: onDownloadPdfPressed,
              style: OutlinedButton.styleFrom(
                foregroundColor: colorScheme.primary,
                side: BorderSide(color: colorScheme.primary.withOpacity(0.5)),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              icon: const Icon(Icons.south_rounded, size: 16),
              label: const Text('Download PDF'),
            ),
            const Gap(12),
            FilledButton.icon(
              onPressed: onAddEmployeePressed,
              style: FilledButton.styleFrom(
                backgroundColor: colorScheme.primary,
                foregroundColor: colorScheme.onPrimary,
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              icon: const Icon(Icons.add_rounded, size: 18),
              label: const Text('Add employee'),
            ),
          ],
        ),
      ],
    );
  }
}