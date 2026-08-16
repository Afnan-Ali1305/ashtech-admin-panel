import 'package:ashtech_app/core/extension/extension_constant.dart';
import 'package:ashtech_app/features/finance/model/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddTransactionDialog extends StatefulWidget {
  final Function(TransactionModel) onAdd;

  const AddTransactionDialog({super.key, required this.onAdd});

  @override
  State<AddTransactionDialog> createState() => _AddTransactionDialogState();
}

class _AddTransactionDialogState extends State<AddTransactionDialog> {
  final _formKey = GlobalKey<FormState>();
  final _descController = TextEditingController();
  final _amountController = TextEditingController();
  final _categoryController = TextEditingController();
  final _linkedController = TextEditingController();
  TransactionType _selectedType = TransactionType.outflow;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Text('Add Transaction', style: context.textTheme.titleLarge),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SegmentedButton<TransactionType>(
                segments: const [
                  ButtonSegment(value: TransactionType.outflow, label: Text('Outflow')),
                  ButtonSegment(value: TransactionType.inflow, label: Text('Inflow')),
                ],
                selected: {_selectedType},
                onSelectionChanged: (set) => setState(() => _selectedType = set.first),
              ),
              const Gap(12),
              TextFormField(
                controller: _descController,
                decoration: const InputDecoration(labelText: 'Description'),
                validator: (v) => v == null || v.isEmpty ? 'Required' : null,
              ),
              const Gap(8),
              TextFormField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Amount (PKR)'),
                validator: (v) => v == null || double.tryParse(v) == null ? 'Enter valid amount' : null,
              ),
              const Gap(8),
              TextFormField(
                controller: _categoryController,
                decoration: const InputDecoration(labelText: 'Category'),
                validator: (v) => v == null || v.isEmpty ? 'Required' : null,
              ),
              const Gap(8),
              TextFormField(
                controller: _linkedController,
                decoration: const InputDecoration(labelText: 'Linked To (Optional)'),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final newTx = TransactionModel(
                id: DateTime.now().millisecondsSinceEpoch.toString(),
                date: DateTime.now().toString().split(' ')[0],
                category: _categoryController.text.trim(),
                description: _descController.text.trim(),
                linkedTo: _linkedController.text.trim().isEmpty ? null : _linkedController.text.trim(),
                amount: double.parse(_amountController.text.trim()),
                type: _selectedType,
              );
              widget.onAdd(newTx);
              Navigator.pop(context);
            }
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}