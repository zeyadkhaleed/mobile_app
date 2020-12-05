import 'package:flutter/material.dart';
import 'package:test2/Apply.dart';
import 'package:test2/main.dart';

class homeStudent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Home Page',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: _MyHomePage(
        title: 'Find Jobs',
      ),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  _MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  bool _isFavorited1=true; 
  bool _isFavorited2=true;
  bool _isFavorited3=true;
  bool _isFavorited4=true;
  bool _isFavorited5=true;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Table(
        border: TableBorder.all(),
        columnWidths: {2: FlexColumnWidth(1.0)},
        children: [
          TableRow(children: [
            Text(
              'Fresh-Graduate software engineers ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              'We are looking for highly skilled software engineers who are passionate about web development',
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Apply()));
              },
              child: Text('APPLY'),
              
            ),
            Container(
              child:IconButton(
                alignment: Alignment.centerRight,
                icon:(_isFavorited1 ? Icon(Icons.star):Icon(Icons.star_border)),
                color: Colors.red[500],
                onPressed: _toggleFavorite,
            )
            )
          ]),
          
          TableRow(children: [
            Text(
              'Job Offers for All Working in Marine Services - Egyptians ONLY Biggest...',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
                'Conduct site visits regularly to monitor & supervise work implementation.'),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Apply()));
              },
              child: Text('APPLY'),
            ),
            Container(
              child:IconButton(
                alignment: Alignment.centerRight,
                icon:(_isFavorited2 ? Icon(Icons.star):Icon(Icons.star_border)),
                color: Colors.red[500],
                onPressed: _toggleFavorite,
            )
            )
          ]),
          TableRow(children: [
            Text(
              'Senior Architect',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
                '- Minimum 10-15 years work, with strong background in leading the design phase & projects'),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Apply()));
              },
              child: Text('APPLY'),
            ),
            Container(
              child:IconButton(
                alignment: Alignment.centerRight,
                icon:(_isFavorited3 ? Icon(Icons.star):Icon(Icons.star_border)),
                color: Colors.red[500],
                onPressed: _toggleFavorite,
            )
            )
          ]),
          TableRow(children: [
            Text(
              'Project Manager',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
                '• Prepare and communicate Project Plan to client, project team and Client Services Management.'),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Apply()));
              },
              child: Text('APPLY'),
            ),
            Container(
              child:IconButton(
                alignment: Alignment.centerRight,
                icon:(_isFavorited4 ? Icon(Icons.star):Icon(Icons.star_border)),
                color: Colors.red[500],
                onPressed: _toggleFavorite,
            )
            )
          ]),
          TableRow(children: [
            Text(
              'High School Physics Teacher',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
                'A comprehensive employment package is offered that includes a competitive tax free salary, housing allowance, medical insurance, bus transportation and other benefits.'),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Apply()));
              },
              child: Text('APPLY'),
            ),
            Container(
              child:IconButton(
                alignment: Alignment.centerRight,
                icon:(_isFavorited5 ? Icon(Icons.star):Icon(Icons.star_border)),
                color: Colors.red[500],
                onPressed: _toggleFavorite,
            )
            )
          ]),
        ],
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
              onTap:(){Navigator.push(context,MaterialPageRoute(builder: (context) => homeStudent()));},
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
  void _toggleFavorite(){
        setState(() {
          if(_isFavorited1){
            _isFavorited1=false;
          }
          else if(! _isFavorited1){
            _isFavorited1=true;
          }

           else if(_isFavorited2){
            _isFavorited2=false;
          }
          else if(!_isFavorited2){
            _isFavorited2=true;
          }

          else if(_isFavorited3){
            
            _isFavorited3=false;
          }
          else if(! _isFavorited3){
            _isFavorited3=true;
          }

          else if(_isFavorited4){
            _isFavorited4=false;
          }
          else if(! _isFavorited4){
            _isFavorited4=true;
          }
          else if(_isFavorited5){
            _isFavorited5=false;
          }
          else if(! _isFavorited5){
            _isFavorited5=true;
          }
        });
      }
  Apply() {}
}
