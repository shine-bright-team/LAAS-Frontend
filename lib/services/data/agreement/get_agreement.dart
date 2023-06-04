import 'package:laas/model/agreement.dart';

Future<List<Agreement>> getAgreement() async {
  List<Agreement> mockAgreements = [
    const Agreement(
      id: 1,
      contractId: 1,
      interestRate: 5,
      dueIn: 30,
      addition: 'Additional terms and conditions',
      isApproved: true,
    ),
    const Agreement(
      id: 2,
      contractId: 2,
      interestRate: 7,
      dueIn: 45,
      addition: 'Additional terms and conditions',
      isApproved: false,
    ),
    const Agreement(
      id: 3,
      contractId: 3,
      interestRate: 6,
      dueIn: 60,
      addition: 'Additional terms and conditions',
      isApproved: true,
    ),
    const Agreement(
      id: 4,
      contractId: 4,
      interestRate: 4,
      dueIn: 60,
      addition: 'Additional terms and conditions',
      isApproved: true,
    ),
  ];
  return mockAgreements;
}
