import 'package:ashtech_app/core/extension/extension_constant.dart';
import 'package:ashtech_app/core/routes/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final surfaceColor = context.colorScheme.surface;
    final iconAndLabelColor = context.colorScheme.onSurface;

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
          bottomNavigationBar: NavigationBarTheme(
            data: NavigationBarThemeData(
              backgroundColor: surfaceColor,

              labelTextStyle: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.selected)) {
                  return context.textTheme.labelSmall?.copyWith(
                    color: iconAndLabelColor,
                    fontWeight: FontWeight.bold,
                  );
                }

                return context.textTheme.labelSmall?.copyWith(
                  color: iconAndLabelColor,
                );
              }),
            ),
            child: BottomNavigationBar(
              backgroundColor: surfaceColor,
              currentIndex: tabsRouter.activeIndex,
              onTap: (index) => tabsRouter.setActiveIndex(index),
              type: BottomNavigationBarType.fixed,

              selectedItemColor: iconAndLabelColor,
              unselectedItemColor: iconAndLabelColor,

              selectedLabelStyle: context.textTheme.labelSmall?.copyWith(
                color: iconAndLabelColor,
                fontWeight: FontWeight.bold,
              ),

              unselectedLabelStyle: context.textTheme.labelSmall?.copyWith(
                color: iconAndLabelColor,
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
          ),
        );
      },
    );
  }
}
