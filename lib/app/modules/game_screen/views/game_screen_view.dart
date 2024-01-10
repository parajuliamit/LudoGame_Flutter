import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/dice_image.dart';
import '../../../../components/home_box.dart';
import '../../../../components/tile.dart';
import '../../../routes/app_pages.dart';
import '../controllers/game_screen_controller.dart';

class GameScreenView extends GetView<GameScreenController> {
  const GameScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    double widthContext = MediaQuery.of(context).size.width;
    double heightContext = MediaQuery.of(context).size.height;
    double widthVirtual = min(widthContext, heightContext);
    double heightVirtual = widthVirtual;
    double height, width;
    if (heightContext / widthContext > (17 / 15)) {
      height = (17 / 15) * widthContext;
      width = widthContext;
    } else {
      height = heightContext;
      width = (15 / 17) * height;
    }
    return Scaffold(
      backgroundColor: const Color(0xFF222222),
      body: Stack(
        children: [
          Center(
            child: Obx(
              () => Container(
                height: controller.realDice.value ? height : heightVirtual,
                width: controller.realDice.value ? width : widthVirtual,
                color: Colors.white,
                child: GetBuilder<GameScreenController>(builder: (controller) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                          flex: 15,
                          child: Column(
                            children: [
                              Expanded(
                                  flex: 6,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 6,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 0.5,
                                                color: Colors.black),
                                            color: Colors.red,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  HomeBox(
                                                    width: width,
                                                    boxID: -1,
                                                    playerNumber: 0,
                                                  ),
                                                  HomeBox(
                                                    width: width,
                                                    boxID: -2,
                                                    playerNumber: 0,
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  HomeBox(
                                                    width: width,
                                                    boxID: -3,
                                                    playerNumber: 0,
                                                  ),
                                                  HomeBox(
                                                    width: width,
                                                    boxID: -4,
                                                    playerNumber: 0,
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ), //Red Box
                                      const Expanded(
                                        flex: 3,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  Tile(10),
                                                  Tile(9),
                                                  Tile(8),
                                                  Tile(7),
                                                  Tile(6),
                                                  Tile(5),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  Tile(11),
                                                  Tile(57),
                                                  Tile(58),
                                                  Tile(59),
                                                  Tile(60),
                                                  Tile(61),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  Tile(12),
                                                  Tile(13),
                                                  Tile(14),
                                                  Tile(15),
                                                  Tile(16),
                                                  Tile(17),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 6,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 0.5,
                                                color: Colors.black),
                                            color: Colors.green,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  HomeBox(
                                                    width: width,
                                                    boxID: -5,
                                                    playerNumber: 1,
                                                  ),
                                                  HomeBox(
                                                    width: width,
                                                    boxID: -6,
                                                    playerNumber: 1,
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  HomeBox(
                                                    width: width,
                                                    boxID: -7,
                                                    playerNumber: 1,
                                                  ),
                                                  HomeBox(
                                                    width: width,
                                                    boxID: -8,
                                                    playerNumber: 1,
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ) //Green Box
                                    ],
                                  )),
                              Expanded(
                                  flex: 3,
                                  child: Row(
                                    children: [
                                      const Expanded(
                                        flex: 6,
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  Tile(51),
                                                  Tile(0),
                                                  Tile(1),
                                                  Tile(2),
                                                  Tile(3),
                                                  Tile(4),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  Tile(50),
                                                  Tile(52),
                                                  Tile(53),
                                                  Tile(54),
                                                  Tile(55),
                                                  Tile(56),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  Tile(49),
                                                  Tile(48),
                                                  Tile(47),
                                                  Tile(46),
                                                  Tile(45),
                                                  Tile(44),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      controller.realDice.value
                                          ? Expanded(
                                              flex: 3,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: width / 20,
                                                    height: height / 25,
                                                    decoration: BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: controller
                                                                .boxColor
                                                                .withOpacity(
                                                                    0.5),
                                                            spreadRadius: 1,
                                                            blurRadius: 2,
                                                            offset:
                                                                const Offset(
                                                                    0, 2),
                                                          ),
                                                        ],
                                                        color:
                                                            controller.boxColor,
                                                        border: Border.all(
                                                            width: 0.5,
                                                            color:
                                                                Colors.black)),
                                                  ),
                                                  Text(
                                                    ' Turn',
                                                    style: TextStyle(
                                                        shadows: [
                                                          Shadow(
                                                            color: controller
                                                                .boxColor
                                                                .withOpacity(
                                                                    0.5),
                                                            blurRadius: 2,
                                                            offset:
                                                                const Offset(
                                                                    0, 2),
                                                          )
                                                        ],
                                                        color:
                                                            controller.boxColor,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ) //Player Turn
                                          : Expanded(
                                              flex: 3,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(3.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    color: controller.boxColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: controller
                                                            .boxColor
                                                            .withOpacity(0.5),
                                                        spreadRadius: 1,
                                                        blurRadius: 2,
                                                        offset:
                                                            const Offset(2, 2),
                                                      ),
                                                    ],
                                                  ),
                                                  padding:
                                                      const EdgeInsets.all(6.0),
                                                  child: GestureDetector(
                                                      onTap: () {
                                                        controller.rollDice();
                                                      },
                                                      child: Image.asset(
                                                          'images/dice${controller.diceValue}.png')),
                                                ),
                                              ),
                                            ), //Home Box
                                      const Expanded(
                                        flex: 6,
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  Tile(18),
                                                  Tile(19),
                                                  Tile(20),
                                                  Tile(21),
                                                  Tile(22),
                                                  Tile(23),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  Tile(66),
                                                  Tile(65),
                                                  Tile(64),
                                                  Tile(63),
                                                  Tile(62),
                                                  Tile(24),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  Tile(30),
                                                  Tile(29),
                                                  Tile(28),
                                                  Tile(27),
                                                  Tile(26),
                                                  Tile(25),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  )),
                              Expanded(
                                  flex: 6,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 6,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 0.5,
                                                color: Colors.black),
                                            color: Colors.blue,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  HomeBox(
                                                    width: width,
                                                    boxID: -13,
                                                    playerNumber: 3,
                                                  ),
                                                  HomeBox(
                                                    width: width,
                                                    boxID: -14,
                                                    playerNumber: 3,
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  HomeBox(
                                                    width: width,
                                                    boxID: -15,
                                                    playerNumber: 3,
                                                  ),
                                                  HomeBox(
                                                    width: width,
                                                    boxID: -16,
                                                    playerNumber: 3,
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ), //Blue Box
                                      const Expanded(
                                        flex: 3,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  Tile(43),
                                                  Tile(42),
                                                  Tile(41),
                                                  Tile(40),
                                                  Tile(39),
                                                  Tile(38),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  Tile(71),
                                                  Tile(70),
                                                  Tile(69),
                                                  Tile(68),
                                                  Tile(67),
                                                  Tile(37),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  Tile(31),
                                                  Tile(32),
                                                  Tile(33),
                                                  Tile(34),
                                                  Tile(35),
                                                  Tile(36),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 6,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 0.5,
                                                color: Colors.black),
                                            color: const Color(0xffdddd11),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  HomeBox(
                                                    width: width,
                                                    boxID: -9,
                                                    playerNumber: 2,
                                                  ),
                                                  HomeBox(
                                                    width: width,
                                                    boxID: -10,
                                                    playerNumber: 2,
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  HomeBox(
                                                    width: width,
                                                    boxID: -11,
                                                    playerNumber: 2,
                                                  ),
                                                  HomeBox(
                                                    width: width,
                                                    boxID: -12,
                                                    playerNumber: 2,
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ) //Yellow Box
                                    ],
                                  )),
                            ],
                          )),
                      if (controller.realDice.value)
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: const EdgeInsets.all(2.0),
                            color: const Color(0xFF222222),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                DiceImage(
                                  image: Image.asset('images/dice1.png'),
                                  onPress: () {
                                    controller.rollRealDice(1);
                                  },
                                  width: width,
                                  color: controller.currentRoll == 1 &&
                                          !controller.movedPlayer
                                      ? Colors.white70
                                      : controller.boxColor,
                                ),
                                DiceImage(
                                  image: Image.asset('images/dice2.png'),
                                  onPress: () {
                                    controller.rollRealDice(2);
                                  },
                                  width: width,
                                  color: controller.currentRoll == 2 &&
                                          !controller.movedPlayer
                                      ? Colors.white70
                                      : controller.boxColor,
                                ),
                                DiceImage(
                                  image: Image.asset('images/dice3.png'),
                                  onPress: () {
                                    controller.rollRealDice(3);
                                  },
                                  width: width,
                                  color: controller.currentRoll == 3 &&
                                          !controller.movedPlayer
                                      ? Colors.white70
                                      : controller.boxColor,
                                ),
                                DiceImage(
                                  image: Image.asset('images/dice4.png'),
                                  onPress: () {
                                    controller.rollRealDice(4);
                                  },
                                  width: width,
                                  color: controller.currentRoll == 4 &&
                                          !controller.movedPlayer
                                      ? Colors.white70
                                      : controller.boxColor,
                                ),
                                DiceImage(
                                  image: Image.asset('images/dice5.png'),
                                  onPress: () {
                                    controller.rollRealDice(5);
                                  },
                                  width: width,
                                  color: controller.currentRoll == 5 &&
                                          !controller.movedPlayer
                                      ? Colors.white70
                                      : controller.boxColor,
                                ),
                                DiceImage(
                                  image: Image.asset('images/dice6.png'),
                                  onPress: () {
                                    controller.rollRealDice(6);
                                  },
                                  width: width,
                                  color: controller.currentRoll == 6 &&
                                          !controller.movedPlayer
                                      ? Colors.white70
                                      : controller.boxColor,
                                ),
                              ],
                            ),
                          ),
                        ) //Dice Images
                    ],
                  );
                }),
              ),
            ),
          ),
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                  shape: const CircleBorder(),
                  mini: true,
                  backgroundColor: const Color(0xffebc634),
                  onPressed: () => showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: const Text("Exit Game"),
                            content:
                                const Text('Do you want to exit the game?'),
                            actions: [
                              TextButton(
                                child: const Text(
                                  "Exit",
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                  Get.until((route) =>
                                      Get.currentRoute == Routes.CHOICE_SCREEN);
                                },
                              ),
                              TextButton(
                                child: const Text(
                                  "Cancel",
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          )),
                  child: const Icon(Icons.arrow_back),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text(
                        'Dice Mode:',
                        style: TextStyle(
                            color: Colors.white70, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 8,
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
                          children: const [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.computer,
                                  size: 20,
                                ),
                                Text(
                                  'Virtual',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.casino,
                                  size: 20,
                                ),
                                Text(
                                  'Real',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ])),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
