import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ControllerGetx2 extends GetxController with GetTickerProviderStateMixin {
  // SLIDE-ANIMATION
  late AnimationController slideAnimController;
  late Animation<Offset> slideAnimation;

  // BOUNCE-BUILDER-ANIMATION
  late AnimationController bounceAnimController;
  late Animation bounceAnimation;

  // FADE-ANIMATION
  late AnimationController fadeAnimController;
  late Animation fadeAnimation;

  // FLIP-ANIMATION
  late AnimationController flipAnimController;
  late Animation flipAnimation;
  var flipAnimObs = false.obs;

  // RESIZE-ANIMATION
  late AnimationController resizeAnimController;
  late Animation resizeAnimation;

  // SIZE-ANIMATION
  late AnimationController sizeAnimController;
  late Animation sizeAnimation;
  var sizeAnimObs = false.obs;

  @override
  void onInit() {
    super.onInit();
    _slideAnimationSetup();
    _bounceAnimationSetup();
    _fadeAnimationSetup();
    _flipAnimationSetup();
    _resizeAnimationSetup();
    _sizeAnimationSetup();
  }

  @override
  void dispose() {
    super.dispose();
    slideAnimController.dispose();
    bounceAnimController.dispose();
    fadeAnimController.dispose();
    flipAnimController.dispose();
    resizeAnimController.dispose();
    sizeAnimController.dispose();
  }

  // SLIDE-ANIMATION
  void slideAnimPlay({bool replay = false}) async {
    _replay(replay, slideAnimController);

    slideAnimController.forward();
    if (!replay) {
      await Future.delayed(const Duration(milliseconds: 2000));
      slideAnimController.reverse();
    }
  }
  void _slideAnimationSetup() {
    slideAnimController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 2000));

    slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(1.5, 0.0),
    ).animate(CurvedAnimation(
      parent: slideAnimController,
      curve: Curves.elasticIn,
    ));

    // ===> STEP 3) LISTENER-ANIMATION:
    // 3.A) monitoring the Animation-Status
    // 3.B) Call SetState, whenever SetState is updated:
    // 3.B.1) This listener "monitor" the animation, and when it changes, executes the the Animation-Status
    // method in side "AddListener"
    // slideAnimController.addStatusListener((AnimationStatus status) {
    //   if (status == AnimationStatus.completed) {
    //     slideAnimController.repeat(reverse: true);
    //   }
    // });
  }

  // BOUNCE-BUILDER-ANIMATION
  void bounceAnimPlay({bool replay = false}) async {
    _replay(replay, bounceAnimController);

    bounceAnimController.forward();
    if (!replay) {
      await Future.delayed(const Duration(milliseconds: 2000));
      bounceAnimController.reverse();
    }
  }
  void _bounceAnimationSetup() {
    bounceAnimController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 2000));

    bounceAnimation = Tween(begin: 200.0, end: 120.0).animate(CurvedAnimation(
      parent: bounceAnimController,
      curve: Interval(0.0, 1.0, curve: Curves.elasticIn),
    ));

    // ===> STEP 3) LISTENER-ANIMATION:
    // 3.A) monitoring the Animation-Status
    // 3.B) Call SetState, whenever SetState is updated:
    // 3.B.1) This listener "monitor" the animation, and when it changes, executes the the Animation-Status
    // method in side "AddListener"
    // slideAnimController.addStatusListener((AnimationStatus status) {
    //   if (status == AnimationStatus.completed) {
    //     slideAnimController.repeat(reverse: true);
    //   }
    // });
  }

  // FADE-ANIMATION
  void fadeAnimPlay({bool replay = false}) async {
    _replay(replay, fadeAnimController);

    fadeAnimController.forward();
    if (!replay) {
      await Future.delayed(const Duration(milliseconds: 2000));
      fadeAnimController.reverse();
    }
  }
  void _fadeAnimationSetup() {
    fadeAnimController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1200));

    fadeAnimation = CurvedAnimation(parent: fadeAnimController, curve: Curves.easeIn);
  }

  // FLIP-ANIMATION
  void flipAnimPlay({bool replay = false}) async {
    _replay(replay, flipAnimController);
    flipAnimController.forward();
    if (!replay) {
      await Future.delayed(const Duration(milliseconds: 2000));
      flipAnimController.reverse();
    }
  }
  void _flipAnimationSetup() {
    flipAnimController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 1200));

    flipAnimation = Tween<double>(end: 1.0, begin: 0.0).animate(flipAnimController);

    flipAnimation
      .addListener(() {
        // setState(() {});
        flipAnimObs.value = !flipAnimObs.value;
      });
  }

  // RESIZE-ANIMATION
  void resizeAnimPlay({bool replay = false}) async {
    _replay(replay, resizeAnimController);
    resizeAnimController.forward();
    if (!replay) {
      await Future.delayed(const Duration(milliseconds: 2000));
      resizeAnimController.reverse();
    }
  }
  void _resizeAnimationSetup() {
    resizeAnimController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1200));

    resizeAnimation = Tween<Size>(
      begin: Size(100, 100),
      end: Size(120, 120),
    ).animate(
      CurvedAnimation(parent: resizeAnimController, curve: Curves.bounceIn),
    );
  }

  // SIZE-ANIMATION
  void sizeAnimPlay({bool replay = false}) async {
    _replay(replay, sizeAnimController);
    sizeAnimController.forward();
    if (!replay) {
      await Future.delayed(const Duration(milliseconds: 2000));
      sizeAnimController.reverse();
    }
  }
  void _sizeAnimationSetup() {
    sizeAnimController = AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    sizeAnimation = Tween<Size>(begin: Size(25, 25), end: Size(100, 100))
        .animate(CurvedAnimation(parent: sizeAnimController, curve: Curves.ease));

    sizeAnimation
        .addListener(() {
      // setState(() {});
      sizeAnimObs.value = !sizeAnimObs.value;
    });
  }

  // GENERAL-METHODS
  void _replay(bool replay, AnimationController controller) {
    controller.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        controller.repeat(reverse: replay);
      }
    });
  }
}