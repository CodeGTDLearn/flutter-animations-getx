import 'package:flutter/material.dart';
import 'package:flutter_animations_getx/view/stateless_getx/controller_getx.dart';
import 'package:flutter_animations_getx/core/custom_dialog.dart';
import 'package:flutter_animations_getx/view/stateful_controller/anim_icon_button.dart';
import 'package:get/get.dart';

class AnimOpacity extends StatelessWidget {
  final _controller = Get.put(ControllerGetx());

  String title = "";

  AnimOpacity({required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(
          () => AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            curve: Curves.bounceOut,
            opacity: _controller.animatedOpacityObs.value,
            onEnd: () => CustomDialog.create(context),
            child: Container(
                color: Colors.pink,
                alignment: Alignment.bottomRight,
                height: 100,
                width: 300,
                child: Text('$title First child -> Origin',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 25, color: Colors.yellow))),
          ),
        ),
        SizedBox(height: 30),
        AnimatedIconButton(function: _controller.triggerOpacityAnimation),
      ],
    );
  }
}