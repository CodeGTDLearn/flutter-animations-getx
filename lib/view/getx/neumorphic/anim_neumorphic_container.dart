import 'package:animated_neumorphic/animated_neumorphic.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

import 'controller_neumorphic.dart';

class AnimNeumorphicContainer extends StatelessWidget {
  final _controller = Get.put(ControllerNeumorphic());
  final String? title;

  AnimNeumorphicContainer({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title!)),
        backgroundColor: Colors.red,
        body: Obx(() => (Center(
                child: Column(children: [
              const SizedBox(height: 32),
              _neumorpPackageButton(color: Colors.red, child: Icon(Icons.access_time)),
              const SizedBox(height: 32),
              AnimatedNeumorphicContainer(
                  depth: _controller.neumorpContDepthObs.value,
                  width: _controller.neumorpContWidthObs.value,
                  height: _controller.neumorpContHeightObs.value,
                  color: Colors.red,
                  child: const Icon(Icons.timeline)),
              const SizedBox(height: 16),
              Slider(
                  value: _controller.neumorpContDepthObs.value,
                  min: 0.0,
                  max: 1.0,
                  onChanged: (v) => _controller.neumorpContDepthObs.value = v)
            ])))));
  }

  Widget _neumorpPackageButton({
    required Color color,
    required child,
    double width = 60.0,
    double height = 60.0,
    double radius = 16.0,
  }) {
    return GestureDetector(
      onTap: () => _controller.neumorpContIsActiveObs.value =
          !_controller.neumorpContIsActiveObs.value,
      child: AnimatedNeumorphicContainer(
        duration: Duration(milliseconds: 500),
        depth: _controller.neumorpContIsActiveObs.value ? 0.0 : 1.0,
        color: color,
        width: width,
        height: height,
        radius: radius,
        child: child,
      ),
    );
  }
}