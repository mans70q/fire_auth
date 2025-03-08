class AppUser {
  final String? name;
  final String email;
  final String uid;

  AppUser({this.name, required this.email, required this.uid});

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(name: json['name'], email: json['email'], uid: json['uid']);
  }

  Map<String, dynamic> toJson() => {'name': name, 'email': email, 'uid': uid};
}
