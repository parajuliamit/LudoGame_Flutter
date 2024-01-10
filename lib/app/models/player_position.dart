import 'package:flutter/material.dart';

class PlayerPosition {
  late final int id;
  late final Color color;
  late int position;
  late final String stringColor;

  PlayerPosition(int id, int position) {
    this.id = id;
    this.position = position;
    if (id < 4) {
      color = Colors.red.shade800;
      stringColor = 'RED';
    } else if (id < 8) {
      color = Colors.green.shade800;
      stringColor = 'GREEN';
    } else if (id < 12) {
      color = Colors.yellow.shade700;
      stringColor = 'YELLOW';
    } else if (id < 16) {
      color = Colors.blue.shade800;
      stringColor = 'BLUE';
    }
  }
}
