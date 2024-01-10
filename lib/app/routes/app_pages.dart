import 'package:get/get.dart';

import '../modules/choice_screen/bindings/choice_screen_binding.dart';
import '../modules/choice_screen/views/choice_screen_view.dart';
import '../modules/game_screen/bindings/game_screen_binding.dart';
import '../modules/game_screen/views/game_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.CHOICE_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.CHOICE_SCREEN,
      page: () => const ChoiceScreenView(),
      binding: ChoiceScreenBinding(),
    ),
    GetPage(
      name: _Paths.GAME_SCREEN,
      page: () => const GameScreenView(),
      binding: GameScreenBinding(),
    ),
  ];
}
