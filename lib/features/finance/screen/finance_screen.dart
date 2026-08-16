import 'package:ashtech_app/core/extension/extension_constant.dart';
import 'package:ashtech_app/features/finance/provider/finance_provider.dart';
import 'package:ashtech_app/features/finance/widgets/add_transaction_dialog.dart';
import 'package:ashtech_app/features/finance/widgets/metric_card_widget.dart';
import 'package:ashtech_app/features/finance/widgets/transaction_tile_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

@RoutePage()
class FinanceScreen extends ConsumerWidget {
  const FinanceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(financeProvider);
    final notifier = ref.read(financeProvider.notifier);

    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      appBar: AppBar(
        title: Text(
          'Finance',
          style: context.textTheme.displayMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: context.colorScheme.surface,
        elevation: 0,
        actions: [
          if (state.selectedTransaction != null)
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: OutlinedButton.icon(
                onPressed: null, // Non-functional placeholder as requested
                icon: const Icon(Icons.download, size: 18),
                label: const Text('Download Detail'),
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: context.colorScheme.primary,
        onPressed: () {
          showDialog(
            context: context,
            builder: (ctx) => AddTransactionDialog(
              onAdd: (transaction) => notifier.addTransaction(transaction),
            ),
          );
        },
        child: Icon(Icons.add, color: context.colorScheme.onPrimary),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Metrics Summary Grid
              Row(
                children: [
                  Expanded(
                    child: MetricCardWidget(
                      label: 'Inflow · All time',
                      amount: 'Rs ${state.totalInflow.toStringAsFixed(0)}',
                      valueColor: Colors.green,
                    ),
                  ),
                  const Gap(8),
                  Expanded(
                    child: MetricCardWidget(
                      label: 'Outflow · All time',
                      amount: 'Rs ${state.totalOutflow.toStringAsFixed(1)}',
                      valueColor: Colors.redAccent,
                    ),
                  ),
                  const Gap(8),
                  Expanded(
                    child: MetricCardWidget(
                      label: 'Net · All time',
                      amount: 'Rs ${state.netBalance.toStringAsFixed(1)}',
                      valueColor: Colors.teal,
                    ),
                  ),
                ],
              ),
              const Gap(16),

              // Filter Tabs
              Row(
                children: ['All', 'Inflows', 'Outflows'].map((filter) {
                  final isSelected = state.filterType == filter;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: FilterChip(
                      selected: isSelected,
                      label: Text(filter),
                      onSelected: (_) => notifier.setFilter(filter),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      side: BorderSide.none,
                      backgroundColor: context
                          .colorScheme
                          .surfaceContainerHighest
                          .withOpacity(0.3),
                      selectedColor: context.colorScheme.primaryContainer,
                    ),
                  );
                }).toList(),
              ),
              const Gap(16),

              // Transaction List
              Expanded(
                child: state.filteredTransactions.isEmpty
                    ? Center(
                        child: Text(
                          'No transactions found.',
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: context.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: state.filteredTransactions.length,
                        itemBuilder: (context, index) {
                          final tx = state.filteredTransactions[index];
                          final isSelected =
                              state.selectedTransaction?.id == tx.id;

                          return TransactionTileWidget(
                            transaction: tx,
                            isSelected: isSelected,
                            onTap: () => notifier.selectTransaction(tx),
                            onDelete: () => notifier.deleteTransaction(tx.id),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
