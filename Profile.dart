import 'package:flutter/material.dart';
import 'main.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Profile',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new Vform(),
    );
  }
}

class Vform extends StatefulWidget {
  @override
  VformState createState() => new VformState();
}

class VformState extends State<Vform> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Your Profile'),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Image.network(
                'http://www.legorafi.fr/wp-content/uploads/2015/06/Le-professionnel.jpg',
              ),
            ),
            Container(
                alignment: Alignment(0.002, 1.0),
                child: Text(
                  'Adham Ahmad  \n 26  \n Male \n  Enginer  \n 0100609031581  \n New Cairo',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0),
                )),
          ],
        ),
      ),
    );
  }
}
