import 'package:flutter/material.dart';

class EmployeeTableHeader extends StatelessWidget {
  const EmployeeTableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
          fontWeight: FontWeight.w600,
        );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Expanded(flex: 2, child: Text('Code', style: style)),
          Expanded(flex: 3, child: Text('Name', style: style)),
          Expanded(flex: 3, child: Text('Designation', style: style)),
          Expanded(flex: 2, child: Text('Joined', style: style)),
          Expanded(flex: 2, child: Text('Status', style: style)),
        ],
      ),
    );
  }
}