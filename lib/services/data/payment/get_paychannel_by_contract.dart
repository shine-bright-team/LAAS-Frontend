import 'package:laas/model/paychannel.dart';
import 'package:laas/services/data/payment/get_paychannel.dart';

Future<List<PayChannel?>> getPaymentByContract(int id) async {
  List<PayChannel> data = await getPaych();
  List<PayChannel?> res = [];
  for (int i = 0; i > data.length; i++) {
    if (data[i].contractId == id) {
      res.add(data[i]);
    }
  }
  return res;
}
