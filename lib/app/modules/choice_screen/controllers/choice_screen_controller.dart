import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/player.dart';

class ChoiceScreenController extends GetxController {
  final List<Player> players = [
    Player('Red', Colors.red.shade800, true),
    Player('Green', Colors.green.shade800, true),
    Player('Blue', Colors.blue.shade800, true),
    Player('Yellow', Colors.yellow.shade700, true),
  ];
  final realDice = false.obs;
  final playerCount = 4.obs;

  void toggleRealDice(bool state) {
    realDice.value = state;
  }

  void togglePlayer(int index) {
    players[index].userPlaying = !players[index].userPlaying;
    update(["player$index"]);
    playerCount.value = players.where((player) => player.userPlaying).length;
  }
}
