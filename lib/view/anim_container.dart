import 'package:flutter/material.dart';
import 'package:flutter_animations_getx/controller/controller.dart';
import 'package:flutter_animations_getx/core/apply_animation_button.dart';
import 'package:get/get.dart';

class AnimContainer extends StatelessWidget {
  final _controller = Get.put(Controller());

  String title = "";

  AnimContainer({required this.title});

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            height: _height * 0.1,
            width: double.infinity,
            color: Colors.yellow,
            alignment: Alignment.center,
            child: Text(title, style: const TextStyle(fontSize: 25))),
        SizedBox(height: _height * 0.1),
        Obx(
          () => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: _controller.animatedContainerObs.value,
            width: _width * 0.5,
            color: Colors.pink,
            alignment: Alignment.center,
            child:
                Text(title, style: const TextStyle(fontSize: 25, color: Colors.yellow)),
          ),
        ),
        SizedBox(height: _height * 0.1),
        Container(
          color: Colors.grey,
          width: double.infinity,
          height: _height * 0.1,
          child: ApplyAnimatedContainerAnimationButton(controller: _controller),
        ),
      ],
    );
  }
}