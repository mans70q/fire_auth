class User {
  final String? name;
  final String email;
  final String uid;

  User({this.name, required this.email, required this.uid});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(name: json['name'], email: json['email'], uid: json['uid']);
  }

  Map<String, dynamic> toJson() => {'name': name, 'email': email, 'uid': uid};
}
