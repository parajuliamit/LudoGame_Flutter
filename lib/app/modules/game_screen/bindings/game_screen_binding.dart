import 'package:get/get.dart';

import '../controllers/game_screen_controller.dart';

class GameScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GameScreenController>(
      () => GameScreenController(),
    );
  }
}
