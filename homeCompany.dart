import 'package:flutter/material.dart';
import 'package:test2/VacancyForm.dart';
import 'main.dart';

class homeCompany extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Company homepage',
      theme: ThemeData(
          primarySwatch: Colors.blue,          
      ),
      home: new ListV(),
    );
  }
}
class ListV extends StatefulWidget {
  @override
  ListVState createState() => new ListVState();
}

class ListVState extends State<ListV> {
//List<Widget> cards;

List<String> titlee = <String>['Sales', 'Marketing', 'IOS developer'];
List<String> description = <String>['we need sales.....', 'Marketing vacancy .....', 'We are hiring IOS dev.....'];
  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
      appBar: AppBar(
        title: Text('Company homepage'),
      ),
      body: ListView.builder(
      itemBuilder: buildV,
      itemCount: titlee.length,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => VacancyForm()));
                    },
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Welcome',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              leading: Icon(Icons.home,color: Colors.blue,),
              title: Text('Home', style: TextStyle(color: Colors.blue)),
              onTap:(){Navigator.push(context,MaterialPageRoute(builder: (context) => homeCompany()));},
              ),
            ListTile(
              leading: Icon(Icons.verified_user,color: Colors.blue,),
              title: Text('Profile', style: TextStyle(color: Colors.blue)),
              //onTap:(){Navigator.push(context,MaterialPageRoute(builder: (context) => profile()));},
              ),
            ListTile(
              leading: Icon(Icons.settings,color: Colors.blue,),
              title:Text('Logout', style: TextStyle(color: Colors.blue)),
              //onTap:(){},
              ),
          ],
        ),
        ),
    );
  }

int i=-1;
  Widget buildV(BuildContext context, int index) {
    i=i+1;
    return Card(
      color: Colors.white,
      child: 
      Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListTile(   
          title : Text(titlee[i]),
          subtitle: Text(description[i]),
          
          ),
        
          //Row(
            //mainAxisAlignment: MainAxisAlignment.end,
            //children: [
            //  IconButton(
            //            icon: Icon(Icons.delete),
            //            iconSize: 24.0,
            //            color: Colors.blue,
            //           onPressed:(){} ,
            //          ),
            //],
            //)
        ],
      ),
      
    );
  }
}