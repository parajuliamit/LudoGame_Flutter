import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../player_data.dart';
import 'player.dart';

class Tile extends StatelessWidget {
  final int id;
  const Tile(this.id, {super.key});
  @override
  Widget build(BuildContext context) {
    Color tileColor = Colors.white;
    FittedBox? tileIcon;

    if (id > 51) {
      if (id >= 52 && id <= 56) {
        tileColor = Colors.red.shade300;
      } else if (id >= 57 && id <= 61) {
        tileColor = Colors.green.shade300;
      } else if (id >= 62 && id <= 66) {
        tileColor = const Color(0xeeeeee11);
      } else if (id >= 67 && id <= 71) {
        tileColor = Colors.blue.shade300;
      }
    } else if (id % 13 == 0) {
      switch (id) {
        case 0:
          tileColor = Colors.red.shade300;
          break;
        case 13:
          tileColor = Colors.green.shade300;
          break;
        case 26:
          tileColor = const Color(0xeeeeee11);
          break;
        case 39:
          tileColor = Colors.blue.shade300;
          break;
      }
      tileIcon = const FittedBox(
        fit: BoxFit.contain,
        child: Icon(
          Icons.radio_button_checked,
          color: Colors.white,
        ),
      );
    } else if (id % 13 == 8) {
      tileIcon = const FittedBox(
        fit: BoxFit.contain,
        child: Icon(
          Icons.stars,
          color: Colors.teal,
        ),
      );
    }

    return Expanded(
      child: GetBuilder<PlayerData>(builder: (controller) {
        Player? player = controller.inTile(id);
        return Container(
          padding: const EdgeInsets.all(3.0),
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(width: 0.5, color: Colors.black),
            color: tileColor,
          ),
          child: player != null
              ? GestureDetector(
                  onTap: () {
                    if (controller.players[controller.playerNumber].color ==
                        controller.players[player.id].color) {
                      controller.movePlayer(player.id);
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(1.0),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: player.color.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(0, 2),
                          ),
                        ],
                        shape: BoxShape.circle,
                        color: player.color,
                        border: Border.all(width: 0.5, color: Colors.black)),
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: player.color,
                          border: Border.all(
                              width: 2, color: Colors.grey.withOpacity(0.5))),
                    ),
                  ),
                )
              : tileIcon,
        );
      }),
    );
  }
}
