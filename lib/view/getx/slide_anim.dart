import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

import '../../core/anim_icon_button.dart';
import 'controller_getx_2.dart';

class SlideAnim extends StatelessWidget {
  final String title = "";

  SlideAnim({required title});

  @override
  Widget build(BuildContext context) {
    Get.create(() => ControllerGetx2());
    final _controller = Get.find<ControllerGetx2>();
    const _imageUrl = 'assets/images/balloon.png';

    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Center(
          child: SlideTransition(
              position: _controller.slideAnimation,
              child: Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 2),
                      image: const DecorationImage(image: AssetImage(_imageUrl)))))),
      const SizedBox(height: 30),
      AnimatedIconButton(function: () => _controller.slideAnimPlay(replay: true))
    ]);
  }
}