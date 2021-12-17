import 'package:get/state_manager.dart';

class Controller {
  var animatedContainerObs = 70.0.obs;

  void applyAnimatedContainerAnimation() {
    animatedContainerObs.value = animatedContainerObs.value == 70.0 ? 50.0 : 70.0;
  }
}