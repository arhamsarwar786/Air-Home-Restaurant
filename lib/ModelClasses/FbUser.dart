// To parse this JSON data, do
//
//     final fbUser = fbUserFromJson(jsonString);

import 'dart:convert';

FbUser fbUserFromJson(String str) => FbUser.fromJson(json.decode(str));

String fbUserToJson(FbUser data) => json.encode(data.toJson());

class FbUser {
  FbUser({
    this.name,
    this.firstName,
    this.lastName,
    this.email,
    this.id,
  });

  String name;
  String firstName;
  String lastName;
  String email;
  String id;

  factory FbUser.fromJson(Map<String, dynamic> json) => FbUser(
    name: json["name"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "id": id,
  };
}
