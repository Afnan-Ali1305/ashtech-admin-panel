import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FinancialMetric extends StatelessWidget {
  final String label;
  final String amount;

  const FinancialMetric({required this.label, required this.amount, super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: textTheme.titleMedium),
        const Gap(4),
        Text(amount, style: textTheme.titleLarge),
      ],
    );
  }
}
