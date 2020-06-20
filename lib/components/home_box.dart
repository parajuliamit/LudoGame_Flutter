import 'package:flutter/material.dart';
import 'package:interactiveapp/player_data.dart';
import 'package:provider/provider.dart';

class HomeBox extends StatelessWidget {
  HomeBox({this.width, this.boxID, @required this.playerNumber});

  final double width;
  final int boxID;
  final int playerNumber;
  @override
  Widget build(BuildContext context) {
    int playerID = boxID * (-1) - 1;
    return CircleAvatar(
        radius: width / 23,
        backgroundColor: Colors.white,
        child: Provider.of<PlayerData>(context).players[playerID].position ==
                    boxID &&
                Provider.of<PlayerData>(context).playing[playerNumber]
            ? GestureDetector(
                onTap: () {
                  Provider.of<PlayerData>(context, listen: false)
                      .start(playerID);
                },
                child: Container(
                  padding: EdgeInsets.all(1.0),
                  width: width / 16,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Provider.of<PlayerData>(context)
                              .players[playerID]
                              .color
                              .withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 2),
                        ),
                      ],
                      shape: BoxShape.circle,
                      color: Provider.of<PlayerData>(context)
                          .players[playerID]
                          .color,
                      border: Border.all(width: 0.5, color: Colors.black)),
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Provider.of<PlayerData>(context)
                            .players[playerID]
                            .color,
                        border: Border.all(
                            width: 2, color: Colors.grey.withOpacity(0.5))),
                  ),
                ),
              )
            : null);
  }
}
