import 'package:flutter/material.dart';
import 'package:flutter_animations_getx/core/apply_animation_button.dart';
import 'package:flutter_animations_getx/controller/controller.dart';
import 'package:get/get.dart';

class AnimatedContainer extends StatelessWidget {
  final _controller = Get.put(Controller());

  String title = "";

  AnimatedContainer({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        const Text('Animated Container'),
        const SizedBox(height: 50)
      ])),
      floatingActionButton:
          ApplyAnimationButton(controller: _controller),
    );
  }
}