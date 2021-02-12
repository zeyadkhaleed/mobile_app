import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test2/model/user.dart';

class Users with ChangeNotifier {
  List<User> _userss = [];

  List<User> get users {
    return [..._userss];
  }

  Future<void> fetchAndSetUsers() async {
    const url = 'https://jovial-welder-298012-default-rtdb.firebaseio.com/users.json';
    try {
      final response = await http.get(url);
      final dbData = json.decode(response.body) as Map<String, dynamic>;
      final List<User> dbusers = [];
      dbData.forEach((key, data) {
        dbusers.add(User(
          name: data['name'],
          mail: data['mail'],
          age: data['age'],
          mobile: data['mobile'],
          major: data['major'],
          pass: data['pass'],
        ));
      });
      //Album.fromJson(jsonDecode(response.body));
      _userss = dbusers;
      notifyListeners();
    } on Exception catch (e) {
      print(e.toString());
      throw (e);
    }
  }


  void addUser(User user)  {
    
    const url = 'https://jovial-welder-298012-default-rtdb.firebaseio.com/users.json';
    print('dfghjkl;');
    print(user.name);
     http.post(url,
            body: json.encode({
              'name': user.name,
              'mail': user.mail,
              'mobile': user.mobile,
              'age': user.age,
              'major': user.major,
              'pass':user.pass,
            }))
        .then((http.Response response ) {
      final newUser = User(
          name: user.name,
          mail:user.mail,
          age: user.age,
          mobile: user.mobile,
          major: user.major,
          pass: user.pass,
          );
      _userss.add(newUser);
      notifyListeners();
    }).catchError((error) {
      print(error);
    });
  }

}