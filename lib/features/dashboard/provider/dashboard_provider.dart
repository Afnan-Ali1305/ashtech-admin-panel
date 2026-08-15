import 'package:flutter_riverpod/legacy.dart';

final dashboardProvider =
    StateNotifierProvider<DashboardNotifier, DashboardData>((ref) {
      return DashboardNotifier();
    });

class DashboardNotifier extends StateNotifier<DashboardData> {
  DashboardNotifier()
    : super(
        DashboardData(
          activeEmployees: 6,
          activeClients: 2,
          ongoingProjects: 0,
          handedOver: 0,
          inflow: 173000.0,
          outflow: 185966.7,
          net: -12966.7,
          recentActivities: [
            {
              'action': 'login',
              'user': 'Soban Farooq · user #1',
              'time': '8/13/2026, 5:23:45 PM',
            },
            {
              'action': 'login',
              'user': 'Soban Farooq · user #1',
              'time': '8/13/2026, 12:38:09 PM',
            },
            {
              'action': 'login',
              'user': 'Soban Farooq · user #1',
              'time': '8/13/2026, 12:37:09 PM',
            },
          ],
        ),
      );
}

class DashboardData {
  final int activeEmployees;
  final int activeClients;
  final int ongoingProjects;
  final int handedOver;
  final double inflow;
  final double outflow;
  final double net;
  final List<Map<String, String>> recentActivities;

  DashboardData({
    required this.activeEmployees,
    required this.activeClients,
    required this.ongoingProjects,
    required this.handedOver,
    required this.inflow,
    required this.outflow,
    required this.net,
    required this.recentActivities,
  });
}

