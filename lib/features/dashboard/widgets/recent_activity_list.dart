import 'package:ashtech_app/features/dashboard/widgets/activity_tile.dart';
import 'package:flutter/material.dart';

class RecentActivityList extends StatelessWidget {
  const RecentActivityList({super.key});

  @override
  Widget build(BuildContext context) {
    final activities = [
      {
        'name': 'Soban Farooq...',
        'action': 'Login',
        'date': 'Jul 29, 2023',
        'time': '17:02',
        'icon': Icons.person_outline,
      },
    ];

    return Column(
      children: activities.map((item) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: ActivityTile(
            name: item['name'] as String,
            action: item['action'] as String,
            date: item['date'] as String,
            time: item['time'] as String,
            icon: item['icon'] as IconData,
          ),
        );
      }).toList(),
    );
  }
}
