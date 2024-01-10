import 'package:get/get.dart';

import '../controllers/choice_screen_controller.dart';

class ChoiceScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChoiceScreenController>(
      () => ChoiceScreenController(),
    );
  }
}
