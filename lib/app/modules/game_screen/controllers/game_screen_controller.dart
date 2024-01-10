import 'package:get/get.dart';

import '../../../../components/winner_page_tile.dart';
import '../../../models/player.dart';
import '../../../models/player_position.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'dart:async';

class GameScreenController extends GetxController {
  final assetsAudioPlayer = AssetsAudioPlayer();
  int currentRoll = 0;
  List<PlayerPosition> players = [];
  late int playerNumber;
  int diceValue = 0;
  late Color boxColor;
  bool killed = false;
  bool movedPlayer = true;

  List<int> winners = [];

  List<bool> playing = [true, true, true, true];
  int numberOfPlayers = 4;

  final realDice = false.obs;

  void toggleRealDice(bool value) {
    realDice.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    for (int i = 0; i < 16; i++) {
      players.add(PlayerPosition(i, i * (-1) - 1));
    }
    boxColor = Colors.red.shade800;
    playerNumber = 0;
    realDice(Get.arguments['real']);
    List<Player> playersArg = Get.arguments['players'];
    if (playersArg.where((player) => player.userPlaying).length < 4) {
      for (int i = 0; i < 4; i++) {
        if (!playersArg[i].userPlaying) {
          winners.add(i * 4);
        }
      }
      if (!playersArg[0].userPlaying) {
        nextPlayer();
      }
    }
  }

  void movePlayer(int playerID) {
    if (movedPlayer) {
      nextPlayer();
      return;
    }

    movedPlayer = true;
    currentRoll = 0;
    assetsAudioPlayer.open(
      Audio("assets/move.mp3"),
    );

    int position = players[playerID].position;
    int initialPosition = position;
    if ((position + diceValue > 51) && (position <= 51) && playerID > 3) {
      position += diceValue;
      position %= 52;
    } else {
      position += diceValue;
    }
    if (playerID < 4) {
      if (position > 50 && initialPosition < 51) {
        position++;
      }
      if (position == 57) {
        position = 72;
      } else if (position > 57) {
        movedPlayer = false;
        return;
      }
    } else if (playerID < 8) {
      if (position > 11 && initialPosition < 12) {
        position = 57 + position - 12;
      }
      if (position == 62) {
        position = 72;
      } else if (position > 62) {
        movedPlayer = false;
        return;
      }
    } else if (playerID < 12) {
      if (position > 24 && initialPosition < 25) {
        position = 62 + position - 25;
      }
      if (position == 67) {
        position = 72;
      } else if (position > 67) {
        movedPlayer = false;
        return;
      }
    } else if (playerID < 16) {
      if (position > 37 && initialPosition < 38) {
        position = 67 + position - 38;
      }
      if (position > 72) {
        movedPlayer = false;
        return;
      }
    }
    players[playerID].position = position;
    if (position == 72) {
      int count = 0;
      for (var player in players) {
        if (players[player.id].color == players[playerID].color) {
          if (player.position == 72) {
            count++;
          }
        }
      }
      if (count == 4) {
        winners.add(playerNumber);
        diceValue = 2;
        if (winners.length + numberOfPlayers == 5) {
          assetsAudioPlayer.open(
            Audio("assets/winner.mp3"),
          );
        } else {
          assetsAudioPlayer.open(
            Audio("assets/GameSound/${Random().nextInt(2) + 1}.mp3"),
          );
        }
        if (winners.length == 3) {
          diceValue = 2;
          nextPlayer();
          winners.add(playerNumber);
          winner();
          return;
        }
        Get.dialog(AlertDialog(
          titleTextStyle: TextStyle(
            color: boxColor,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 2,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          title: Text(winners.length + numberOfPlayers == 5
              ? "${players[playerNumber].stringColor} WON THE GAME."
              : "${players[playerNumber].stringColor} ALSO COMPLETED THE GAME."),
          content: const Text("Do you want to continue playing?"),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
                winner();
              },
              child: const Text("NO"),
            ),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("YES"),
            ),
          ],
        ));

        nextPlayer();
      } else {
        assetsAudioPlayer.open(Audio("assets/home.mp3"), volume: 0.25);
      }
    } else if (position % 13 != 0 && position % 13 != 8) {
      for (var player in players) {
        if (players[player.id].color != players[playerID].color) {
          if (player.position == position) {
            player.position = player.id * (-1) - 1;
            assetsAudioPlayer.open(
              Audio("assets/KillSound/${Random().nextInt(5) + 2}.mp3"),
            );
            killed = true;
          }
        }
      }
    }

    update();
    if (position != 72) {
      nextPlayer();
    }
  }

  void start(int playerID) {
    if (diceValue != 1) {
      return;
    }
    if (movedPlayer) {
      return;
    }
    if (playerID < 4) {
      players[playerID].position = 0;
    } else if (playerID < 8) {
      players[playerID].position = 13;
    } else if (playerID < 12) {
      players[playerID].position = 26;
    } else if (playerID < 16) {
      players[playerID].position = 39;
    }
    movedPlayer = true;
    assetsAudioPlayer.open(
      Audio("assets/start.mp3"),
    );
    update();
  }

  PlayerPosition? inTile(int id) {
    if (id % 13 == 0 || id % 13 == 8) {
      for (int i = 0; i < 4; i++) {
        if (players[playerNumber + i].position == id) {
          return players[playerNumber + i];
        }
      }
    }
    for (int i = 0; i < 16; i++) {
      if (players[i].position == id) {
        return players[i];
      }
    }
    return null;
  }

  void dicePressed() {
    int count = 0;
    int single = 0;
    int games = 0;
    for (int i = 0; i < 4; i++) {
      if (players[playerNumber + i].position < 0) {
        count++;
      } else if (players[playerNumber + i].position == 72) {
        count++;
        games++;
      } else {
        single = playerNumber + i;
      }
    }
    if (count == 4) {
      if (diceValue == 1) {
        if (players[playerNumber].position != 72) {
          start(playerNumber);
        } else if (players[playerNumber + 1].position != 72) {
          start(playerNumber + 1);
        } else if (players[playerNumber + 2].position != 72) {
          start(playerNumber + 2);
        } else if (players[playerNumber + 3].position != 72) {
          start(playerNumber + 3);
        }
      } else {
        movedPlayer = true;
        nextPlayer();
      }
    }
    if (count == 3 && diceValue != 1) {
      int initialPosition = players[single].position;
      movePlayer(single);
      if (players[single].position == initialPosition) {
        movedPlayer = true;
        nextPlayer();
      }
    } else if (games == 3) {
      movePlayer(single);
    }
  }

  void rollDice() async {
    if (!movedPlayer) {
      alert();
      return;
    }
    diceValue = 0;
    update();

    assetsAudioPlayer.open(
      Audio("assets/dice.wav"),
    );
    Future.delayed(const Duration(milliseconds: 500), () {
      diceValue = Random().nextInt(6) + 1;
      movedPlayer = false;
      update();
      dicePressed();
    });
  }

  void rollRealDice(int value) {
    if (!movedPlayer) {
      alert();
      return;
    }
    diceValue = value;
    currentRoll = value;
    movedPlayer = false;
    update();
    dicePressed();
  }

  void nextPlayer() {
    void nextNumber() {
      playerNumber += 4;
      playerNumber %= 16;
    }

    if (diceValue != 1 && diceValue != 6 && killed != true) {
      nextNumber();

      for (int winner in winners) {
        if (winner == playerNumber) {
          nextNumber();
        }
      }
      for (int i = winners.length; i > 0; i--) {
        if (winners[i - 1] == playerNumber) {
          nextNumber();
        }
      }
      boxColor = players[playerNumber].color;
      update();
    }
    killed = false;
  }

  void alert() {
    Get.dialog(
      AlertDialog(
        title: const Text("Move a token first"),
        content: const Text("You can't roll the dice without moving a token."),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  void winner() {
    if (numberOfPlayers == 4) {
      if (winners.length == 1) {
        Get.dialog(AlertDialog(
          title: const Text("RESULTS"),
          content: Text(
              "${players[winners[0]].stringColor} WON THE GAME.\nDo you want to continue playing?"),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
                // TODO: Add exit functionality
              },
              child: const Text("NO"),
            ),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("YES"),
            ),
          ],
        ));
      } else if (winners.length == 2) {
        Get.dialog(AlertDialog(
          title: const Text("RESULTS"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              WinnerPageTile(
                text: players[winners[0]].stringColor,
                color: players[winners[0]].color,
                icon: const Icon(
                  Icons.looks_one,
                  size: 40.0,
                  color: Colors.white,
                ),
              ),
              WinnerPageTile(
                text: players[winners[1]].stringColor,
                color: players[winners[1]].color,
                icon: const Icon(
                  Icons.looks_two,
                  size: 30.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
                // TODO: Add exit functionality
              },
              child: const Text("EXIT"),
            ),
          ],
        ));
      } else {
        Get.dialog(AlertDialog(
            title: const Text("RESULTS"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                WinnerPageTile(
                  text: players[winners[0]].stringColor,
                  color: players[winners[0]].color,
                  icon: const Icon(
                    Icons.looks_one,
                    size: 40.0,
                    color: Colors.white,
                  ),
                ),
                WinnerPageTile(
                  text: players[winners[1]].stringColor,
                  color: players[winners[1]].color,
                  icon: const Icon(
                    Icons.looks_two,
                    size: 30.0,
                    color: Colors.white,
                  ),
                ),
                WinnerPageTile(
                  text: players[winners[2]].stringColor,
                  color: players[winners[2]].color,
                  icon: const Icon(
                    Icons.looks_3,
                  ),
                ),
                WinnerPageTile(
                  text: players[winners[3]].stringColor,
                  color: players[winners[3]].color,
                  icon: const Icon(Icons.looks_4),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                  // TODO: Add exit functionality
                },
                child: const Text(
                  "EXIT",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )
            ]));
      }
    } else if (numberOfPlayers == 3) {
      winners.removeAt(0);
      if (winners.length == 1) {
        Get.dialog(AlertDialog(
            title: const Text("RESULTS"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                WinnerPageTile(
                  text: players[winners[0]].stringColor,
                  color: players[winners[0]].color,
                  icon: const Icon(
                    Icons.looks_one,
                    size: 40.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                  // TODO: Add exit functionality
                },
                child: const Text(
                  "EXIT",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )
            ]));
      } else {
        Get.dialog(AlertDialog(
            title: const Text("RESULTS"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                WinnerPageTile(
                  text: players[winners[0]].stringColor,
                  color: players[winners[0]].color,
                  icon: const Icon(
                    Icons.looks_one,
                    size: 40.0,
                    color: Colors.white,
                  ),
                ),
                WinnerPageTile(
                  text: players[winners[1]].stringColor,
                  color: players[winners[1]].color,
                  icon: const Icon(
                    Icons.looks_two,
                    size: 30.0,
                    color: Colors.white,
                  ),
                ),
                WinnerPageTile(
                  text: players[winners[2]].stringColor,
                  color: players[winners[2]].color,
                  icon: const Icon(
                    Icons.looks_two,
                    size: 30.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                  // TODO: Add exit functionality
                },
                child: const Text(
                  "EXIT",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )
            ]));
      }
    } else {
      winners.removeAt(0);
      winners.removeAt(0);
      Get.dialog(AlertDialog(
          title: const Text("RESULTS"),
          content: Column(
            children: [
              WinnerPageTile(
                text: players[winners[0]].stringColor,
                color: players[winners[0]].color,
                icon: const Icon(
                  Icons.looks_one,
                  size: 40.0,
                  color: Colors.white,
                ),
              ),
              WinnerPageTile(
                text: players[winners[1]].stringColor,
                color: players[winners[1]].color,
                icon: const Icon(
                  Icons.looks_two,
                  size: 30.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
                // TODO: Add exit functionality
              },
              child: const Text(
                "EXIT",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ]));
    }
  }
}
