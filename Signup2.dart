import 'package:flutter/material.dart';
import 'package:test2/VacancyForm.dart';
import 'package:test2/homeCompany.dart';
import 'main.dart';
class Signup2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Company signup',
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
  String password = '';
  String brief = '';
  String add = '';


 

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Company signup'),
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
        decoration: InputDecoration(labelText: 'Enter company Name', hintText: 'Name'),
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
            InputDecoration(labelText: 'Enter company Email', hintText: 'Email'),
        keyboardType: TextInputType.emailAddress,
        validator: validateEmail,
        onSaved: (value) {
          setState(() {
            email = value;
          });
        }));
    formWidget.add(new TextFormField(
        decoration:
            InputDecoration(labelText: 'Enter a brief about your company', hintText: 'breif'),
        validator: (value) {
          if (value.isEmpty) {
            return 'Enter  brief';
          }
        },
        onSaved: (value) {
          setState(() {
            brief = value;
          });
        }));
    formWidget.add(new TextFormField(
        decoration:
            InputDecoration(labelText: 'Enter company address', hintText: 'address'),
        validator: (value) {
          if (value.isEmpty) {
            return 'Enter  address';
          }
        },
        onSaved: (value) {
          setState(() {
            add = value;
          });
        }));
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
          validator: (value) {
          if (value.isEmpty) {
            return 'Enter Password';
          }
          if (value.length < 8) {
            return 'Password should be more than 8 characters';
          }
        },
          onSaved: (value) {
            setState(() {
              password = value;
            });
          }),
    );

    

    formWidget.add(new RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        child: new Text('Sign Up'),
        onPressed: (){
          if (_formKey.currentState.validate()){
            Navigator.push(context,MaterialPageRoute(builder: (context) => homeCompany()));
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