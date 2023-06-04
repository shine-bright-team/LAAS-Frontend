class Contract {
  final int id;
  final int agreementId;
  final int lenderUserId;
  final int borrowerUserId;
  final int loanAmount;
  final DateTime signedAt;
  final DateTime dueAt;

  const Contract({
    required this.id,
    required this.agreementId,
    required this.lenderUserId,
    required this.borrowerUserId,
    required this.loanAmount,
    required this.signedAt,
    required this.dueAt,
  });

  factory Contract.fromJson(Map json) {
    return Contract(
        id: json['id'],
        agreementId: json['agreementId'],
        lenderUserId: json['lenderUserId'],
        borrowerUserId: json['borrowerUserId'],
        loanAmount: json['loanAmount'],
        signedAt: json['signedAt'],
        dueAt: json['dueAt']);
  }
}
