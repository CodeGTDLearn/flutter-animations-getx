import 'package:get/state_manager.dart';

class Controller {
  var counterObs1 = 50.0.obs;
  var counterObs2 = 50.0.obs;

  void applyAnimation() {
    counterObs1.value = counterObs1.value * 1.25;
  }

}