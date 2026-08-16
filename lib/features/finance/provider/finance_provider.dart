import 'package:ashtech_app/features/finance/model/transaction_model.dart';
import 'package:flutter_riverpod/legacy.dart';

final class FinanceState {
  final List<TransactionModel> transactions;
  final String filterType; // 'All', 'Inflows', 'Outflows'
  final TransactionModel? selectedTransaction;

  const FinanceState({
    required this.transactions,
    this.filterType = 'All',
    this.selectedTransaction,
  });

  double get totalInflow => transactions
      .where((t) => t.type == TransactionType.inflow)
      .fold(0.0, (sum, t) => sum + t.amount);

  double get totalOutflow => transactions
      .where((t) => t.type == TransactionType.outflow)
      .fold(0.0, (sum, t) => sum + t.amount);

  double get netBalance => totalInflow - totalOutflow;

  List<TransactionModel> get filteredTransactions {
    if (filterType == 'Inflows') {
      return transactions.where((t) => t.type == TransactionType.inflow).toList();
    } else if (filterType == 'Outflows') {
      return transactions.where((t) => t.type == TransactionType.outflow).toList();
    }
    return transactions;
  }

  FinanceState copyWith({
    List<TransactionModel>? transactions,
    String? filterType,
    TransactionModel? selectedTransaction,
    bool clearSelected = false,
  }) {
    return FinanceState(
      transactions: transactions ?? this.transactions,
      filterType: filterType ?? this.filterType,
      selectedTransaction: clearSelected
          ? null
          : (selectedTransaction ?? this.selectedTransaction),
    );
  }
}

final class FinanceNotifier extends StateNotifier<FinanceState> {
  FinanceNotifier() : super(const FinanceState(transactions: [])) {
    _loadInitialData();
  }

  void _loadInitialData() {
    state = state.copyWith(
      transactions: [
        const TransactionModel(
          id: '1',
          date: '2026-08-07',
          category: 'office',
          description: 'Lunch at office',
          amount: 1470,
          type: TransactionType.outflow,
        ),
        const TransactionModel(
          id: '2',
          date: '2026-08-06',
          category: 'salary',
          description: 'Paid Salary',
          linkedTo: 'Minahil Azeem',
          amount: 32500,
          type: TransactionType.outflow,
        ),
        const TransactionModel(
          id: '3',
          date: '2026-08-05',
          category: 'salary',
          description: 'Waleed Salary',
          linkedTo: 'Muhammad Waleed',
          amount: 20000,
          type: TransactionType.outflow,
        ),
        const TransactionModel(
          id: '4',
          date: '2026-08-05',
          category: 'project',
          description: 'App Development Milestone',
          linkedTo: 'Client Project',
          amount: 1410000,
          type: TransactionType.inflow,
        ),
      ],
    );
  }

  void selectTransaction(TransactionModel transaction) {
    if (state.selectedTransaction?.id == transaction.id) {
      state = state.copyWith(clearSelected: true);
    } else {
      state = state.copyWith(selectedTransaction: transaction);
    }
  }

  void setFilter(String filter) {
    state = state.copyWith(filterType: filter);
  }

  void addTransaction(TransactionModel transaction) {
    state = state.copyWith(
      transactions: [transaction, ...state.transactions],
    );
  }

  void deleteTransaction(String id) {
    final updated = state.transactions.where((t) => t.id != id).toList();
    final clearSel = state.selectedTransaction?.id == id;
    state = state.copyWith(
      transactions: updated,
      clearSelected: clearSel,
    );
  }
}

final financeProvider = StateNotifierProvider<FinanceNotifier, FinanceState>(
  (ref) => FinanceNotifier(),
);