import 'package:flutter/material.dart';
import 'package:flutter_animations_getx/controller/controller.dart';

class ApplyAnimationButton extends StatelessWidget {
  const ApplyAnimationButton({
    Key? key,
    required Controller controller,
  })  : _controller = controller,
        super(key: key);

  final Controller _controller;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: _controller.applyAnimation,
      tooltip: 'Apply Animation',
      child: const Icon(Icons.add),
    );
  }
}