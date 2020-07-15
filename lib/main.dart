import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'PlaceDetails.dart';

void main(){
  runApp(PleaceDetails());
}

class MyFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      //first page opining
      home: SafeArea(
        child: Scaffold(//scafflod is one kind of matarial app
          appBar: AppBar(
            title: Text("My First Flutter App"),
          ),
          body: Padding(
            padding:  EdgeInsets.symmetric(horizontal:0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image.network('https://picsum.photos/200/300?grayscale',
                height: 200.0,
                width: 200.0,),
                Text('Naimul Hassan Noor',style: TextStyle(fontSize: 20.0,color: Colors.redAccent,),
                textAlign: TextAlign.center,
                ),
                Text('Software Engineer',style: TextStyle(fontSize: 20.0,color: Colors.redAccent,),
                textAlign: TextAlign.center,
                ),
                Text('Works at Infolink LTD',style: TextStyle(fontSize: 20.0,color: Colors.redAccent,),
                textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Icon(Icons.call,color: Colors.blue,)),
                    Text('call me',style: TextStyle(fontSize: 20.0,color: Colors.redAccent,), textAlign: TextAlign.center,),
                  ],
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
