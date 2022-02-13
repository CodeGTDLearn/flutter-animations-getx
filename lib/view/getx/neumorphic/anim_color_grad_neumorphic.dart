import 'package:flutter/material.dart';
import 'package:flutter_animations_getx/view/getx/neumorphic/controller_neumorphic.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

class AnimColorGradNeumorphic extends StatelessWidget {
  final String? title;

  AnimColorGradNeumorphic({required this.title});

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
    Get.create(() => ControllerNeumorphic());
    final _controller = Get.find<ControllerNeumorphic>();

    return GestureDetector(
        onTap: () => _controller.playColorNeumorphicAnim(fullCycle: true),
        child: Obx(() => AnimatedContainer(
            child: ScaleTransition(
                scale: _controller.scaleAnimationIcon,
                child: Icon(iconButton, size: iconSize, color: iconcolor)),
            duration: Duration(milliseconds: milliseconds),
            width: width,
            height: height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.deepPurple.shade200, Colors.deepPurple.shade400],
                    stops: [0.1, 0.9]),
                color: buttonAndBackgroundColor,
                borderRadius: BorderRadius.circular(100),
                boxShadow: _controller.neumorpColorIsElevatedObs.value
                    ? [
                        _upButtonShadowColor(upButtonShadowColor),
                        _downButtonShadowColor(downButtonShadowColor)
                      ]
                    : null))));
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