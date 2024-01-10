import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
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
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
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
              Obx(() => Text(
                    'Select Players (${controller.playerCount.value})',
                    style: const TextStyle(
                        color: Colors.lightGreenAccent,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  )),
              const SizedBox(
                height: 16.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.55,
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
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
                            child: FittedBox(
                              child: Text(
                                player.userPlaying ? player.name : "None",
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
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
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                child: const Text(
                  'Let\'s Play',
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  if (controller.playerCount < 2) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Minimum Players'),
                          contentTextStyle: const TextStyle(
                              fontSize: 16, color: Colors.black),
                          titleTextStyle: const TextStyle(
                              fontSize: 20, color: Colors.black),
                          content: const Text(
                              'Ludo is played with minimum of 2 players.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('OK'),
                            )
                          ],
                        );
                      },
                    );
                    return;
                  }

                  Get.toNamed(Routes.GAME_SCREEN, arguments: {
                    "real": controller.realDice.value,
                    "players": controller.players
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
