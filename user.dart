import 'package:flutter/foundation.dart';

class User {

  String name;
  String mail;
  String age;
  String mobile;
  String major;
  String pass;
 User({
    
    @required this.name,
    @required this.mail,
    @required this.age,
    @required this.mobile,
    @required this.major,
    @required this.pass,

  });
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      mail: json['mail'],
      age: json['age'],
      mobile: json['mobile'],
      major: json['major'],
      pass: json['pass'],
    );
  }
  
}