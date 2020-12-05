import 'package:flutter/material.dart';
import 'package:test2/homeStudent.dart';
import 'main.dart';

class Apply extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Apply here..',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new ApplyForm(),
    );
  }
}

class ApplyForm extends StatefulWidget {
  @override
  ApplyFormState createState() => new ApplyFormState();
}

class ApplyFormState extends State<ApplyForm> {
  final _formKey = GlobalKey<FormState>();
  var _passKey = GlobalKey<FormFieldState>();

  String _name = '';
  String _email = '';
  int _age = 0;
  String _city = '';
  int _selectedList = 0;
  String _major = '';

  List<DropdownMenuItem<int>> List1 = [];

  void loadList() {
    List1 = [];

    List1.add(new DropdownMenuItem(
      child: new Text("Male"),
      value: 0,
    ));

    List1.add(new DropdownMenuItem(
      child: new Text("Female"),
      value: 1,
    ));
  }

  void onPressedSubmit() {
    _formKey.currentState.save();
    print("Name " + _name);
    print("Email " + _email);
    print("Age " + _age.toString());
    print("Major " + _major);

    switch (_selectedList) {
      case 0:
        print("Gender Male");
        break;
      case 1:
        print("Gender Female");
        break;
    }

    print("City " + _city);

    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text('Form Submitted')));
  }

  @override
  Widget build(BuildContext context) {
    loadList();
    return new Scaffold(
      appBar: AppBar(
        title: Text('Apply Here..'),
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
            _name = value;
          });
        }));

    formWidget.add(new TextFormField(
        decoration:
            InputDecoration(labelText: 'Enter Email', hintText: 'Email'),
        keyboardType: TextInputType.emailAddress,
        onSaved: (value) {
          setState(() {
            _email = value;
          });
        }));
    formWidget.add(new TextFormField(
        decoration:
            InputDecoration(labelText: 'Enter your major', hintText: 'Major'),
        validator: (value) {
          if (value.isEmpty) {
            return 'Enter  major';
          }
        },
        onSaved: (value) {
          setState(() {
            _major = value;
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
        onSaved: (value) {
          setState(() {
            _age = int.tryParse(value);
          });
        }));

    formWidget.add(new TextFormField(
      key: _passKey,
      obscureText: true,
      decoration: InputDecoration(labelText: 'City'),
    ));

    formWidget.add(new DropdownButton(
      hint: new Text('Select Gender'),
      items: List1,
      value: _selectedList,
      onChanged: (value) {
        setState(() {
          _selectedList = value;
        });
      },
      isExpanded: true,
    ));

    formWidget.add(new RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        child: new Text('APPLY'),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Apply()));
        }));

    return formWidget;
  }

}
