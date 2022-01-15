import 'package:flutter/material.dart';
import 'package:flutter_animations_getx/view/stateful_controller/anim_icon_button.dart';
import 'package:flutter_animations_getx/view/stateless_getx/controller_getx.dart';
import 'package:get/get.dart';

class AnimContainerShadow2 extends StatelessWidget {
  final _controller = Get.put(ControllerGetx());

  final String title;

  AnimContainerShadow2({required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(() => AnimatedPhysicalModel(
            color: Colors.white,
            elevation: _controller.physicalModelShadow2Obs.value,
            shadowColor: Colors.red,
            borderRadius:
                BorderRadius.circular(_controller.physicalModelShadow2Obs.value),
            duration: Duration(milliseconds: 2000),
            shape: BoxShape.rectangle,
            child: Container(
                height: 200,
                width: 200,
                child: const Center(
                  child: Text("PhysicalModel", style: TextStyle(fontSize: 50)),
                )))),
        const SizedBox(height: 30),
        AnimatedIconButton(function: () {
          _controller.triggerPhysicalModelShadow2Animation();
        }),
      ],
    );
  }
}