import 'package:ashtech_app/features/dashboard/widgets/stat_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class StatsGrid extends StatelessWidget {
  const StatsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(
              child: StatCard(
                title: 'Active employees',
                value: '23',
                icon: Icons.people_outline,
              ),
            ),
            Gap(12),
            Expanded(
              child: StatCard(
                title: 'Active clients',
                value: '15',
                icon: Icons.person_outline,
              ),
            ),
          ],
        ),
        Gap(12),
        Row(
          children: [
            Expanded(
              child: StatCard(
                title: 'Ongoing projects',
                value: '62',
                icon: Icons.folder_open,
              ),
            ),
            Gap(12),
            Expanded(
              child: StatCard(
                title: 'Handed over',
                value: '161',
                icon: Icons.drive_file_move_outline,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
