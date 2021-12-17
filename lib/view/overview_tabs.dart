import 'package:flutter/material.dart';

import 'anim_container.dart';
import 'anim_container_transf.dart';
import 'anim_controller_ballon.dart';
import 'anim_crossfade.dart';
import 'anim_opacity.dart';
import 'anim_position.dart';

class OverviewTabs extends StatelessWidget {
  String title = "";

  OverviewTabs({required this.title});

  @override
  Widget build(BuildContext context) {
    var _container = 'Container';
    var _contTransf = 'Transf';
    var _crossfade = 'Crossfade';
    var _opacity = 'Opacity';
    var _position = 'Position';
    var _controlBallon = 'ControlBallon';
    var _title = 'Animations Types:';

    return DefaultTabController(
        length: 6,
        child: Scaffold(
            appBar: AppBar(
                title: Text(_title),
                bottom: TabBar(
                  isScrollable: true,
                  tabs: [
                    Tab(icon: const Icon(Icons.directions_car), text: _container),
                    Tab(icon: const Icon(Icons.ac_unit), text: _crossfade),
                    Tab(icon: const Icon(Icons.access_alarm_outlined), text: _opacity),
                    Tab(icon: const Icon(Icons.accessibility_new), text: _contTransf),
                    Tab(icon: const Icon(Icons.threed_rotation), text: _position),
                    Tab(icon: const Icon(Icons.call), text: _controlBallon),
                  ],
                )),
            body: SafeArea(
              child: TabBarView(
                children: [
                  AnimContainer(title: _container),
                  AnimCrossfade(title: _crossfade),
                  AnimOpacity(title: _opacity),
                  AnimContainerTransf(title: _contTransf),
                  AnimPosition(title: _position),
                  AnimControlBallon(title: _controlBallon),
                ],
              ),
            )));
  }
}