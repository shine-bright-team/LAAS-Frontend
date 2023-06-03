class UserCredential {
  final String userId;
  final bool isLender;

  const UserCredential({
    required this.userId,
    required this.isLender,
  });

  factory UserCredential.fromJson(Map json) {
    return UserCredential(userId: json['userId'], isLender: json['isLender']);
  }
}
