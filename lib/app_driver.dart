import 'package:flutter/material.dart';

import 'view/built_in_animations.dart';

void main() => runApp(const AppDriver());

class AppDriver extends StatelessWidget {
  const AppDriver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo Animations',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BuiltInAnimations(title: 'Flutter Demo Animations'),
    );
  }
}