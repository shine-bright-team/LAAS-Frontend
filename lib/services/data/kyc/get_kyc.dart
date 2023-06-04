import 'package:laas/model/kyc.dart';

Future<List<KYC>> getKYC(String deptID) async {
  List<KYC> mockupKYCList = [
    KYC(
      id: 1,
      userId: 1,
      birthdate: DateTime(1990, 5, 15),
      address: '123 Street, City',
      idcard: 'ABC123XYZ',
      isApproved: true,
    ),
    KYC(
      id: 2,
      userId: 2,
      birthdate: DateTime(1985, 9, 22),
      address: '456 Avenue, Town',
      idcard: 'DEF456UVW',
      isApproved: false,
    ),
    KYC(
      id: 3,
      userId: 3,
      birthdate: DateTime(1992, 2, 10),
      address: '789 Road, Village',
      idcard: 'GHI789RST',
      isApproved: true,
    ),
    KYC(
      id: 4,
      userId: 4,
      birthdate: DateTime(1988, 12, 5),
      address: '987 Lane, Suburb',
      idcard: 'JKL987PQR',
      isApproved: true,
    ),
  ];
  return mockupKYCList;
}
