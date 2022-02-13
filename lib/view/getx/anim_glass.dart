import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

import 'controller_getx_1.dart';

class AnimGlass extends StatelessWidget {
  final _controller = Get.put(ControllerGetx1());
  final String? title;

  AnimGlass({required this.title});

  @override
  Widget build(BuildContext context) {
    var _blur = 20.0;
    var _opacity = 0.5;
    var _image = 'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg';
    return Scaffold(
        appBar: AppBar(title: Text(title!)),
        backgroundColor: Colors.grey[300],
        body: Center(
            child: Stack(children: [
          Image.network(_image, fit: BoxFit.cover, height: double.infinity),
          Center(
              child: GestureDetector(
                  onTap: () => _controller.playGlassAnim(fullCycle: true),
                  child: Obx(() {
                    return _blurEffect(
                        blur: _controller.glassIsBlueObs.value ? _blur : 0.0,
                        opacity: _controller.glassIsBlueObs.value ? _opacity : 0.0,
                        child: const SizedBox(height: 210, width: 320));
                  })))
        ])));
  }

  ClipRRect _blurEffect({var blur, var opacity, var child}) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
              child: child,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(opacity),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  border: Border.all(width: 1.5, color: Colors.white.withOpacity(0.2)))),
        ));
  }
}