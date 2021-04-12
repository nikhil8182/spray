import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:introduction_screen/introduction_screen.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
Timer time;
Future<String> fetch() async{
  print("STate on");
  var response= await http.get(Uri.http("192.168.1.18:8000", "Perfume_Switch_Admin_Room/1/"));
  time = new Timer(const Duration(seconds: 1), (){
    fetch2();
  });
}


Future<String> fetch2() async{

  print("State off");
  var response= await http.get(Uri.http("192.168.1.18:8000","Perfume_Switch_Admin_Room/0/"));
}





class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color:Colors.white,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Color(0xFF303030),
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("J u s t    ",
                style: TextStyle(color: Colors.cyan[400]),),
              Text("S p ",
                style: TextStyle(color: Colors.blue[200]),),
              Text("r ",
                style: TextStyle(color: Colors.cyanAccent[200]),),
              Text("a ",
                style: TextStyle(color: Colors.cyanAccent[400]),),
              Text(" y",
                style: TextStyle(color: Colors.cyanAccent[400]),),
            ],
          ),
        ),
        body: Center(child: Container(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              MaterialButton(
                child:Image.asset('assets/images/barath.jpg'),
                onPressed: (){
                  fetch();
                },
              )
            ],
          ),
        ),
        ),
      ),
    );
  }
}







