import 'package:ashtech_app/features/employee/model/employee_model.dart';
import 'package:flutter/material.dart';
import 'status_chip.dart';

class EmployeeRowCard extends StatelessWidget {
  final EmployeeModel employee;

  const EmployeeRowCard({
    super.key,
    required this.employee,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              employee.code ?? 'N/A',
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              employee.name ?? 'Unnamed Employee',
              style: textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              employee.designation ?? 'Role Unassigned',
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              employee.joinedDate ?? 'Unknown Date',
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: StatusChip(status: employee.status),
            ),
          ),
        ],
      ),
    );
  }
}