import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/instance_manager.dart';

import '../../core/anim_icon_button.dart';
import 'controller_getx_2.dart';

class FadeAnim extends StatelessWidget {
  String title = "";

  FadeAnim({required this.title});

  @override
  Widget build(BuildContext context) {
    Get.create(() => ControllerGetx2());
    final _controller = Get.find<ControllerGetx2>();
    const _imageUrl = 'assets/images/balloon.png';

    return SingleChildScrollView(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
            child: FadeTransition(
                opacity: _controller.fadeAnimation as Animation<double>,
                child: Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.red, width: 2),
                        image: const DecorationImage(image: AssetImage(_imageUrl)))))),
        const SizedBox(height: 30),
        AnimatedIconButton(function: () => _controller.fadeAnimPlay(replay: true))
      ]),
    );
  }
}