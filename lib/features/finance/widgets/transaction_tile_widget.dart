import 'package:ashtech_app/core/extension/extension_constant.dart';
import 'package:ashtech_app/features/finance/model/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TransactionTileWidget extends StatelessWidget {
  final TransactionModel transaction;
  final bool isSelected;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const TransactionTileWidget({
    super.key,
    required this.transaction,
    required this.isSelected,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final isOutflow = transaction.type == TransactionType.outflow;
    final amountPrefix = isOutflow ? '- PKR' : '+ PKR';
    final amountColor = isOutflow ? Colors.redAccent : Colors.green;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: isSelected
            ? context.colorScheme.primaryContainer.withOpacity(0.3)
            : context.colorScheme.surfaceContainerHighest.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    transaction.date,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: context.colorScheme.surface,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      transaction.category,
                      style: context.textTheme.labelSmall,
                    ),
                  ),
                ],
              ),
              const Gap(6),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          transaction.description,
                          style: context.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        if (transaction.linkedTo != null) ...[
                          const Gap(2),
                          Text(
                            'Linked: ${transaction.linkedTo}',
                            style: context.textTheme.bodySmall?.copyWith(
                              color: context.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '$amountPrefix ${transaction.amount.toStringAsFixed(0)}',
                        style: context.textTheme.bodyLarge?.copyWith(
                          color: amountColor,
                        ),
                      ),
                      const Gap(4),
                      IconButton(
                        constraints: const BoxConstraints(),
                        padding: EdgeInsets.zero,
                        icon: const Icon(Icons.delete_outline, size: 20, color: Colors.red),
                        onPressed: onDelete,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}