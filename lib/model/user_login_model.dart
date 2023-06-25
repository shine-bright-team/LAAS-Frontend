class UserCredential {
  final int userId;
  final bool isLender;
  final bool isSetAgreement;
  final bool isKyc;

  const UserCredential(
      {required this.userId,
      required this.isLender,
      required this.isSetAgreement,
      required this.isKyc});

  factory UserCredential.fromJson(Map json) {
    return UserCredential(
        userId: json['id'],
        isLender: json['is_lender'],
        isSetAgreement: json['is_set_agreement'],
        isKyc: json['is_kyc']);
  }

  get valueOrNull => null;
}
