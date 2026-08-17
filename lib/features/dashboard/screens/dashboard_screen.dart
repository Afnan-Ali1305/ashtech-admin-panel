import 'package:ashtech_app/core/string_constants/asset_images.dart';
import 'package:ashtech_app/features/dashboard/widgets/financial_chart_card.dart';
import 'package:ashtech_app/features/dashboard/widgets/recent_activity_list.dart';
import 'package:ashtech_app/features/dashboard/widgets/stats_grid.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipOval(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Image.asset(AssetImages.logo),
                    ),
                  ),
                  const Gap(12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ashtech Digital Solutions',
                          style: textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onSurface,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Gap(2),
                        Text(
                          'www.ashtechdigital.com',
                          style: textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.settings_outlined,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications_none_rounded,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              const Gap(20),

              // --- Stats Grid ---
              const StatsGrid(),
              const Gap(20),

              // --- Financial Chart Card ---
              const FinancialChartCard(),
              const Gap(24),

              // --- Recent Activity Header ---
              Text('Recent activity', style: textTheme.titleLarge),
              const Gap(12),

              // --- Recent Activity List ---
              const RecentActivityList(),
            ],
          ),
        ),
      ),
    );
  }
}
