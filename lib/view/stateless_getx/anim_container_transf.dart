import 'package:flutter/material.dart';
import 'package:flutter_animations_getx/view/stateless_getx/controller_getx.dart';
import 'package:flutter_animations_getx/core/custom_dialog.dart';
import 'package:flutter_animations_getx/view/stateful_controller/anim_icon_button.dart';
import 'package:get/get.dart';

class AnimContainerTransf extends StatelessWidget {
  final _controller = Get.put(ControllerGetx());

  String title = "";

  AnimContainerTransf({required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(
          () => AnimatedContainer(
              transform: _controller.animContainerTransformationObs.value
                  ? (Matrix4.identity()
                    ..translate(
                        0.025 * 150, 0.025 * 300) // translate towards right and down
                    ..scale(0.95,
                        0.95)) // scale with to 95% anchorred at topleft of the AnimatedContainer
                  : Matrix4.identity(),
              duration: const Duration(milliseconds: 300),
              curve: Curves.bounceInOut,
              height: 150,
              width: 300,
              color: Colors.pink,
              alignment: Alignment.center,
              onEnd: () => CustomDialog.create(context),
              child: Text(
                title,
                style: const TextStyle(fontSize: 25, color: Colors.yellow),
              )),
        ),
        SizedBox(height: 30),
        AnimatedIconButton(function: _controller.triggerAnimContainerTransformationAnimation),
      ],
    );
  }
}