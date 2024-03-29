class Transaction {
  final int id;
  final int contractId;
  final int paidAmount;
  final DateTime paidAt;
  final String errMessage;
  final bool isApproved;
  final String status;

  const Transaction({
    required this.id,
    required this.contractId,
    required this.paidAmount,
    required this.paidAt,
    required this.errMessage,
    required this.isApproved,
    required this.status,
  });

  factory Transaction.fromJson(Map json) {
    return Transaction(
      id: json['id'],
      contractId: json['contractId'],
      paidAmount: json['paidAmount'],
      paidAt: json['paidAt'],
      errMessage: json['errMessage'],
      isApproved: json['isApproved'],
      status: json['status'],
    );
  }
}
