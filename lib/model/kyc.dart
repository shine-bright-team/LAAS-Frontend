class KYC {
  final int id;
  final int userId;
  final DateTime birthdate;
  final String address;
  final String idcard;
  final bool isApproved;

  const KYC({
    required this.id,
    required this.userId,
    required this.birthdate,
    required this.address,
    required this.idcard,
    required this.isApproved,
  });

  factory KYC.fromJson(Map json) {
    return KYC(
        id: json['id'],
        userId: json['userId'],
        birthdate: json['birthdate'],
        address: json['address'],
        idcard: json['idcard'],
        isApproved: json['isApproved']);
  }
}
