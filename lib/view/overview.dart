import 'package:flutter/material.dart';
import 'package:flutter_animations_getx/core/custom_tab_bar.dart';

import 'stateful_animations.dart';
import 'stateless_getx/anim_container.dart';
import 'stateless_getx/anim_container_shadow.dart';
import 'stateless_getx/anim_container_transf.dart';
import 'stateless_getx/anim_crossfade.dart';
import 'stateless_getx/anim_opacity.dart';
import 'stateless_getx/anim_position.dart';

class Overview extends StatelessWidget {
  String title = "";

  Overview({required this.title});

  @override
  Widget build(BuildContext context) {
    var _controllers = 'No-Built-In';
    var _container = 'Container';
    var _shadow = 'Shadow';
    var _contTransf = 'Transf';
    var _crossfade = 'Crossfade';
    var _opacity = 'Opacity';
    var _position = 'Position';
    var _expanad= 'Expand';
    var _title = 'Built-In:';

    return CustomTabBar(
      title: _title,
      listTabBarView: [
        StatefulAnimations(title: _controllers),
        AnimContainer(title: _container),
        AnimContainerShadow(title: _shadow),
        AnimCrossfade(title: _crossfade),
        AnimOpacity(title: _opacity),
        AnimContainerTransf(title: _contTransf),
        AnimPosition(title: _position),
      ],
      listTabBar: [
        Tab(icon: const Icon(Icons.add_moderator), text: _controllers),
        Tab(icon: const Icon(Icons.directions_car), text: _container),
        Tab(icon: const Icon(Icons.access_alarm_outlined), text: _shadow),
        Tab(icon: const Icon(Icons.ac_unit), text: _crossfade),
        Tab(icon: const Icon(Icons.access_alarm_outlined), text: _opacity),
        Tab(icon: const Icon(Icons.accessibility_new), text: _contTransf),
        Tab(icon: const Icon(Icons.threed_rotation), text: _position),
      ],
    );
  }
}