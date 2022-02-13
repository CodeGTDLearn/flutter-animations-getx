import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animations_getx/view/getx/controller_getx_2.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

import '../../core/anim_icon_button.dart';

class SizeAnim extends StatelessWidget {
  final String title = "";

  SizeAnim({required title});

  late bool toggle = false;

  @override
  Widget build(BuildContext context) {
    Get.create(() => ControllerGetx2());
    final _controller = Get.find<ControllerGetx2>();
    const _imageUrl = 'assets/images/balloon.png';

    return Obx(
      () => Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
            child: Container(
                width: _controller.sizeAnimObs.value
                    ? _controller.sizeAnimation.value.width
                    : _controller.sizeAnimation.value.width,
                height: _controller.sizeAnimation.value.height,
                constraints: BoxConstraints(
                    minHeight: _controller.sizeAnimation.value.height,
                    minWidth: _controller.sizeAnimation.value.width),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 2),
                    image: const DecorationImage(image: AssetImage(_imageUrl))))),
        const SizedBox(height: 30),
        AnimatedIconButton(function: () => _controller.sizeAnimPlay(replay: false))
      ]),
    );
  }
}