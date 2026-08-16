import 'package:ashtech_app/features/employee/model/employee_model.dart';
import 'package:ashtech_app/features/employee/services/pdf_download_service.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'status_chip.dart';

class EmployeeDetailSheet extends StatelessWidget {
  final EmployeeModel employee;

  const EmployeeDetailSheet({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ashtech Digital Solutions',
                      style: textTheme.titleMedium?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Employee Profile',
                      style: textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close_rounded),
                )
              ],
            ),
            const Gap(12),
            Row(
              children: [
                Text(
                  '${employee.name ?? 'N/A'} · ${employee.designation ?? 'N/A'}',
                  style: textTheme.titleMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
                const Gap(8),
                StatusChip(status: employee.status),
              ],
            ),
            const Divider(height: 32),

            Text('Personal Information',
                style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
            const Gap(12),
            _buildDetailRow(context, 'Employee Code', employee.code),
            _buildDetailRow(context, 'Full Name', employee.name),
            _buildDetailRow(context, 'Father\'s Name', employee.fathersName),
            _buildDetailRow(context, 'Designation', employee.designation),
            _buildDetailRow(context, 'Status', employee.status),
            _buildDetailRow(context, 'Joining Date', employee.joinedDate),
            _buildDetailRow(context, 'Email', employee.email),
            _buildDetailRow(context, 'Phone', employee.phone),

            const Gap(20),
            Text('Identity & Bank',
                style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
            const Gap(12),
            _buildDetailRow(context, 'CNIC', employee.cnic),
            _buildDetailRow(context, 'Address', employee.address),
            _buildDetailRow(context, 'Bank Name', employee.bankName),
            _buildDetailRow(context, 'Bank Account', employee.bankAccount),

            const Gap(20),
            Text('Salary Breakdown',
                style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
            const Gap(12),
            _buildDetailRow(context, 'Basic Salary', employee.basicSalary ?? '-'),
            _buildDetailRow(context, 'Allowances', employee.allowances ?? '-'),
            _buildDetailRow(context, 'Deductions', employee.deductions ?? '-'),

            const Gap(28),
            // "Download Details" Button
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () async {
                  await PdfDownloadService.generateAndSavePdf(employee);
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('PDF downloading... Check notifications tray!'),
                      ),
                    );
                  }
                },
                style: FilledButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                icon: const Icon(Icons.file_download_outlined),
                label: const Text('Download Details'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, String field, String? value) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      margin: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(field, style: textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant)),
          Text(value ?? 'N/A', style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}