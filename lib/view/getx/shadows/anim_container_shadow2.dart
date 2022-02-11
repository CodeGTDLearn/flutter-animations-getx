import 'package:flutter/material.dart';
import 'package:flutter_animations_getx/view/setstate/anim_icon_button.dart';
import 'package:flutter_animations_getx/view/getx/controller.dart';
import 'package:get/get.dart';

class AnimContainerShadow2 extends StatelessWidget {
  final _controller = Get.put(Controller());

  final String title;

  AnimContainerShadow2({required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(() => AnimatedPhysicalModel(
            color: _controller.physicalModelColorObs.value,
            elevation: _controller.physicalModelElevationObs.value,
            shadowColor: _controller.physicalModelColorObs.value,
            shape: BoxShape.rectangle,
            duration: const Duration(milliseconds: 1500),
            // animateColor: true,
            // animateShadowColor: true,
            // onEnd: () => print("endou"),
            // borderRadius:
            //     BorderRadius.circular(_controller.physicalModelElevationObs.value),
            child: GestureDetector(
              onTap: () => _trigger.call(),
              child: Container(
                width: 100,
                height: 100,
                child: Center(
                  child: Text(
                    _controller.physicalModelTextObs.value,
                    style: const TextStyle(fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ))),
        const SizedBox(height: 30),
        AnimatedIconButton(function: _trigger),
      ],
    );
  }

  _trigger() async {
    _controller.triggerPhysicalModelAnimations().whenComplete(() => _controller
        .physicalModelElevationObs
        .value = _controller.physicalModelElevationObs.value == 25.0 ? 0.0 : 25.0);
  }
}