// import 'package:ashtech_app/core/theme/app_colors.dart';
// import 'package:ashtech_app/features/dashboard/provider/dashboard_provider.dart';
// import 'package:auto_route/annotations.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:gap/gap.dart';
// @RoutePage()
// class DashboardScreen extends ConsumerWidget {
//   const DashboardScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final dashboardData = ref.watch(dashboardProvider);

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0.5,
//         title: const Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Ashtech Digital Solutions',
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             Text('EMS Portal', style: TextStyle(fontSize: 12)),
//           ],
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.settings_outlined),
//             onPressed: () {},
//           ),
//           IconButton(icon: const Icon(Icons.logout_rounded), onPressed: () {}),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Dashboard',
//               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//             ),
//             const Gap(16),

//             // Top Stat Grid
//             GridView.count(
//               crossAxisCount: 2,
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               crossAxisSpacing: 12,
//               mainAxisSpacing: 12,
//               childAspectRatio: 1.6,
//               children: [
//                 _buildStatCard(
//                   'Active employees',
//                   '${dashboardData.activeEmployees}',
//                 ),
//                 _buildStatCard(
//                   'Active clients',
//                   '${dashboardData.activeClients}',
//                 ),
//                 _buildStatCard(
//                   'Ongoing projects',
//                   '${dashboardData.ongoingProjects}',
//                 ),
//                 _buildStatCard('Handed over', '${dashboardData.handedOver}'),
//               ],
//             ),

//             const SizedBox(height: 16),

//             // Financial Summary Section (Cards)
//             Row(
//               children: [
//                 Expanded(
//                   child: _buildFinanceCard(
//                     'Inflow · this month',
//                     'Rs ${dashboardData.inflow.toStringAsFixed(0)}',
//                     AppColors.inflow,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10),
//             Row(
//               children: [
//                 Expanded(
//                   child: _buildFinanceCard(
//                     'Outflow · this month',
//                     'Rs ${dashboardData.outflow.toStringAsFixed(1)}',
//                     AppColors.outflow,
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   child: _buildFinanceCard(
//                     'Net · this month',
//                     'Rs ${dashboardData.net.toStringAsFixed(1)}',
//                     AppColors.outflow,
//                   ),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 24),

//             // Recent Activity Section
//             Container(
//               decoration: BoxDecoration(
//                 color: AppColors.cardSurface,
//                 borderRadius: BorderRadius.circular(12),
//                 border: Border.all(color: AppColors.borderLight),
//               ),
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Recent activity',
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 12),
//                   ListView.separated(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: dashboardData.recentActivities.length,
//                     separatorBuilder: (_, _) => const Divider(height: 20),
//                     itemBuilder: (context, index) {
//                       final item = dashboardData.recentActivities[index];
//                       return Row(
//                         children: [
//                           Container(
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 8,
//                               vertical: 4,
//                             ),
//                             decoration: BoxDecoration(
//                               color: AppColors.chipBackground,
//                               borderRadius: BorderRadius.circular(6),
//                             ),
//                             child: Text(
//                               item['action']!,
//                               style: const TextStyle(fontSize: 12),
//                             ),
//                           ),
//                           const SizedBox(width: 10),
//                           Expanded(
//                             child: Text(
//                               item['user']!,
//                               style: const TextStyle(
//                                 fontSize: 13,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                           Text(
//                             item['time']!,
//                             style: const TextStyle(fontSize: 11),
//                           ),
//                         ],
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),

//       // Professional Bottom Navigation Bar

//     );
//   }

//   // Stat Card Widget
//   Widget _buildStatCard(String title, String value) {
//     return Container(
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: AppColors.cardSurface,
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(color: AppColors.borderLight),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             title,
//             style: const TextStyle(fontSize: 12, color: AppColors.textMuted),
//           ),
//           const SizedBox(height: 6),
//           Text(
//             value,
//             style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }

//   // Finance Card Widget
//   Widget _buildFinanceCard(String title, String value, Color valueColor) {
//     return Container(
//       padding: const EdgeInsets.all(14),
//       decoration: BoxDecoration(
//         color: AppColors.cardSurface,
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(color: AppColors.borderLight),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             title,
//             style: const TextStyle(fontSize: 12, color: AppColors.textMuted),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             value,
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               color: valueColor,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:ashtech_app/core/extension/extension_constant.dart';
import 'package:ashtech_app/core/string_constants/asset_images.dart';
import 'package:ashtech_app/core/theme/app_colors.dart';
import 'package:ashtech_app/features/dashboard/provider/dashboard_provider.dart';
import 'package:ashtech_app/features/dashboard/widgets/activity_tile_widget.dart';
import 'package:ashtech_app/features/dashboard/widgets/financial_card_widget.dart';
import 'package:ashtech_app/features/dashboard/widgets/stat_card_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

@RoutePage()
class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardData = ref.watch(dashboardProvider);

    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: context.colorScheme.surface,
        title: Text('Dashboard', style: context.textTheme.titleLarge),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {},
          ),
          IconButton(icon: const Icon(Icons.logout_rounded), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Company Branding
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: context.colorScheme.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: context.colorScheme.surface),
              ),
              child: Row(
                children: [
                  // const Icon(Icons.flash_on, color: Colors.orange, size: 32),
                  Image.asset(AssetImages.logo, height: 32, width: 32),
                  const Gap(12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ashtech Digital Solutions',
                        style: context.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'www.ashtechdigitalsolutions.com',
                        style: context.textTheme.bodySmall?.copyWith(
                          color: AppColors.textMuted,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Gap(20),

            // Operational Metrics Grid
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.5,
              children: [
                StatCardWidget(
                  title: 'Active employees',
                  value: '${dashboardData.activeEmployees}',
                ),
                StatCardWidget(
                  title: 'Active clients',
                  value: '${dashboardData.activeClients}',
                ),
                StatCardWidget(
                  title: 'Ongoing projects',
                  value: '${dashboardData.ongoingProjects}',
                ),
                StatCardWidget(
                  title: 'Handed over',
                  value: '${dashboardData.handedOver}',
                ),
              ],
            ),
            const Gap(16),

            // Financial Summary Cards
            FinancialCardWidget(
              title: 'Inflow',
              subtitle: 'this month',
              value: 'Rs ${dashboardData.inflowThisMonth.toStringAsFixed(0)}',
              valueColor: AppColors.success,
            ),
            const Gap(12),
            FinancialCardWidget(
              title: 'Outflow',
              subtitle: 'this month',
              value: 'Rs ${dashboardData.outflowThisMonth.toStringAsFixed(1)}',
              valueColor: AppColors.danger,
            ),
            const Gap(12),
            FinancialCardWidget(
              title: 'Net',
              subtitle: 'this month',
              value: 'Rs ${dashboardData.netThisMonth.toStringAsFixed(1)}',
              valueColor: AppColors.danger,
            ),
            const Gap(20),

            // Recent Activity Section
            Material(
              elevation: 1,
              borderRadius: BorderRadius.circular(16),
              color: context.colorScheme.surface,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: context.colorScheme.surface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: context.colorScheme.surface),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recent activity',
                      style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(12),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: dashboardData.recentActivities.length,
                      separatorBuilder: (context, index) =>
                          const Divider(height: 1, color: AppColors.border),
                      itemBuilder: (context, index) {
                        return ActivityTileWidget(
                          activity: dashboardData.recentActivities[index],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
