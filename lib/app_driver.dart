import 'package:flutter/material.dart';

import 'view/overview.dart';

void main() => runApp(const AppDriver());

class AppDriver extends StatelessWidget {
  const AppDriver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo Animations',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Overview(title: 'Flutter Demo Animations'),
    );
  }
}