class User {
  final String id;
  final String title;
  final String firstname;
  final String lastname;
  final String email;
  final bool isLender;

  const User({
    required this.id,
    required this.title,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.isLender,
  });

  factory User.fromJson(Map json) {
    return User(
        id: json['id'],
        title: json['title'],
        firstname: json['firstname'],
        lastname: json['lastname'],
        email: json['email'],
        isLender: json['isLender']);
  }
}
