import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(home: MyApp()),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int leftdice = 1;
  int rightdice = 1;
  int sum;

  void changedice() {
    setState(() {
      leftdice = Random().nextInt(6) + 1; //1-6
      rightdice = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent.shade100,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle:false,
        title: Text(
          'Roll 2 - DICE',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    onPressed: () {
                      changedice();
                      print('left clicked and no:$leftdice');
                      sum = leftdice + rightdice;
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
                      sum = leftdice + rightdice;
                    },
                    child: Image.asset(
                      'images/dice$rightdice.png',
                      color: Colors.redAccent.shade200,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Score:$sum',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        height: 60,
        color: Colors.black12,
      ),
    );
  }
}
