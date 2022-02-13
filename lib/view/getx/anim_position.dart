import 'package:flutter/material.dart';
import 'package:flutter_animations_getx/core/anim_icon_button.dart';
import 'package:flutter_animations_getx/core/custom_dialog.dart';
import 'package:flutter_animations_getx/view/getx/controller_getx_1.dart';
import 'package:get/get.dart';

class AnimPosition extends StatelessWidget {
  final _controller = Get.put(ControllerGetx1());

  String title = "";

  AnimPosition({required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Obx(() => Container(
          height: 300,
          color: Colors.green,
          child: Stack(fit: StackFit.expand, children: [
            AnimatedPositioned(
                child: const Icon(Icons.free_breakfast, size: 128, color: Colors.red),
                duration: const Duration(seconds: 2),
                top: _controller.animPositionTopObs.value,
                left: _controller.animPositionLeftObs.value,
                curve: Curves.elasticOut,
                onEnd: () => CustomDialog.create(context))
          ]))),
      const SizedBox(height: 30),
      AnimatedIconButton(function: _controller.playPositionAnim)
    ]);
  }
}