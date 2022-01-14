import 'package:flutter/material.dart';
import 'package:flutter_animations_getx/controller/controller.dart';
import 'package:flutter_animations_getx/view/stateful_controller/anim_icon_button.dart';
import 'package:get/get.dart';

class AnimContainerShadow extends StatelessWidget {
  final _controller = Get.put(Controller());

  final String title;

  AnimContainerShadow({required this.title});

// starting
//   var _myValue = 0.0;

// ending
//   final _myNewValue = 40.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(() => AnimatedContainer(
              duration: const Duration(milliseconds: 1000),
              decoration: BoxDecoration(
                color: Color(0xFF0099EE),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(_controller.animContainerShadowObs.value,
                        _controller.animContainerShadowObs.value),
                    blurRadius: _controller.animContainerShadowObs.value,
                    spreadRadius: _controller.animContainerShadowObs.value,
                  )
                ],
              ),
              alignment: Alignment.center,
              // onEnd: () => CustomDialog.create(context),
              width: 300,
              curve: Curves.bounceInOut,
              height: _controller.animContainerHeightObs.value,
              child: Container(width: 200, height: 200),
            )),
        SizedBox(height: 30),
        AnimatedIconButton(function: () {
          _controller.triggerAnimContainerShadowAnimation();
        }),
      ],
    );
  }
}
// AnimatedContainer(
// duration: const Duration(milliseconds: 300),
// curve: Curves.bounceInOut,
// height: _controller.animContainerHeightObs.value,
// width: 300,
// color: Colors.pink,
// alignment: Alignment.center,
// onEnd: () => CustomDialog.create(context),
// child: Text(
//   title,
//   style: const TextStyle(fontSize: 25, color: Colors.yellow),
// )),