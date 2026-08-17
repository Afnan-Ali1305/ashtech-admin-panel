import 'package:ashtech_app/features/dashboard/widgets/chart_painter.dart';
import 'package:ashtech_app/features/dashboard/widgets/financial_metric.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FinancialChartCard extends StatelessWidget {
  const FinancialChartCard({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest.withAlpha(120),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Card Header with Dropdown
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Financial charts', style: textTheme.titleLarge),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: colorScheme.outlineVariant),
                  ),
                  child: Row(
                    children: [
                      Text('Monthly', style: textTheme.bodyMedium),
                      const Gap(4),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 16,
                        color: colorScheme.onSurface,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Gap(16),

            // Inflow / Outflow / Net Overview
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FinancialMetric(label: 'Inflow', amount: '\$532.34'),
                FinancialMetric(label: 'Outflow', amount: '\$1,203.00'),
                FinancialMetric(label: 'Net', amount: '\$114.83'),
              ],
            ),
            const Gap(20),

            // Custom Dummy Chart Representation
            SizedBox(
              height: 120,
              child: CustomPaint(
                size: Size.infinite,
                painter: ChartPainter(colorScheme: colorScheme),
              ),
            ),
            const Gap(8),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun']
                  .map((month) => Text(month, style: textTheme.bodySmall))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
