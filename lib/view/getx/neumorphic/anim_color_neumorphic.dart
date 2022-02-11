import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

import 'controller_neuph.dart';

class AnimColorNeumorphic extends StatelessWidget {
  final String? title;

  AnimColorNeumorphic({required this.title});

  @override
  Widget build(BuildContext context) {
    var backgroundColor = Colors.deepPurple[300];
    var notElevatedShadowColor2 = Colors.deepPurple.shade200;
    var elevatedShadowColor = Colors.deepPurple.shade700;
    var iconSize = 80.0;
    var iconButton = Icons.android;
    var iconColor = Colors.black;

    return Scaffold(
      appBar: AppBar(title: Text(title!)),
      backgroundColor: backgroundColor,
      body: Center(
          child: button(
        milliseconds: 200,
        height: 200,
        width: 200,
        downButtonShadowColor: notElevatedShadowColor2,
        upButtonShadowColor: elevatedShadowColor,
        buttonAndBackgroundColor: backgroundColor!,
        iconSize: iconSize,
        iconButton: iconButton,
        iconcolor: iconColor,
      )),
    );
  }

  GestureDetector button({
    required int milliseconds,
    required double height,
    required double width,
    required Color downButtonShadowColor,
    required Color upButtonShadowColor,
    required Color buttonAndBackgroundColor,
    required IconData iconButton,
    required double iconSize,
    Color iconcolor = Colors.black,
    Function? onTap,
  }) {
    Get.create(() => ControllerNeuph());
    final _controller = Get.find<ControllerNeuph>();

    return GestureDetector(
      onTap: () async {
        _controller.triggerColorNeumorphicAnimation(fullCycle: true);
        Future.delayed(Duration(milliseconds: 500)).whenComplete(() {
          if (onTap != null) onTap();
        });
      },
      child: Obx(
        () => AnimatedContainer(
            child: ScaleTransition(
              scale: _controller.scaleAnimation,
              child: Icon(iconButton, size: iconSize, color: iconcolor),
            ),
            duration: Duration(milliseconds: milliseconds),
            width: width,
            height: height,
            decoration: BoxDecoration(
                color: buttonAndBackgroundColor,
                borderRadius: BorderRadius.circular(100),
                boxShadow: _controller.neumorphicColorIsElevatedObs.value
                    ? [
                        _upButtonShadowColor(upButtonShadowColor),
                        _downButtonShadowColor(downButtonShadowColor)
                      ]
                    : null)),
      ),
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