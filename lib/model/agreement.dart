class Agreement {
  final int id;
  final int contractId;
  final int interestRate;
  final int dueIn;
  final String addition;
  final bool isApproved;

  const Agreement({
    required this.id,
    required this.contractId,
    required this.interestRate,
    required this.dueIn,
    required this.addition,
    required this.isApproved,
  });

  factory Agreement.fromJson(Map json) {
    return Agreement(
      id: json['id'],
      contractId: json['contractId'],
      interestRate: json['interestRate'],
      dueIn: json['dueIn'],
      addition: json['addition'],
      isApproved: json['isApproved'],
    );
  }
}
