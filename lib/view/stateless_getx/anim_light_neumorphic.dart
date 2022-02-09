import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

import 'controller_getx.dart';

class AnimLightNeumorphic extends StatelessWidget {
  final _controller = Get.put(ControllerGetx());
  final String? title;

  AnimLightNeumorphic({required this.title});

  @override
  Widget build(BuildContext context) {
    var backgroundColor = Colors.grey[300];
    var notElevatedShadowColor2 = Colors.white;
    var elevatedShadowColor = Colors.grey[500];
    var iconSize = 80.0;
    var iconButton = Icons.android;
    var iconColor = Colors.black;

    return Scaffold(
      appBar: AppBar(title: Text(title!)),
      backgroundColor: backgroundColor,
      body: Center(child: Obx(
        () {
          return _lightNeuphormicButton(
            controller: _controller,
            milliseconds: 200,
            height: 200,
            width: 200,
            downButtonShadowColor: notElevatedShadowColor2,
            upButtonShadowColor: elevatedShadowColor!,
            buttonAndBackgroundColor: backgroundColor!,
            iconSize: iconSize,
            iconButton: iconButton,
            iconcolor: iconColor,
          );
        },
      )),
    );
  }

  GestureDetector _lightNeuphormicButton({
    required ControllerGetx controller,
    required int milliseconds,
    required double height,
    required double width,
    required Color downButtonShadowColor,
    required Color upButtonShadowColor,
    required Color buttonAndBackgroundColor,
    required IconData iconButton,
    required double iconSize,
    required Color iconcolor,
  }) {
    return GestureDetector(
      onTap: () => controller.triggerLightNeumorphicAnimation(fullCycle: true),
      child: AnimatedContainer(
          child: Icon(iconButton, size: iconSize, color: iconcolor),
          duration: Duration(milliseconds: milliseconds),
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: buttonAndBackgroundColor,
              borderRadius: BorderRadius.circular(50),
              boxShadow: controller.neumorphicLightIsElevatedObs.value
                  ? [
                      _upButtonShadowColor(upButtonShadowColor),
                      _downButtonShadowColor(downButtonShadowColor)
                    ]
                  : null)),
    );
  }

  BoxShadow _upButtonShadowColor(Color color) {
    return BoxShadow(
      color: color,
      offset: const Offset(4, 4),
      blurRadius: 15,
      spreadRadius: 1,
    );
  }

  BoxShadow _downButtonShadowColor(Color color) {
    return BoxShadow(
      color: color,
      offset: const Offset(-4, -4),
      blurRadius: 15,
      spreadRadius: 1,
    );
  }
}