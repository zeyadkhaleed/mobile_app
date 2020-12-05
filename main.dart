import 'package:flutter/material.dart';
import 'package:test2/Signup1.dart';
import 'package:test2/Signup2.dart';
import 'package:test2/homeCompany.dart';
import 'package:test2/homeStudent.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Employment',
      theme: new ThemeData(
        primarySwatch: Colors.blue
      ),
      home: new LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>(); 
  //final TextEditingController _emailFilter = new TextEditingController();
  //final TextEditingController _passwordFilter = new TextEditingController();
  //String _email = "";
  //String _password = "";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: _buildBar(context),
      body: new Form(
        key: _formKey,
        child: new Column(
          children: <Widget>[
            _buildTextFields(),
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      title: new Text("Employment app login"),
      centerTitle: true,
    );
  }

  Widget _buildTextFields() {
    return new Container(
      child: new Column(
        children: <Widget>[
          new Container(
            child: new TextFormField(
              decoration: new InputDecoration(labelText: 'Email'),
              validator: (String value) { 
                if (value.isEmpty) {
                   return 'email cannot be empty';
                   }
                return null; 
                    },
            ),
          ),
          new Container(
            child: new TextFormField(
              decoration: new InputDecoration(labelText: 'Password'),
              //obscureText: true,
              validator: (String value) { 
                if (value.isEmpty) {
                   return 'Password cannot be empty';
                   }
                    return null; 
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildButtons() {
    
      return new Container(
        child: new Column(
          children: <Widget>[
            new RaisedButton(
              child: new Text('Login'),
              onPressed: (){
                
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  Navigator.push(context,MaterialPageRoute(builder: (context) => homeStudent()));
                } 
            },
            ),
            new Text('or'),
            new Container(
              child: new Row(
               mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new RaisedButton(
                    child: new Text('Register as student'),
                    onPressed:(){
                      Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Signup1()));
                    }
                  ),
            new RaisedButton(
              child: new Text('Register as company'),
              onPressed: (){
                      Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Signup2()));
                    }
            ),
             ]
             ),
            ),
          ],
        ),
      );
     
  }
}