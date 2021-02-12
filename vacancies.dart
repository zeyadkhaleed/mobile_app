import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test2/model/company.dart';
import 'package:test2/model/vacancy.dart';

class Vacancies with ChangeNotifier {
  List<Vacancy> _Vacanciess = [];

  List<Vacancy> get vacancies {
    return [..._Vacanciess];
  }

  Future<void> fetchAndSetV() async {
    const url = 'https://jovial-welder-298012-default-rtdb.firebaseio.com/vacancy.json';
    try {
      final response = await http.get(url);
      final dbData = json.decode(response.body) as Map<String, dynamic>;
      final List<Vacancy> dbusers = [];
      dbData.forEach((key, data) {
        dbusers.add(Vacancy(
          name: data['name'],
          mail: data['mail'],
          description: data['description'],
          requirments: data['requirments'],
          location: data['location'],
          department: data['department'],
        ));
      });
      _Vacanciess = dbusers;
      notifyListeners();
    } on Exception catch (e) {
      print(e.toString());
      throw (e);
    }
  }


  void addV(Vacancy vac)  {
    
    const url = 'https://jovial-welder-298012-default-rtdb.firebaseio.com/vacancy.json';
     http.post(url,
            body: json.encode({
              'name': vac.name,
              'mail': vac.mail,
              'description': vac.description,
              'requirments': vac.requirments,
              'department': vac.department,
              'location':vac.location,
            }))
        .then((http.Response response ) {
      final newcav = Vacancy(
              name: vac.name,
              mail: vac.mail,
              description: vac.description,
              requirments: vac.requirments,
              department: vac.department,
              location:vac.location
          );
      _Vacanciess.add(newcav);
      notifyListeners();
    }).catchError((error) {
      print(error);
    });
  }

}