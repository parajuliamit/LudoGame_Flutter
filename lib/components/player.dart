import 'package:flutter/material.dart';

class Player {
  int id;
  Color color;
  int position;
  String stringColor;

  Player(int id, int position) {
    this.id = id;
    this.position = position;
    if (id < 4) {
      this.color = Colors.red[800];
      this.stringColor = 'RED';
    } else if (id < 8) {
      color = Colors.green[800];
      this.stringColor = 'GREEN';
    } else if (id < 12) {
      color = Colors.yellow[700];
      this.stringColor = 'YELLOW';
    } else if (id < 16) {
      color = Colors.blue[800];
      this.stringColor = 'BLUE';
    }
  }
}
