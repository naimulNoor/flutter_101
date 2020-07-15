import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(MyFlutterApp());
}

class MyFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      home: DiceGame(),

    );
  }
}

class DiceGame extends StatefulWidget {
  @override
  _DiceGameState createState() => _DiceGameState();
}

class _DiceGameState extends State<DiceGame> {
  final random = Random.secure() ;
  var index=0;
  final dices =[
    'assest/dice/d4.jpeg',
    'assest/dice/Dice-1.png',
    'assest/dice/d4.jpeg',
    'assest/dice/Dice-2E.png',
    'assest/dice/dice-3.png',
    'assest/dice/dice-6.png',
    'assest/dice/dice-5.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dice Game"),
      ),
      body: Center(

        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              Image.asset(dices[index],width: 72,height: 72,fit: BoxFit.cover,),
              RaisedButton(
                child: Text('Roll Dice'),
                onPressed: (){
                  setState(() {
                   index =random.nextInt(6);
                  });


                },
              )
          ],
        ),
      ),
    );
  }
}
