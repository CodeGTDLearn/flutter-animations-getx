import 'package:flutter/material.dart';
import 'package:flutter_animations_getx/core/custom_tab_bar.dart';

import 'controller_animations.dart';
import 'stateless_getx/anim_color1_neumorphic.dart';
import 'stateless_getx/anim_color_grad_neumorphic.dart';
import 'stateless_getx/anim_container.dart';
import 'stateless_getx/anim_container_shadow1.dart';
import 'stateless_getx/anim_container_shadow2.dart';
import 'stateless_getx/anim_container_transf.dart';
import 'stateless_getx/anim_crossfade.dart';
import 'stateless_getx/anim_dark_neumorphic.dart';
import 'stateless_getx/anim_light_neumorphic_package.dart';
import 'stateless_getx/anim_light_neumorphic.dart';
import 'stateless_getx/anim_opacity.dart';
import 'stateless_getx/anim_position.dart';

class BuiltInAnimations extends StatelessWidget {
  String title = "";

  BuiltInAnimations({required this.title});

  @override
  Widget build(BuildContext context) {
    var _controllers = 'No-Built-In';
    var _container = 'Container';
    var _shadow1 = 'Shadow1';
    var _shadow2 = 'Shadow2';
    var _contTransf = 'Transf';
    var _crossfade = 'Crossfade';
    var _opacity = 'Opacity';
    var _position = 'Position';
    var _neuf1 = 'NeumPackage';
    var _neuf2 = 'Neum Light';
    var _neuf3 = 'Neum Dark';
    var _neuf4 = 'Neum Color1';
    var _neuf5 = 'Neum ColorGrad';
    var _title = 'BuiltIn Animations:';

    return CustomTabBar(
      title: _title,
      listTabBarView: [
        ControllerAnimations(title: _controllers),
        AnimContainer(title: _container),
        AnimContainerShadow1(title: _shadow1),
        AnimContainerShadow2(title: _shadow2),
        AnimCrossfade(title: _crossfade),
        AnimOpacity(title: _opacity),
        AnimContainerTransf(title: _contTransf),
        AnimPosition(title: _position),
        AnimLightNeumorphicPackage(title: _neuf1),
        AnimLightNeumorphic(title: _neuf2),
        AnimDarkNeumorphic(title: _neuf3),
        AnimColor1Neumorphic(title: _neuf4),
        AnimColorGradNeumorphic(title: _neuf5),
      ],
      listTabBar: [
        Tab(icon: const Icon(Icons.add_moderator), text: _controllers),
        Tab(icon: const Icon(Icons.directions_car), text: _container),
        Tab(icon: const Icon(Icons.access_alarm_outlined), text: _shadow1),
        Tab(icon: const Icon(Icons.access_alarm), text: _shadow2),
        Tab(icon: const Icon(Icons.ac_unit), text: _crossfade),
        Tab(icon: const Icon(Icons.access_alarm_outlined), text: _opacity),
        Tab(icon: const Icon(Icons.accessibility_new), text: _contTransf),
        Tab(icon: const Icon(Icons.threed_rotation), text: _position),
        Tab(icon: const Icon(Icons.info), text: _neuf1),
        Tab(icon: const Icon(Icons.accessible_sharp), text: _neuf2),
        Tab(icon: const Icon(Icons.accessible_sharp), text: _neuf3),
        Tab(icon: const Icon(Icons.accessible_sharp), text: _neuf4),
        Tab(icon: const Icon(Icons.accessible_sharp), text: _neuf5),
      ],
    );
  }
}