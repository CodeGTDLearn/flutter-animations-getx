import 'package:flutter/material.dart';
import 'package:flutter_animations_getx/view/stateless_getx/controller_getx.dart';
import 'package:flutter_animations_getx/view/stateful_controller/anim_icon_button.dart';
import 'package:get/get.dart';

class AnimContainerShadow1 extends StatelessWidget {
  final _controller = Get.put(ControllerGetx());

  final String title;

  AnimContainerShadow1({required this.title});


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(() => AnimatedContainer(
              duration: const Duration(milliseconds: 1000),
              decoration: BoxDecoration(
                color: Color(0xFF0099EE),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    // offset: Offset(
                    //   _controller.animContainerShadowObs.value,
                    //   _controller.animContainerShadowObs.value,
                    // ),
                    blurRadius: _controller.animatedContainerShadow1Obs.value,
                    // spreadRadius: _controller.animContainerShadowObs.value,
                  )
                ],
              ),
              alignment: Alignment.center,
              // onEnd: () => CustomDialog.create(context),
              width: 300,
              curve: Curves.easeInOut,
              height: _controller.animContainerHeightObs.value,
              child: Container(width: 200, height: 200),
            )),
        SizedBox(height: 30),
        AnimatedIconButton(function: () {
          _controller.triggerAnimContainerShadow1Animation();
        }),
      ],
    );
  }
}
// AnimatedContainer(
// duration: const Duration(milliseconds: 300),
// curve: Curves.bounceInOut,
// height: _controller.animContainerHeightObs.value,
// width: 300,
// color: Colors.pink,
// alignment: Alignment.center,
// onEnd: () => CustomDialog.create(context),
// child: Text(
//   title,
//   style: const TextStyle(fontSize: 25, color: Colors.yellow),
// )),