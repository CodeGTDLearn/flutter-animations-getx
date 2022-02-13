import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class ControllerNeumorphic extends GetxController with GetSingleTickerProviderStateMixin {
  // SCALE-ADJUSTMENTS
  late AnimationController _scaleControllerIcon;
  late Animation<double> scaleAnimationIcon;
  var _end = 0.97;
  var _begin = 1.0;

  // NEUPHORMIC-LIGHT
  var neumorpLightIsElevatedObs = true.obs;

  // NEUPHORMIC-DARK
  var neumorpDarkIsElevatedObs = true.obs;

  // NEUPHORMIC-COLOR
  var neumorpColorIsElevatedObs = true.obs;

  // NEUPHORMIC-PACKAGE
  var neumorpContDepthObs = 0.0.obs;
  var neumorpContWidthObs = 60.0.obs;
  var neumorpContHeightObs = 60.0.obs;
  var neumorpContIsActiveObs = false.obs;

  @override
  void onInit() {
    super.onInit();
    _scaleAnimationIconSetup();

    neumorpContWidthObs.value = 60.0;
    neumorpContHeightObs.value = 60.0;
    neumorpContIsActiveObs.value = false;
  }

  @override
  void dispose() {
    super.dispose();
    _scaleControllerIcon.dispose();
  }

  void playLightNeumorphicAnim({required bool fullCycle}) async {
    playScaleAnim(forward: true);
    neumorpLightIsElevatedObs.value = !neumorpLightIsElevatedObs.value;
    if (fullCycle) {
      await Future.delayed(Duration(milliseconds: 500));
      playScaleAnim(forward: false);
      neumorpLightIsElevatedObs.value = !neumorpLightIsElevatedObs.value;
    }
  }

  void playDarkNeumorphicAnim({required bool fullCycle}) async {
    playScaleAnim(forward: true);
    neumorpDarkIsElevatedObs.value = !neumorpDarkIsElevatedObs.value;
    if (fullCycle) {
      await Future.delayed(Duration(milliseconds: 500));
      playScaleAnim(forward: false);
      neumorpDarkIsElevatedObs.value = !neumorpDarkIsElevatedObs.value;
    }
  }

  void playColorNeumorphicAnim({required bool fullCycle}) async {
    playScaleAnim(forward: true);
    neumorpColorIsElevatedObs.value = !neumorpColorIsElevatedObs.value;
    if (fullCycle) {
      await Future.delayed(Duration(milliseconds: 500));
      playScaleAnim(forward: false);
      neumorpColorIsElevatedObs.value = !neumorpColorIsElevatedObs.value;
    }
  }

  void playScaleAnim({required bool forward}) async {
    if (forward) await _scaleControllerIcon.forward();
    if (!forward) await _scaleControllerIcon.reverse();
  }

  void _scaleAnimationIconSetup() {
    _scaleControllerIcon = AnimationController(
      duration: const Duration(milliseconds: 225),
      vsync: this,
      value: 1.0,
    );

    // scaleAnimation = CurvedAnimation(parent: _scaleController, curve: Curves.bounceInOut);
    scaleAnimationIcon = Tween(
      begin: _begin,
      end: _end,
    ).animate(CurvedAnimation(parent: _scaleControllerIcon, curve: Curves.easeIn));
  }
}