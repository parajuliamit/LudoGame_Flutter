import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/choice_screen_controller.dart';

class ChoiceScreenView extends GetView<ChoiceScreenController> {
  const ChoiceScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Image.asset("images/logo_transparent.png",
                  height: MediaQuery.of(context).size.height * 0.12),
              const SizedBox(
                height: 16.0,
              ),
              const FittedBox(
                child: Text(
                  "Let's Play Ludo",
                  style: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                      fontSize: 32),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 32.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Flexible(
                    child: Text(
                      'Choose Dice Type:',
                      style: TextStyle(
                          color: Colors.lightGreenAccent,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Obx(() => ToggleButtons(
                      isSelected: [
                        !controller.realDice.value,
                        controller.realDice.value,
                      ],
                      onPressed: (index) {
                        controller.toggleRealDice(index == 1);
                      },
                      selectedBorderColor: Colors.lightGreenAccent,
                      selectedColor: Colors.lightGreenAccent,
                      fillColor: Colors.white.withOpacity(0.2),
                      color: Colors.white.withOpacity(0.6),
                      borderColor: Colors.white.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(8.0),
                      borderWidth: 2.0,
                      children: [
                        Container(
                          width: 60,
                          padding: const EdgeInsets.symmetric(vertical: 6.0),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.computer),
                              Text(
                                'Virtual',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 60,
                          padding: const EdgeInsets.symmetric(vertical: 6.0),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.casino),
                              Text(
                                'Real',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ])),
                ],
              ),
              const SizedBox(
                height: 32.0,
              ),
              const Text(
                'Select Players:',
                style: TextStyle(
                    color: Colors.lightGreenAccent,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  physics: const NeverScrollableScrollPhysics(),
                  children: List.generate(4, (index) {
                    return GetBuilder<ChoiceScreenController>(
                        id: "player$index",
                        builder: (controller) {
                          final player = controller.players[index];
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: player.color,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0)),
                            ),
                            onPressed: () {
                              controller.togglePlayer(index);
                            },
                            child: Text(
                              player.userPlaying ? player.name : "None",
                              style: const TextStyle(color: Colors.white),
                            ),
                          );
                        });
                  }),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xfffc8c03),
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: const Text(
                  'Let\'s Play',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                onPressed: () {
                  if (controller.playerCount < 2) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                            title: Text(
                                'Ludo is played with minimum of 2 players.'));
                      },
                    );
                    return;
                  }
                  // if (players < 4) {
                  //   for (int i = 0; i < 4; i++) {
                  //     if (!buttonState[i]) {
                  //       // Get.find<PlayerData>().winners.add(i * 4);
                  //     }
                  //   }
                  //   if (!buttonState[0]) {
                  //     // Get.find<PlayerData>().nextPlayer();
                  //   }
                  // }
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(builder: (context) {
                  //     return real ? const RealDice() : const VirtualDice();
                  //   }),
                  // );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
