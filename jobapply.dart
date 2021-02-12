import 'dart:io';
import 'dart:math';    
import 'package:file_picker/file_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';  
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';    
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;  

class jobapply extends StatefulWidget{
  @override
    _jobapplyState createState() => _jobapplyState();
}
class _jobapplyState extends State<jobapply> {

File _image;    
String _uploadedFileURL;
final mainReference = FirebaseDatabase.instance.reference().child('cv');

Future chooseFile()async{
  var rng = new Random();
  String randomName="";
  for (var i = 0; i < 20; i++) {
    print(rng.nextInt(100));
    randomName += rng.nextInt(100).toString();
  }
  File file = await FilePicker.getFile(type: FileType.custom);
  String fileName = '${randomName}.pdf';
  print(fileName);
  print('${file.readAsBytesSync()}');
  savePdf(file.readAsBytesSync(), fileName);
}  

Future savePdf(List<int> asset, String name) async {

  const url2 = 'https://jovial-welder-298012-default-rtdb.firebaseio.com';

  FirebaseStorage storage = FirebaseStorage.instance;
  Reference ref = storage.ref().child(name);
  UploadTask uploadTask = ref.putData(asset);
  http.post(url2,body: uploadTask);
  //StorageReference reference = FirebaseStorage.instance.ref().child(name);
  //StorageUploadTask uploadTask = reference.putData(asset);
  var url =uploadTask.then((res) {
   res.ref.getDownloadURL();
  });
  String urll=url.toString();
  //String url = await (await uploadTask.onComplete).ref.getDownloadURL();
  print(urll);
  documentFileUpload(urll);
  return  urll;
}
void documentFileUpload(String str) {

  var data = {
    "PDF": str,
  };
  mainReference.child("Documents").child('pdf').set(data).then((v) {
  });
}
@override    
Widget build(BuildContext context) {    
   return Scaffold(    
     appBar: AppBar(    
       title: Text('Upload your cv'),    
     ),    
     body: Center(    
       child: Column(    
         children: <Widget>[    
               
           _image == null    
               ? RaisedButton(    
                   child: Text('Choose File'),    
                   onPressed: chooseFile,    
                   color: Colors.cyan,    
                 )    
               : Container(),       
         ],    
       ),    
     ),    
   );  
}
}