import 'package:laas/model/contract.dart';
import 'package:laas/model/paychannel.dart';
import 'package:laas/model/user_model.dart';
import 'package:laas/services/data/lone_contract/get_loan.dart';
import 'package:laas/services/data/userdata/get_borrower.dart';

Future<PayChannel?> getPaymentByUser(int contractId) async {
  List<Contract> data = await getContract();
  List<User> borrowers = await getBorrower();
  PayChannel res = const PayChannel(channel: "", number: "0");
  int borrower;
  for (int i = 0; i < data.length; i++) {
    if (data[i].id == contractId) {
      borrower = data[i].borrowerUserId;
      for (int i = 0; i < borrowers.length; i++) {
        if (borrowers[i].id == borrower) {
          res = PayChannel(
              channel: borrowers[i].paychannel, number: borrowers[i].payNumber);
        }
      }
    }
  }

  return res;
}
