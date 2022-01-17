import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class ControllerGetx extends GetxController {
  var animPositionTopObs = 0.0.obs;
  var animPositionLeftObs = 0.0.obs;
  var animContainerTransformationObs = false.obs;
  var animatedCrossfadeObs = false.obs;
  var animatedOpacityObs = 1.0.obs;
  var animContainerHeightObs = 70.0.obs;

  var animatedContainerShadowObs = 1.0.obs;
  var animatedContainerColorObs = Colors.red.obs;
  var animatedContainerTextObs = "offline".obs;
  var animContainerHeightTextObs = 20.0.obs;
  var animContainerScaleObs = false.obs;

  var physicalModelElevationObs = 0.75.obs;
  var physicalModelTextObs = "offline".obs;
  var physicalModelColorObs = Colors.red.obs;

  var neum_depth = 0.0.obs;
  var neum_width = 60.0.obs;
  var neum_height = 60.0.obs;
  var neum_isActive = false.obs;

  @override
  void onInit() {
    physicalModelElevationObs = 10.0.obs;
    physicalModelTextObs = "offline".obs;
    physicalModelColorObs = Colors.red.obs;

    neum_width.value = 60.0;
    neum_height.value = 60.0;
    neum_isActive.value = false;
    super.onInit();
  }

  void triggerAnimContainerHeightAnimation() {
    animContainerHeightObs.value = animContainerHeightObs.value == 70.0 ? 50.0 : 70.0;
  }

  Future<void> triggerAnimContainerShadow() {
    animatedContainerShadowObs.value =
        animatedContainerShadowObs.value == 0.0 ? 10.0 : 0.0;

    // animContainerHeightTextObs.value =
    // animContainerHeightTextObs.value == 20.0 ? 10.0 : 20.0;

    animatedContainerTextObs.value =
    animatedContainerTextObs.value == "offline" ? "online" : "offline";

    animatedContainerColorObs.value =
    animatedContainerColorObs.value == Colors.red ? Colors.green : Colors.red;

    animContainerScaleObs.value = !animContainerScaleObs.value;

    return Future.delayed(const Duration(milliseconds: 1000));
  }

  Future<void> triggerPhysicalModelAnimations() {
    physicalModelElevationObs.value =
        physicalModelElevationObs.value == 10.0 ? 0.0 : 10.0;

    physicalModelTextObs.value =
    physicalModelTextObs.value == "offline" ? "online" : "offline";

    physicalModelColorObs.value =
    physicalModelColorObs.value == Colors.red ? Colors.green : Colors.red;

    return Future.delayed(const Duration(milliseconds: 1000));
  }

  void triggerAnimContainerTransformationAnimation() {
    animContainerTransformationObs.value = !animContainerTransformationObs.value;
  }

  void triggerCrossfadeAnimation() {
    animatedCrossfadeObs.value = !animatedCrossfadeObs.value;
  }

  void triggerOpacityAnimation() {
    animatedOpacityObs.value = animatedOpacityObs.value == 1.0 ? 0.3 : 1.0;
  }

  void triggerPositionAnimation() {
    animPositionTopObs.value = animPositionTopObs.value == 0.0 ? -150.0 : 0.0;
    animPositionLeftObs.value = animPositionLeftObs.value == 0.0 ? 50.0 : 0.0;
  }
}