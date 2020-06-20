import 'package:flutter/material.dart';
import 'player.dart';
import 'package:provider/provider.dart';
import 'package:interactiveapp/player_data.dart';

class Tile extends StatelessWidget {
  final int id;
  Tile(this.id);
  @override
  Widget build(BuildContext context) {
    Color tileColor = Colors.white;
    FittedBox tileIcon;

    if (id > 51) {
      if (id >= 52 && id <= 56) {
        tileColor = Colors.red[300];
      } else if (id >= 57 && id <= 61) {
        tileColor = Colors.green[300];
      } else if (id >= 62 && id <= 66) {
        tileColor = Color(0xeeeeee11);
      } else if (id >= 67 && id <= 71) {
        tileColor = Colors.blue[300];
      }
    } else if (id % 13 == 0) {
      switch (id) {
        case 0:
          tileColor = Colors.red[300];
          break;
        case 13:
          tileColor = Colors.green[300];
          break;
        case 26:
          tileColor = Color(0xeeeeee11);
          break;
        case 39:
          tileColor = Colors.blue[300];
          break;
      }
      tileIcon = FittedBox(
        fit: BoxFit.contain,
        child: Icon(
          Icons.radio_button_checked,
          color: Colors.white,
        ),
      );
    } else if (id % 13 == 8) {
      tileIcon = FittedBox(
        fit: BoxFit.contain,
        child: Icon(
          Icons.stars,
          color: Colors.teal,
        ),
      );
    }

    return Expanded(
      child: Consumer<PlayerData>(builder: (context, playerData, child) {
        Player player = playerData.inTile(id);
        return Container(
          padding: EdgeInsets.all(3.0),
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(width: 0.5, color: Colors.black),
            color: tileColor,
          ),
          child: player != null
              ? GestureDetector(
                  onTap: () {
                    if (playerData.players[playerData.playerNumber].color ==
                        playerData.players[player.id].color) {
                      playerData.movePlayer(player.id);
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(1.0),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: player.color.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 2),
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
