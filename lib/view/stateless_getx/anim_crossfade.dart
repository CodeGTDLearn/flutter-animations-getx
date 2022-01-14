import 'package:flutter/material.dart';
import 'package:flutter_animations_getx/controller/controller.dart';
import 'package:flutter_animations_getx/view/stateful_controller/anim_icon_button.dart';
import 'package:get/get.dart';

class AnimCrossfade extends StatelessWidget {
  final _controller = Get.put(Controller());

  String title = "";

  AnimCrossfade({required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(
          () => AnimatedCrossFade(
            duration: const Duration(milliseconds: 300),
            sizeCurve: Curves.bounceOut,
            crossFadeState: _controller.animatedCrossfadeObs.value
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            firstChild: Container(
                color: Colors.pink,
                alignment: Alignment.bottomRight,
                height: 100,
                width: 300,
                child: Text('$title First child -> Origin',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 25, color: Colors.yellow))),
            secondChild: Container(
                color: Colors.blue,
                alignment: Alignment.topLeft,
                height: 50,
                width: 350,
                child: Text('$title Second child -> Target',
                    textAlign: TextAlign.right,
                    style: const TextStyle(fontSize: 15, color: Colors.black))),
          ),
        ),
        SizedBox(height: 30),
        AnimatedIconButton(function: _controller.triggerCrossfadeAnimation),
      ],
    );
  }
}