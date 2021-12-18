import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animations_getx/view/animations/anim_icon_button.dart';

class ControllerFlip extends StatefulWidget {
  String title = "";

  ControllerFlip({required this.title});

  @override
  _ControllerFlipState createState() => _ControllerFlipState();
}

class _ControllerFlipState extends State<ControllerFlip>
    with SingleTickerProviderStateMixin {
  // ===> STEP 1) DEFINE
  // 1.A) "AnimationController" (controller): Define the animation duration
  // 1.B) "Animation" (animation): Define the animation type/style
  late AnimationController _controller;
  late Animation _animation;
  late AnimationStatus _animationStatus = AnimationStatus.dismissed;

  // ===> STEP 2) INITIALIZATION:
  // 2.A) Starting the "AnimationController"
  // 2.B) Starting the "Animation"
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1200));

    _animation = Tween<double>(end: 1.0, begin: 0.0).animate(_controller);

    // ===> STEP 3) LISTENER-ANIMATION:
    // 3.A) monitoring the Animation-Status
    // 3.B) Call SetState, whenever SetState is updated:
    // 3.B.1) This listener "monitor" the animation, and when it changes, executes the the Animation-Status
    // method in side "AddListener"
    _animation
      ..addStatusListener((status) {
        _animationStatus = status;
      })
      ..addListener(() {
        setState(() {});
      });
  }

  // ===> STEP 4) DISPOSING:
  // 4.A) Disposing the "AnimationController"
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Center(
        // ===> STEP 5):
        // 5.A) Add AnimationWidget to be managed by 'Animation'
        child: Transform(
          alignment: FractionalOffset.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.002)
            ..rotateX(pi * (_animation.value)),
          child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.red, width: 2),
                  image: const DecorationImage(
                      image: AssetImage('assets/images/balloon.png')))),
        ),
      ),

      SizedBox(height: 30),

      // ===> STEP 6):
      // 6.A) Play/enable animation, using 'AnimationController'
      AnimatedIconButton(function: () => _controller.isCompleted ? _controller.reverse() : _controller.forward())
    ]);
  }


}