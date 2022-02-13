import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

import 'controller_neumorphic.dart';

class AnimDarkNeumorphic extends StatelessWidget {
  final String? title;

  AnimDarkNeumorphic({required this.title});

  @override
  Widget build(BuildContext context) {
    var backgroundColor = Colors.grey[850];
    var notElevatedShadowColor2 = Colors.grey[800]!;
    var elevatedShadowColor = Colors.grey[900];
    var iconSize = 100.0;
    var iconButton = Icons.android;
    var iconColor = Colors.white;

    return Scaffold(
      appBar: AppBar(title: Text(title!)),
      backgroundColor: backgroundColor,
      body: Center(
        child: button(
          milliseconds: 200,
          height: 200,
          width: 200,
          downButtonShadowColor: notElevatedShadowColor2,
          upButtonShadowColor: elevatedShadowColor!,
          buttonAndBackgroundColor: backgroundColor!,
          iconSize: iconSize,
          iconButton: iconButton,
          iconcolor: iconColor,
        ),
      ),
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
        onTap: () async {
          _controller.playDarkNeumorphicAnim(fullCycle: true);
          Future.delayed(Duration(milliseconds: 500)).whenComplete(() {
            if (onTap != null) onTap();
          });
        },
        child: Obx(() => AnimatedContainer(
            child: ScaleTransition(
                scale: _controller.scaleAnimationIcon,
                child: Icon(iconButton, size: iconSize, color: iconcolor)),
            duration: Duration(milliseconds: milliseconds),
            width: width,
            height: height,
            decoration: BoxDecoration(
                color: buttonAndBackgroundColor,
                borderRadius: BorderRadius.circular(50),
                boxShadow: _controller.neumorpDarkIsElevatedObs.value
                    ? [
                        _upButtonShadowColor(upButtonShadowColor),
                        _downButtonShadowColor(downButtonShadowColor)
                      ]
                    : null))));
  }

  BoxShadow _upButtonShadowColor(Color color) {
    return BoxShadow(
      color: color,
      offset: const Offset(5, 5),
      blurRadius: 15,
      spreadRadius: 1,
    );
  }

  BoxShadow _downButtonShadowColor(Color color) {
    return BoxShadow(
      color: color,
      offset: const Offset(-5, -5),
      blurRadius: 15,
      spreadRadius: 1,
    );
  }
}