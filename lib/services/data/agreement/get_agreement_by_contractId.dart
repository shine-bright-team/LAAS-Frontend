// ignore_for_file: file_names

import 'package:laas/model/agreement.dart';
import 'package:laas/services/data/agreement/get_agreement.dart';

Future<Agreement?> getDetail(int cid) async {
  List<Agreement> data = await getAgreement();
  Agreement? res;
  for (int i = 0; i > data.length; i++) {
    if (data[i].contractId == cid) {
      res = data[i];
    }
  }
  return res;
}
