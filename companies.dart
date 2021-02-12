import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test2/model/company.dart';

class Companies with ChangeNotifier {
  List<Company> _companiess = [];

  List<Company> get companies {
    return [..._companiess];
  }

  Future<void> fetchAndSetUsers() async {
    const url = 'https://jovial-welder-298012-default-rtdb.firebaseio.com/company.json';
    try {
      final response = await http.get(url);
      final dbData = json.decode(response.body) as Map<String, dynamic>;
      final List<Company> dbusers = [];
      dbData.forEach((key, data) {
        dbusers.add(Company(
          name: data['name'],
          mail: data['mail'],
          location: data['location'],
          mobile: data['mobile'],
          info: data['info'],
          pass: data['pass'],
        ));
      });
      _companiess = dbusers;
      notifyListeners();
    } on Exception catch (e) {
      print(e.toString());
      throw (e);
    }
  }


  void addUser(Company comp)  {
    
    const url = 'https://jovial-welder-298012-default-rtdb.firebaseio.com/company.json';
     http.post(url,
            body: json.encode({
              'name': comp.name,
              'mail': comp.mail,
              'mobile': comp.mobile,
              'location': comp.location,
              'info': comp.info,
              'pass':comp.pass,
            }))
        .then((http.Response response ) {
      final newUser = Company(
          name: comp.name,
          mail:comp.mail,
          location: comp.location,
          mobile: comp.mobile,
          info: comp.info,
          pass: comp.pass,
          );
      _companiess.add(newUser);
      notifyListeners();
    }).catchError((error) {
      print(error);
    });
  }

}