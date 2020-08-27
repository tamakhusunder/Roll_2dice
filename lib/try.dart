import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurpleAccent.shade100,
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: Text('2 DICE'),
        ),
        body: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int leftdice = 1;
  int rightdice = 1;

  void changedice() {
    setState(() {
      leftdice = Random().nextInt(6) + 1; //1-6
      rightdice = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Flexible(
            flex: 5,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    onPressed: () {
                      changedice();
                      print('left clicked and no:$leftdice');
                    },
                    child: Image.asset(
                      'images/dice$leftdice.png',
                      color: Colors.redAccent.shade100,
                    ),
                  ),
                ),
                Expanded(
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        changedice();
                      });
                      print('right clicked and no:$rightdice');
                    },
                    child: Image.asset(
                      'images/dice$rightdice.png',
                      color: Colors.redAccent.shade200,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              child: Text('SCORE:'),
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}


