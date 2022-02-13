import 'package:flutter/material.dart';
import 'package:flutter_animations_getx/core/custom_tab_bar.dart';

import 'getx/builder_bounce_anim.dart';
import 'getx/fade_anim.dart';
import 'getx/flip_anim.dart';
import 'setstate/controller_multiple.dart';
import 'getx/resize_anim.dart';
import 'getx/size_anim.dart';
import 'getx/slide_anim.dart';


class ControllerAnimations extends StatelessWidget {
  final String title = "";

  ControllerAnimations({required title});

  @override
  Widget build(BuildContext context) {
    var _controlerFade = 'Fade';
    var _controlMultipleV1 = 'Multiple';
    var _controlerResize = 'Resize';
    var _controlerSlide = 'Slide';
    var _controlerBounce = 'Bounce';
    var _controlerFlip = 'Flip';
    var _controlerSize = 'Size';
    var _title = 'Controller Animations:';

    return CustomTabBar(
      title: _title,
      listTabBarView: [
        FadeAnim(title: _controlerFade),
        ControllerMultiple(),
        ResizeAnim(title: _controlerResize),
        SlideAnim(title: _controlerSlide),
        BuilderBounceAnim(title: _controlerBounce),
        FlipAnim(title: _controlerFlip),
        SizeAnim(title: _controlerSize),
      ],
      listTabBar: [
        Tab(icon: const Icon(Icons.add_moderator), text: _controlerFade),
        Tab(icon: const Icon(Icons.call), text: _controlMultipleV1),
        Tab(icon: const Icon(Icons.accessibility_new_sharp), text: _controlerResize),
        Tab(icon: const Icon(Icons.access_alarms), text: _controlerSlide),
        Tab(icon: const Icon(Icons.add_a_photo_sharp), text: _controlerBounce),
        Tab(icon: const Icon(Icons.add_to_drive), text: _controlerFlip),
        Tab(icon: const Icon(Icons.add_a_photo_sharp), text: _controlerSize),
      ],
    );
  }
}