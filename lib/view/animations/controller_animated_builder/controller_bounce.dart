import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animations_getx/view/animations/anim_icon_button.dart';

class ControllerBounce extends StatefulWidget {
  final String title = "";

  ControllerBounce({required title});

  @override
  _ControllerBounceState createState() => _ControllerBounceState();
}

class _ControllerBounceState extends State<ControllerBounce>
    with SingleTickerProviderStateMixin {
  // ===> STEP 1) DEFINE
  // 1.A) "AnimationController" (controller): Define the animation duration
  // 1.B) "Animation" (animation): Define the animation type/style
  late AnimationController _controller;
  late Animation _animation;

  // ===> STEP 2) INITIALIZATION:
  // 2.A) Starting the "AnimationController"
  // 2.B) Starting the "Animation"
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 2000));

    _animation = Tween(begin: 200.0, end: 120.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Interval(0.0, 1.0, curve: Curves.elasticIn),
    ));

    // ===> STEP 3) LISTENER-ANIMATION:
    // 3.A) monitoring the Animation-Status
    // 3.B) Call SetState, whenever SetState is updated:
    // 3.B.1) This listener "monitor" the animation, and when it changes, executes the the Animation-Status
    // method in side "AddListener"
    _controller.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _controller.repeat(reverse: true);
      }
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
          // STEP 01) animation:
          // - When this Animation changes
          // - it will "redraw" the "builder widget"
          // STEP 02) builder Widget:
          // - Widget that will be rebuilt, WHEN animation is triggered/changed
          child: AnimatedBuilder(
        animation: _animation,
        builder: (ctx, ch) => Container(
            width: 100,
            height: 100,
            margin: EdgeInsets.only(top: _animation.value, left: 125),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.red, width: 2),
                image: const DecorationImage(
                    image: AssetImage('assets/images/balloon.png')))),
      )),

      SizedBox(height: 30),

      // ===> STEP 6):
      // 6.A) Play/enable animation, using 'AnimationController'
      AnimatedIconButton(function: () => _controller.forward())
    ]);
  }
}