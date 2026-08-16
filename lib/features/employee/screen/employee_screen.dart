import 'package:ashtech_app/features/employee/provider/employee_provider.dart';
import 'package:ashtech_app/features/employee/widgets/add_employee_dialog.dart';
import 'package:ashtech_app/features/employee/widgets/employee_detail_sheet.dart';
import 'package:ashtech_app/features/employee/widgets/employee_row_card.dart';
import 'package:ashtech_app/features/employee/widgets/employee_table_header.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
@RoutePage()
class EmployeeScreen extends ConsumerWidget {
  const EmployeeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final employees = ref.watch(employeeListProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      // Icon-only FAB
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const AddEmployeeDialog(),
          );
        },
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        child: const Icon(Icons.add_rounded, size: 28),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Employees',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Gap(24),
              Container(
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const EmployeeTableHeader(),
                    const Gap(4),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: employees.length,
                      itemBuilder: (context, index) {
                        final employee = employees[index];
                        return InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                              ),
                              builder: (context) => EmployeeDetailSheet(
                                employee: employee,
                              ),
                            );
                          },
                          child: EmployeeRowCard(employee: employee),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final employees = ref.watch(employeeListProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const AddEmployeeDialog(),
          );
        },
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        icon: const Icon(Icons.add_rounded),
        label: const Text('Add Employee'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Employees',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Gap(24),
              Container(
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const EmployeeTableHeader(),
                    const Gap(4),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: employees.length,
                      itemBuilder: (context, index) {
                        final employee = employees[index];
                        return InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                              ),
                              builder: (context) => EmployeeDetailSheet(
                                employee: employee,
                              ),
                            );
                          },
                          child: EmployeeRowCard(employee: employee),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
