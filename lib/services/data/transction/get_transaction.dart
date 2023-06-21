import 'package:laas/model/transaction.dart';

Future<List<Transaction>> getTransaction() async {
  List<Transaction> mockTransactions = [
    Transaction(
      id: 1,
      contractId: 1,
      paidAmount: 500,
      paidAt: DateTime(2023, 4, 1),
      errMessage: "",
      isApproved: false,
      status: "PENDING",
    ),
    Transaction(
      id: 2,
      contractId: 2,
      paidAmount: 800,
      paidAt: DateTime(2023, 4, 5),
      errMessage: "worng bill",

      isApproved: false,
      status: "ERROR",
    ),
    Transaction(
      id: 3,
      contractId: 1,
      paidAmount: 350,
      paidAt: DateTime(2023, 4, 10),
      errMessage: "",
      isApproved: true,
      status: "SUCCESS",
    ),
    Transaction(
      id: 4,
      contractId: 2,
      paidAmount: 600,
      paidAt: DateTime(2023, 4, 15),
      errMessage: "",
      isApproved: false,
      status: "SUCCESS",
    ),
  ];
  return mockTransactions;
}
