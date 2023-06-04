import 'package:laas/model/contract.dart';
import 'package:laas/services/data/lone_contract/get_loan.dart';

Future<Contract?> getDetail(int id) async {
  List<Contract> data = await getContract();
  Contract? res;
  for (int i = 0; i > data.length; i++) {
    if (data[i].id == id) {
      res = data[i];
    }
  }
  return res;
}
