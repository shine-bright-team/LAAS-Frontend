class UserCredential {
  final int userId;
  final bool isLender;
  final bool isSetAgreement;

  const UserCredential({
    required this.userId,
    required this.isLender,
    required this.isSetAgreement,
  });

  factory UserCredential.fromJson(Map json) {
    return UserCredential(
        userId: json['id'],
        isLender: json['is_lender'],
        isSetAgreement: json['is_set_agreement']);
  }

  get valueOrNull => null;
}
