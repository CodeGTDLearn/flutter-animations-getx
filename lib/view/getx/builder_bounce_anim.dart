import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/instance_manager.dart';

import '../../core/anim_icon_button.dart';
import 'controller_getx_2.dart';

class BuilderBounceAnim extends StatelessWidget {
  final String title = "";

  BuilderBounceAnim({required title});

  @override
  Widget build(BuildContext context) {
    Get.create(() => ControllerGetx2());
    final _controller = Get.find<ControllerGetx2>();
    const _imageUrl = 'assets/images/balloon.png';

    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Center(
          child: AnimatedBuilder(
              animation: _controller.bounceAnimation,
              builder: (ctx, ch) => Container(
                  width: 100,
                  height: 100,
                  margin:
                      EdgeInsets.only(top: _controller.bounceAnimation.value, left: 125),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 2),
                      image: const DecorationImage(image: AssetImage(_imageUrl)))))),
      const SizedBox(height: 30),
      AnimatedIconButton(function: () => _controller.bounceAnimPlay(replay: true))
    ]);
  }
}