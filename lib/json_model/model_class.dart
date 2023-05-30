import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  String? id;
  String? name;
  String? number;
  String? email;
  String? password;

  User({
    this.id,
    this.name,
    this.number,
    this.email,
    this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json["name"],
        number: json["number"],
        email: json['email'],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "number": number,
        "email": email,
        "password": password,
      };
}
