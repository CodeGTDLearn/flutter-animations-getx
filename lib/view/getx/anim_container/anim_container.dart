import 'package:flutter/material.dart';
import 'package:flutter_animations_getx/core/anim_icon_button.dart';
import 'package:flutter_animations_getx/core/custom_dialog.dart';
import 'package:flutter_animations_getx/view/getx/controller_getx_1.dart';
import 'package:get/get.dart';

class AnimContainer extends StatelessWidget {
  final _controller = Get.put(ControllerGetx1());

  final String title;

  AnimContainer({required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Obx(() => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.bounceInOut,
          height: _controller.animContainerHeightObs.value,
          width: 300,
          color: Colors.pink,
          alignment: Alignment.center,
          onEnd: () => CustomDialog.create(context),
          child:
              Text(title, style: const TextStyle(fontSize: 25, color: Colors.yellow)))),
      const SizedBox(height: 30),
      AnimatedIconButton(function: () {
        _controller.playAnimContainerHeightAnim();
      })
    ]);
  }
}