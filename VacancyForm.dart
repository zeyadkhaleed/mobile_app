import 'package:flutter/material.dart';
import 'package:test2/homeCompany.dart';
import 'main.dart';
import 'package:test2/Signup2.dart';

class VacancyForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Vacancy Form',
      theme: new ThemeData(
          primarySwatch: Colors.blue
      ),
      home: new Vform(),
    );
  }
}


class Vform extends StatefulWidget {
  @override
  VformState createState() => new VformState();
}

class VformState extends State<Vform> {
  final _formKey = GlobalKey<FormState>();
  //var _passKey = GlobalKey<FormFieldState>();


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Vacancy Form'),
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
        ));

    formWidget.add(new TextFormField(
        decoration:
            InputDecoration(labelText: 'Enter Email', hintText: 'Email'),
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value.isEmpty) {
            return 'Enter  email';
          }
        },
        ));

    formWidget.add(new TextFormField(
        decoration:
            InputDecoration(labelText: 'Enter Job description', hintText: 'description'),
        validator: (value) {
          if (value.isEmpty) {
            return 'Enter  description';
          }
        },
        ));
    formWidget.add(new TextFormField(
        decoration:
            InputDecoration(labelText: 'Enter Job requirements', hintText: 'requirements'),
        validator: (value) {
          if (value.isEmpty) {
            return 'Enter  requirments';
          }
        },
        ));
        formWidget.add(new TextFormField(
        decoration:
            InputDecoration(labelText: 'Enter department', hintText: 'department'),
        validator: (value) {
          if (value.isEmpty) {
            return 'Enter  department';
          }
        },
        ));
    formWidget.add(new TextFormField(
        decoration:
            InputDecoration(labelText: 'Enter company area', hintText: 'area'),
        validator: (value) {
          if (value.isEmpty) {
            return 'Enter  address';
          }
        },
        ));
    

    formWidget.add(new RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        child: new Text('Submit'),
        onPressed: (){
          if (_formKey.currentState.validate())
           {
              _formKey.currentState.save();
              Navigator.push(context,MaterialPageRoute(builder: (context) => homeCompany()));
            }
          
                    }));

    return formWidget;
  }
}