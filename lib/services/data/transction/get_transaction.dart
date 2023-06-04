import 'package:laas/model/transaction.dart';

Future<List<Transaction>> getTransaction() async {
  List<Transaction> mockTransactions = [
    Transaction(
      id: 1,
      contractId: 1,
      paidAmount: 500,
      paidAt: DateTime(2023, 4, 1),
    ),
    Transaction(
      id: 2,
      contractId: 2,
      paidAmount: 800,
      paidAt: DateTime(2023, 4, 5),
    ),
    Transaction(
      id: 3,
      contractId: 1,
      paidAmount: 350,
      paidAt: DateTime(2023, 4, 10),
    ),
    Transaction(
      id: 4,
      contractId: 4,
      paidAmount: 600,
      paidAt: DateTime(2023, 4, 15),
    ),
  ];
  return mockTransactions;
}
