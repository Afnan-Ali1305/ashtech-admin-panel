// import 'package:flutter_riverpod/legacy.dart';

// final dashboardProvider =
//     StateNotifierProvider<DashboardNotifier, DashboardData>((ref) {
//       return DashboardNotifier();
//     });

// class DashboardNotifier extends StateNotifier<DashboardData> {
//   DashboardNotifier()
//     : super(
//         DashboardData(
//           activeEmployees: 6,
//           activeClients: 2,
//           ongoingProjects: 0,
//           handedOver: 0,
//           inflow: 173000.0,
//           outflow: 185966.7,
//           net: -12966.7,
//           recentActivities: [
//             {
//               'action': 'login',
//               'user': 'Soban Farooq · user #1',
//               'time': '8/13/2026, 5:23:45 PM',
//             },
//             {
//               'action': 'login',
//               'user': 'Soban Farooq · user #1',
//               'time': '8/13/2026, 12:38:09 PM',
//             },
//             {
//               'action': 'login',
//               'user': 'Soban Farooq · user #1',
//               'time': '8/13/2026, 12:37:09 PM',
//             },
//           ],
//         ),
//       );
// }

// class DashboardData {
//   final int activeEmployees;
//   final int activeClients;
//   final int ongoingProjects;
//   final int handedOver;
//   final double inflow;
//   final double outflow;
//   final double net;
//   final List<Map<String, String>> recentActivities;

//   DashboardData({
//     required this.activeEmployees,
//     required this.activeClients,
//     required this.ongoingProjects,
//     required this.handedOver,
//     required this.inflow,
//     required this.outflow,
//     required this.net,
//     required this.recentActivities,
//   });
// }

import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardData {
  final int activeEmployees;
  final int activeClients;
  final int ongoingProjects;
  final int handedOver;
  final double inflowThisMonth;
  final double outflowThisMonth;
  final double netThisMonth;
  final List<ActivityLog> recentActivities;

  const DashboardData({
    required this.activeEmployees,
    required this.activeClients,
    required this.ongoingProjects,
    required this.handedOver,
    required this.inflowThisMonth,
    required this.outflowThisMonth,
    required this.netThisMonth,
    required this.recentActivities,
  });
}

class ActivityLog {
  final String tag;
  final String title;
  final String timestamp;

  const ActivityLog({
    required this.tag,
    required this.title,
    required this.timestamp,
  });
}

final dashboardProvider = Provider<DashboardData>((ref) {
  return const DashboardData(
    activeEmployees: 6,
    activeClients: 2,
    ongoingProjects: 0,
    handedOver: 0,
    inflowThisMonth: 173000.0,
    outflowThisMonth: 185966.7,
    netThisMonth: -12966.7,
    recentActivities: [
      ActivityLog(tag: 'login', title: 'Soban Farooq · user #1', timestamp: '8/13/2026, 5:23:45 PM'),
      ActivityLog(tag: 'login', title: 'Soban Farooq · user #1', timestamp: '8/13/2026, 12:38:09 PM'),
      ActivityLog(tag: 'login', title: 'Soban Farooq · user #1', timestamp: '8/13/2026, 12:37:09 PM'),
      ActivityLog(tag: 'login', title: 'Soban Farooq · user #1', timestamp: '8/11/2026, 7:17:37 PM'),
    ],
  );
});