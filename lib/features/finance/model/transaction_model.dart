enum TransactionType { inflow, outflow }

final class TransactionModel {
  final String id;
  final String date;
  final String category;
  final String description;
  final String? linkedTo;
  final double amount;
  final TransactionType type;

  const TransactionModel({
    required this.id,
    required this.date,
    required this.category,
    required this.description,
    this.linkedTo,
    required this.amount,
    required this.type,
  });
}