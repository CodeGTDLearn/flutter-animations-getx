import 'package:flutter/material.dart';
import 'package:flutter_animations_getx/controller/controller.dart';

class ApplyAnimatedContainerAnimationButton extends StatelessWidget {
  const ApplyAnimatedContainerAnimationButton({
    Key? key,
    required Controller controller,
  })  : _controller = controller,
        super(key: key);

  final Controller _controller;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: _controller.applyAnimatedContainerAnimation,
      tooltip: 'Apply Animation',
      child: const Icon(Icons.add),
    );
  }
}