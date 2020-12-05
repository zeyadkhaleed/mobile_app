import 'package:flutter/material.dart';
import 'package:test2/homeCompany.dart';
import 'package:test2/homeStudent.dart';
import 'main.dart';

class Signup1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Students signup',
      theme: new ThemeData(
          primarySwatch: Colors.blue
      ),
      home: new SignUpForm(),
    );
  }
}


class SignUpForm extends StatefulWidget {
  @override
  SignUpFormState createState() => new SignUpFormState();
}

class SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  var _passKey = GlobalKey<FormFieldState>();

  String name = '';
  String email = '';
  int age = 0;
  String password = '';
  int selectedGender = 0;
  String major = '';

  

  List<DropdownMenuItem<int>> genderList = [];

  void loadGenderList() {
    genderList = [];

    genderList.add(new DropdownMenuItem(
      child: new Text("Male"),
      value: 0,
    ));

    genderList.add(new DropdownMenuItem(
      child: new Text("Female"),
      value: 1,
    ));

  }


  @override
  Widget build(BuildContext context) {
    loadGenderList();
    return new Scaffold(
      appBar: AppBar(
        title: Text('Student signup'),
      ),
      body: Form(
        key: _formKey,
        child: new ListView(
          children: getFormWidget(),
        ),
      ),
    );
  }

  List<Widget> getFormWidget() {
    List<Widget> formWidget = new List();

    formWidget.add(new TextFormField(
        decoration: InputDecoration(labelText: 'Enter Name', hintText: 'Name'),
        validator: (value) {
          if (value.isEmpty) {
            return 'Enter a name';
          }
        },
        onSaved: (value) {
          setState(() {
            name = value;
          });
        }));

    formWidget.add(new TextFormField(
        decoration:
            InputDecoration(labelText: 'Enter Email', hintText: 'Email'),
        keyboardType: TextInputType.emailAddress,
        validator:validateEmail,
        onSaved: (value) {
          setState(() {
            email = value;
          });
        }));
    formWidget.add(new TextFormField(
        decoration:
            InputDecoration(labelText: 'Enter major', hintText: 'Major'),
        validator: (value) {
          if (value.isEmpty) {
            return 'Enter  major';
          }
        },
        onSaved: (value) {
          setState(() {
            major = value;
          });
        }));
    formWidget.add(new TextFormField(
        decoration: InputDecoration(labelText: 'Enter Age', hintText: 'Age'),
        keyboardType: TextInputType.number,
        validator: (value) {
          if (value.isEmpty) {
            return 'Enter Age';
          }
        },
      ));

    formWidget.add(new TextFormField(
        key: _passKey,
        obscureText: true,
        decoration:
            InputDecoration(labelText: 'Enter Password', hintText: 'Password'),
        validator: (value) {
          if (value.isEmpty) {
            return 'Enter Password';
          }
          if (value.length < 8) {
            return 'Password should be more than 8 characters';
          }
        }));

    formWidget.add(
      new TextFormField(
          obscureText: true,
          decoration: InputDecoration(
              hintText: 'Confirm Password',
              labelText: 'Enter Confirm Password'),
          validator: (confirmPassword) {
            if (confirmPassword.isEmpty) return 'Enter confirm password';
            var password = _passKey.currentState.value;
            
          },
          onSaved: (value) {
            setState(() {
              password = value;
            });
          }),
    );

    formWidget.add(new DropdownButton(
      hint: new Text('Select Gender'),
      items: genderList,
      value: selectedGender,
      onChanged: (value) {
        setState(() {
          selectedGender = value;
        });
      },
      isExpanded: true,
    ));

    formWidget.add(new RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        child: new Text('Sign Up'),
        onPressed: (){
          if (_formKey.currentState.validate())
           {
              _formKey.currentState.save();
              Navigator.push(context,MaterialPageRoute(builder: (context) => homeStudent()));
            }
        }));

    return formWidget;
  }
  String validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter mail';
    }

    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }
}