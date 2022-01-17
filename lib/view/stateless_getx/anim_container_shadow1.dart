import 'package:flutter/material.dart';
import 'package:flutter_animations_getx/view/stateful_controller/anim_icon_button.dart';
import 'package:flutter_animations_getx/view/stateless_getx/controller_getx.dart';
import 'package:get/get.dart';

class AnimContainerShadow1 extends StatelessWidget {
  final _controller = Get.put(ControllerGetx());

  final String title;

  AnimContainerShadow1({required this.title});

  @override
  Widget build(BuildContext context) {
    var _responsiveHeight = MediaQuery.of(context).size.height * 0.12;
    var _responsiveWidth = MediaQuery.of(context).size.width * 0.85;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(() => AnimatedContainer(

              duration: const Duration(milliseconds: 1000),
              transform: (_controller.animContainerScaleObs.value
                  ? (Matrix4.identity()
                    ..translate(0.025 * _responsiveWidth,
                        0.025 * _responsiveHeight) // translate towards right and down
                    ..scale(0.95,
                        0.95)) // scale with to 95% anchorred at topleft of the AnimatedContainer
                  : Matrix4.identity()),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Color(0xFF0099EE),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    // offset: Offset(
                    //   _controller.animatedContainerShadowObs.value,
                    //   _controller.animatedContainerShadowObs.value,
                    // ),
                    blurRadius: _controller.animatedContainerShadowObs.value,
                    // spreadRadius: _controller.animatedContainerShadowObs.value,
                  )
                ],
              ),
              alignment: Alignment.center,
              // onEnd: () => CustomDialog.create(context),
              width: _responsiveWidth,
              curve: Curves.ease,
              height: _responsiveHeight,
              child: Text(_controller.animatedContainerTextObs.value,
                  style: TextStyle(
                    fontSize: _controller.animContainerHeightTextObs.value,
                  )),
            )),
        const SizedBox(height: 30),
        AnimatedIconButton(function: () {
          _controller.triggerAnimContainerShadow().whenComplete(() => _controller
              .animatedContainerShadowObs
              .value = _controller.animatedContainerShadowObs.value == 10.0 ? 0.0 : 10.0);
        }),
      ],
    );
  }
}