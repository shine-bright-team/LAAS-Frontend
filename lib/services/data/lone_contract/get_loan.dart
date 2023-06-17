import 'package:laas/model/contract.dart';

//หมั่มๆ Home
// ดึง arara ออกมาจาก path "/lender/borrower" map value
// แก้ทุกสิ่งที่มันแดง จบ
Future<List<Contract>> getContract() async {
  List<Contract> mockupContractList = [
    Contract(
      id: 1,
      agreementId: 101,
      lenderUserId: 1,
      borrowerUserId: 5,
      loanAmount: 5000,
      signedAt: DateTime(2023, 4, 15),
      dueAt: DateTime(2023, 5, 15),
    ),
    Contract(
      id: 2,
      agreementId: 102,
      lenderUserId: 1,
      borrowerUserId: 6,
      loanAmount: 8000,
      signedAt: DateTime(2023, 4, 20),
      dueAt: DateTime(2023, 6, 1),
    ),
    Contract(
      id: 3,
      agreementId: 103,
      lenderUserId: 1,
      borrowerUserId: 7,
      loanAmount: 3000,
      signedAt: DateTime(2023, 4, 25),
      dueAt: DateTime(2023, 5, 25),
    ),
    Contract(
      id: 4,
      agreementId: 104,
      lenderUserId: 1,
      borrowerUserId: 8,
      loanAmount: 10000,
      signedAt: DateTime(2023, 4, 28),
      dueAt: DateTime(2023, 6, 30),
    ),
  ];

  return mockupContractList;
}
