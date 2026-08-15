import 'package:ashtech_app/core/extension/extension_constant.dart';
import 'package:ashtech_app/core/routes/app_router.gr.dart';
import 'package:ashtech_app/core/theme/app_colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        DashboardRoute(),
        EmployeeRoute(),
        ClientRoute(),
        ProjectRoute(),
        FinanceRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          body: child,

          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: AppColors.primary,

            currentIndex: tabsRouter.activeIndex,

            onTap: (index) {
              tabsRouter.setActiveIndex(index);
            },

            type: BottomNavigationBarType.fixed,

            // Selected item
            selectedItemColor: AppColors.secondaryLight,
            selectedLabelStyle: context.textTheme.bodySmall?.copyWith(
              color: AppColors.secondaryLight,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),

            // Unselected item
            unselectedItemColor: AppColors.navUnSelected,
            unselectedLabelStyle: context.textTheme.bodySmall?.copyWith(
              color: AppColors.navUnSelected,
              fontSize: 11,
              fontWeight: FontWeight.w400,
            ),

            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard_outlined),
                activeIcon: Icon(Icons.dashboard),
                label: 'Dashboard',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people_outline),
                activeIcon: Icon(Icons.people),
                label: 'Employees',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                activeIcon: Icon(Icons.person),
                label: 'Clients',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.assignment_outlined),
                activeIcon: Icon(Icons.assignment),
                label: 'Projects',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_balance_wallet_outlined),
                activeIcon: Icon(Icons.account_balance_wallet),
                label: 'Finance',
              ),
            ],
          ),
        );
      },
    );
  }
}
