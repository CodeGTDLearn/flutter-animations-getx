import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class ControllerGetx1 extends GetxController {
  var animPositionTopObs = 0.0.obs;
  var animPositionLeftObs = 0.0.obs;
  var animatedCrossfadeObs = false.obs;
  var animatedOpacityObs = 1.0.obs;
  var animContainerHeightObs = 70.0.obs;

  var animContainerTransformationObs = false.obs;
  var animatedContainerShadowObs = 1.0.obs;
  var animatedContainerColorObs = Colors.red.obs;
  var animatedContainerTextObs = "offline".obs;
  var animContainerHeightTextObs = 20.0.obs;
  var animContainerScaleObs = false.obs;

  var physicalModelElevationObs = 0.75.obs;
  var physicalModelTextObs = "offline".obs;
  var physicalModelColorObs = Colors.red.obs;

  var glassIsBlueObs = true.obs;

  @override
  void onInit() {
    physicalModelElevationObs = 10.0.obs;
    physicalModelTextObs = "offline".obs;
    physicalModelColorObs = Colors.red.obs;
    super.onInit();
  }

  void playAnimContainerHeightAnim() {
    animContainerHeightObs.value = animContainerHeightObs.value == 70.0 ? 50.0 : 70.0;
  }

  Future<void> playAnimContainerShadowAnim() {
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

  Future<void> playPhysicModelAnim() {
    physicalModelElevationObs.value =
        physicalModelElevationObs.value == 10.0 ? 0.0 : 10.0;

    physicalModelTextObs.value =
        physicalModelTextObs.value == "offline" ? "online" : "offline";

    physicalModelColorObs.value =
        physicalModelColorObs.value == Colors.red ? Colors.green : Colors.red;

    return Future.delayed(const Duration(milliseconds: 1000));
  }

  void playAnimContainerTransfAnim() {
    animContainerTransformationObs.value = !animContainerTransformationObs.value;
  }

  void playCrossfadeAnim() {
    animatedCrossfadeObs.value = !animatedCrossfadeObs.value;
  }

  void playOpacityAnim() {
    animatedOpacityObs.value = animatedOpacityObs.value == 1.0 ? 0.3 : 1.0;
  }

  void playPositionAnim() {
    animPositionTopObs.value = animPositionTopObs.value == 0.0 ? -150.0 : 0.0;
    animPositionLeftObs.value = animPositionLeftObs.value == 0.0 ? 50.0 : 0.0;
  }

  void playGlassAnim({required bool fullCycle}) async {
    glassIsBlueObs.value = !glassIsBlueObs.value;
    if (fullCycle){
      await Future.delayed(Duration(milliseconds: 500));
      glassIsBlueObs.value = !glassIsBlueObs.value;
    }
  }

}