import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../player_data.dart';
import 'real_dice.dart';
import 'virtual_dice.dart';

class ChoiceScreen extends StatefulWidget {
  const ChoiceScreen({super.key});

  @override
  _ChoiceScreenState createState() => _ChoiceScreenState();
}

class _ChoiceScreenState extends State<ChoiceScreen> {
  int players = 4;
  List<bool> buttonState = [true, true, true, true];
  List<String> initialText = ['Red', 'Green', 'Yellow', 'Blue'];
  List<String> buttonText = ['Red', 'Green', 'Yellow', 'Blue'];
  bool real = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'CHOOSE DICE TYPE:',
              style: TextStyle(
                  color: Colors.greenAccent, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10.0,
            ),
            SwitchListTile(
              value: real,
              title: real
                  ? const Text(
                      'Real Dice',
                      style: TextStyle(
                          color: Colors.greenAccent,
                          fontWeight: FontWeight.bold),
                    )
                  : const Text(
                      'Virtual Dice',
                      style: TextStyle(
                          color: Colors.greenAccent,
                          fontWeight: FontWeight.bold),
                    ),
              activeColor: Colors.green[900],
              inactiveTrackColor: Colors.blueGrey[800],
              // iconOn: Icons.account_circle,
              // iconOff: Icons.computer,
              // textSize: 18.0,
              onChanged: (bool state) {
                real = state;
                setState(() {});
              },
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              'SELECT PLAYERS:',
              style: TextStyle(
                  color: Colors.greenAccent, fontWeight: FontWeight.bold),
            ),
            Container(
              width: 200,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 2, color: Colors.grey.withOpacity(0.5))),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      playerSelectionButton(Colors.red.shade800, 0),
                      const SizedBox(
                        width: 10.0,
                      ),
                      playerSelectionButton(Colors.green.shade800, 1)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      playerSelectionButton(Colors.blue.shade800, 3),
                      const SizedBox(
                        width: 10.0,
                      ),
                      playerSelectionButton(Colors.yellow.shade700, 2)
                    ],
                  )
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xfffc8c03),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  textStyle: const TextStyle(fontSize: 20)),
              child: const SizedBox(
                  width: 100,
                  child: Text(
                    'Let\'s Play',
                    textAlign: TextAlign.center,
                  )),
              onPressed: () {
                if (players < 2) {
                  Get.dialog(const AlertDialog(
                      title:
                          Text('Ludo is played with minimum of 2 players.')));
                  return;
                }
                if (players < 4) {
                  for (int i = 0; i < 4; i++) {
                    if (!buttonState[i]) {
                      Get.find<PlayerData>().winners.add(i * 4);
                    }
                  }
                  if (!buttonState[0]) {
                    Get.find<PlayerData>().nextPlayer();
                  }
                }
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return real ? const RealDice() : const VirtualDice();
                  }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton playerSelectionButton(Color color, int i) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
      ),
      onPressed: () {
        setState(() {
          if (buttonState[i]) {
            buttonText[i] = 'None';
            players--;
          } else {
            buttonText[i] = initialText[i];
            players++;
          }
          buttonState[i] = !buttonState[i];
        });
        if (buttonState[i]) {
          Get.find<PlayerData>().playing[i] = true;
          Get.find<PlayerData>().numberOfPlayers++;
        } else {
          Get.find<PlayerData>().playing[i] = false;
          Get.find<PlayerData>().numberOfPlayers--;
        }
      },
      child: Text(
        buttonText[i],
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
