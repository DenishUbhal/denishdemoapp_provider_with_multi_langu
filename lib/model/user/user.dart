// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id,
    this.name,
    this.emailId,
    this.mobileNumber,
    this.gender,
    this.image,
    this.dob,
    this.fcmToken,
    this.isVerified,
  });

  String id;
  String name;
  String emailId;
  String mobileNumber;
  String gender;
  String image;
  DateTime dob;
  String fcmToken;
  String isVerified;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["Id"],
    name: json["Name"],
    emailId: json["EmailId"],
    mobileNumber: json["MobileNumber"],
    gender: json["Gender"],
    image: json["Image"],
    dob: DateTime.parse(json["DOB"]),
    fcmToken: json["FCMToken"],
    isVerified: json["IsVerified"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Name": name,
    "EmailId": emailId,
    "MobileNumber": mobileNumber,
    "Gender": gender,
    "Image": image,
    "DOB": "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
    "FCMToken": fcmToken,
    "IsVerified": isVerified,
  };
}
