import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'anim_icon_button.dart';

class ControllerSize extends StatefulWidget {
  final String title = "";

  ControllerSize({required title});

  @override
  _ControllerSizeState createState() => _ControllerSizeState();
}

class _ControllerSizeState extends State<ControllerSize>
    with SingleTickerProviderStateMixin {
  // ===> STEP 1) DEFINE
  // 1.A) "AnimationController" (controller): Define the animation duration
  // 1.B) "Animation" (animation): Define the animation type/style
  late AnimationController _controller;
  late Animation _animation;
  late bool toggle = false;

  // ===> STEP 2) INITIALIZATION: Tween -> Between (from BEGIN to END)
  // 2.A) Starting the "AnimationController"
  // 2.B) Starting the "Animation"
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _animation = Tween<Size>(begin: Size(25, 25), end: Size(100, 100))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));

    // ===> STEP 3) LISTENER-ANIMATION:
    // 3.A) monitoring the Animation-Status
    // 3.B) Call SetState, whenever SetState is updated:
    // 3.B.1) This listener "monitor" the animation, and when it changes, executes the the Animation-Status
    // method in side "AddListener"
    _animation.addListener(() {
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
          child: Container(
              width: _animation.value.width,
              height: _animation.value.height,
              constraints: BoxConstraints(
                  minHeight: _animation.value.height, minWidth: _animation.value.width),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.red, width: 2),
                  image: const DecorationImage(
                      image: AssetImage('assets/images/balloon.png'))))),

      SizedBox(height: 30),

      // ===> STEP 6):
      // 6.A) Play/enable animation, using 'AnimationController'
      AnimatedIconButton(function: () {
        _controller.isCompleted ? _controller.reverse() : _controller.forward();
      })
    ]);
  }
}