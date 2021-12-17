import 'package:flutter/material.dart';

class AnimationButton extends StatelessWidget {
  final function;

  AnimationButton(this.function);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent,
        width: double.infinity,
        child: FloatingActionButton(
          onPressed: function,
          tooltip: 'Apply Animation',
          child: const Icon(Icons.play_arrow),
        ));
  }
}