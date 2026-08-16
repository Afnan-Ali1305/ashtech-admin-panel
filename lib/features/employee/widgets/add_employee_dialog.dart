import 'package:ashtech_app/features/employee/model/employee_model.dart';
import 'package:ashtech_app/features/employee/provider/employee_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class AddEmployeeDialog extends ConsumerStatefulWidget {
  const AddEmployeeDialog({super.key});

  @override
  ConsumerState<AddEmployeeDialog> createState() => _AddEmployeeDialogState();
}

class _AddEmployeeDialogState extends ConsumerState<AddEmployeeDialog> {
  final _formKey = GlobalKey<FormState>();

  final _codeController = TextEditingController();
  final _nameController = TextEditingController();
  final _fatherNameController = TextEditingController();
  final _designationController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _cnicController = TextEditingController();
  final _addressController = TextEditingController();
  final _bankNameController = TextEditingController();
  final _bankAccountController = TextEditingController();

  String _selectedStatus = 'active';

  @override
  void dispose() {
    _codeController.dispose();
    _nameController.dispose();
    _fatherNameController.dispose();
    _designationController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _cnicController.dispose();
    _addressController.dispose();
    _bankNameController.dispose();
    _bankAccountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AlertDialog(
      title: const Text('Add New Employee'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildField(_codeController, 'Employee Code (e.g. ASH-003)'),
              const Gap(8),
              _buildField(_nameController, 'Full Name'),
              const Gap(8),
              _buildField(_fatherNameController, 'Father\'s Name'),
              const Gap(8),
              _buildField(_designationController, 'Designation'),
              const Gap(8),
              _buildField(_emailController, 'Email'),
              const Gap(8),
              _buildField(_phoneController, 'Phone Number'),
              const Gap(8),
              _buildField(_cnicController, 'CNIC'),
              const Gap(8),
              _buildField(_addressController, 'Address'),
              const Gap(8),
              _buildField(_bankNameController, 'Bank Name'),
              const Gap(8),
              _buildField(_bankAccountController, 'Bank Account Number'),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final newEmp = EmployeeModel(
                code: _codeController.text,
                name: _nameController.text,
                fathersName: _fatherNameController.text,
                designation: _designationController.text,
                status: _selectedStatus,
                joinedDate: '16-Aug-2026',
                email: _emailController.text,
                phone: _phoneController.text,
                cnic: _cnicController.text,
                address: _addressController.text,
                bankName: _bankNameController.text,
                bankAccount: _bankAccountController.text,
                basicSalary: '-',
                allowances: '-',
                deductions: '-',
              );
              ref.read(employeeListProvider.notifier).addEmployee(newEmp);
              Navigator.pop(context);
            }
          },
          style: FilledButton.styleFrom(backgroundColor: colorScheme.primary),
          child: const Text('Save Employee'),
        ),
      ],
    );
  }

  Widget _buildField(TextEditingController controller, String label) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ),
    );
  }
}