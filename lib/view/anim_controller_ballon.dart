import 'package:flutter/material.dart';
import 'package:flutter_animations_getx/core/animated_balloon.dart';

class AnimControlBallon extends StatefulWidget {
  String title = "";

  AnimControlBallon({required this.title});

  @override
  State<AnimControlBallon> createState() => _AnimControlBallonState();
}

class _AnimControlBallonState extends State<AnimControlBallon> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedBalloon(),
      ),
    );
  }
}