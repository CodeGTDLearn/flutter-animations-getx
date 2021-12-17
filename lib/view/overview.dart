import 'package:flutter/material.dart';

class Overview extends StatelessWidget {
  String title = "";

  Overview({required this.title});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: const <Widget>[
        Text('You have pushed the button this many times:'),
        Text('AnimatedContainer', style: TextStyle(fontSize: 10, color: Colors.yellow)),
        SizedBox(height: 50)
      ])),
    );
  }
}