import 'package:animated_neumorphic/animated_neumorphic.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

import 'controller_getx.dart';

class AnimNeumorphic extends StatelessWidget {
  final _controller = Get.put(ControllerGetx());
  final String? title;

  AnimNeumorphic({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title!)),
        backgroundColor: Colors.red,
        body: Obx(
          () => (Center(
              child: Column(
            children: [
              const SizedBox(height: 32),
              _neumorphicButton(
                color: Colors.red,
                child: Icon(Icons.access_time),
              ),
              const SizedBox(height: 32),
              AnimatedNeumorphicContainer(
                depth: _controller.neum_depth.value,
                width: _controller.neum_width.value,
                height: _controller.neum_height.value,
                color: Colors.red,
                child: const Icon(Icons.timeline),
              ),
              const SizedBox(height: 16),
              Slider(
                value: _controller.neum_depth.value,
                min: 0.0,
                max: 1.0,
                onChanged: (v) => _controller.neum_depth.value = v,
              ),
            ],
          ))),
        ));
  }

  Widget _neumorphicButton({
    required Color color,
    required child,
    double width = 60.0,
    double height = 60.0,
    double radius = 16.0,
    // int milliseconds = 500,
  }) {
    return GestureDetector(
      onTap: () => _controller.neum_isActive.value = !_controller.neum_isActive.value,
      child: AnimatedNeumorphicContainer(
        duration: Duration(milliseconds: 500),
        depth: _controller.neum_isActive.value ? 0.0 : 1.0,
        color: color,
        width: width,
        height: height,
        radius: radius,
        child: child,
      ),
    );
  }
}