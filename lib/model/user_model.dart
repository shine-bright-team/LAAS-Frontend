class User {
  final int id;
  final String title;
  final String firstname;
  final String lastname;
  final String email;
  final bool isLender;
  final String paychannel;
  final String payNumber;

  const User({
    required this.id,
    required this.title,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.isLender,
    required this.paychannel,
    required this.payNumber,
  });

  factory User.fromJson(Map json) {
    return User(
      id: json['id'],
      title: json['title'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      email: json['email'],
      isLender: json['isLender'],
      paychannel: json['paychannel'],
      payNumber: json['payNumber'],
    );
  }
}
