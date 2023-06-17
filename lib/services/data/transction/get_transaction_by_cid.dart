import 'package:laas/model/transaction.dart';
import 'package:laas/services/data/transction/get_transaction.dart';

Future<List<Transaction?>> getTransactionByContract(int id) async {
  List<Transaction> data = await getTransaction();
  List<Transaction?> res = [];
  for (int i = 0; i < data.length; i++) {
    if (data[i].contractId == id) {
      res.add(data[i]);
    }
  }
  return res;
}
