import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../player_data.dart';

class HomeBox extends StatelessWidget {
  const HomeBox(
      {super.key, required this.width, required this.boxID, required this.playerNumber});

  final double width;
  final int boxID;
  final int playerNumber;
  @override
  Widget build(BuildContext context) {
    int playerID = boxID * (-1) - 1;
    return CircleAvatar(
        radius: width / 23,
        backgroundColor: Colors.white,
        child: Get.find<PlayerData>().players[playerID].position == boxID &&
                Get.find<PlayerData>().playing[playerNumber]
            ? GestureDetector(
                onTap: () {
                  Get.find<PlayerData>().start(playerID);
                },
                child: Container(
                  padding: const EdgeInsets.all(1.0),
                  width: width / 16,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Get.find<PlayerData>()
                              .players[playerID]
                              .color
                              .withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: const Offset(0, 2),
                        ),
                      ],
                      shape: BoxShape.circle,
                      color: Get.find<PlayerData>().players[playerID].color,
                      border: Border.all(width: 0.5, color: Colors.black)),
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Get.find<PlayerData>().players[playerID].color,
                        border: Border.all(
                            width: 2, color: Colors.grey.withOpacity(0.5))),
                  ),
                ),
              )
            : null);
  }
}
