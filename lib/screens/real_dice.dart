import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:interactiveapp/components/dice_image.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../components/tile.dart';
import '../player_data.dart';
import 'package:provider/provider.dart';
import '../components/home_box.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'virtual_dice.dart';

class RealDice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double widthContext = MediaQuery.of(context).size.width;
    double heightContext = MediaQuery.of(context).size.height;
    double width;
    double height;
    if (heightContext / widthContext > (17 / 15)) {
      height = (17 / 15) * widthContext;
      width = widthContext;
    } else {
      height = heightContext;
      width = (15 / 17) * height;
    }
    return Scaffold(
      backgroundColor: Color(0xFF222222),
      body: Stack(
        children: [
          Center(
            child: Container(
              height: height,
              width: width,
              color: Colors.white,
              child:
                  Consumer<PlayerData>(builder: (context, playerData, child) {
                playerData.context = context;
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
                                              width: 0.5, color: Colors.black),
                                          color: Colors.red,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
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
                                                  MainAxisAlignment.spaceEvenly,
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
                                    Expanded(
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
                                              width: 0.5, color: Colors.black),
                                          color: Colors.green,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
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
                                                  MainAxisAlignment.spaceEvenly,
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
                                    Expanded(
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
                                    Expanded(
                                      flex: 3,
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: playerData.boxColor,
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          padding: EdgeInsets.all(6.0),
                                          width: double.infinity,
                                          height: double.infinity,
                                          alignment: Alignment.center,
                                          child: Image.asset('images/ludo.png')
//                                          Column(
//                                            mainAxisAlignment:
//                                                MainAxisAlignment.center,
//                                            children: [
////                                              Row(
////                                                  mainAxisAlignment:
////                                                      MainAxisAlignment.center,
////                                                  children: [
////                                                    Container(
////                                                      width: width / 20,
////                                                      height: height / 25,
////                                                      decoration: BoxDecoration(
////                                                          boxShadow: [
////                                                            BoxShadow(
////                                                              color: playerData
////                                                                  .boxColor
////                                                                  .withOpacity(
////                                                                      0.5),
////                                                              spreadRadius: 1,
////                                                              blurRadius: 2,
////                                                              offset:
////                                                                  Offset(0, 2),
////                                                            ),
////                                                          ],
////                                                          color: playerData
////                                                              .boxColor,
////                                                          border: Border.all(
////                                                              width: 0.5,
////                                                              color: Colors
////                                                                  .black)),
////                                                    ),
////                                                    Text(
////                                                      ' Turn',
////                                                      style: TextStyle(
////                                                          shadows: [
////                                                            Shadow(
////                                                              color: playerData
////                                                                  .boxColor
////                                                                  .withOpacity(
////                                                                      0.5),
////                                                              blurRadius: 2,
////                                                              offset:
////                                                                  Offset(0, 2),
////                                                            )
////                                                          ],
////                                                          color: playerData
////                                                              .boxColor,
////                                                          fontWeight:
////                                                              FontWeight.bold),
////                                                    ),
////                                                  ]),
////                                              SizedBox(
////                                                height: 5.0,
////                                              ),
//                                              Text(
//                                                playerData.currentRoll != 0
//                                                    ? 'Rolled: ${playerData.currentRoll}'
//                                                    : '',
//                                                style: TextStyle(
//                                                    color: Colors.white70,
//                                                    fontWeight:
//                                                        FontWeight.bold),
//                                              )
//                                            ],
//                                          ),
                                          ),
                                    ), //Home Box
                                    Expanded(
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
                                              width: 0.5, color: Colors.black),
                                          color: Colors.blue,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
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
                                                  MainAxisAlignment.spaceEvenly,
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
                                    Expanded(
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
                                              width: 0.5, color: Colors.black),
                                          color: Color(0xffdddd11),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
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
                                                  MainAxisAlignment.spaceEvenly,
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
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.all(2.0),
                        color: Color(0xFF222222),
                        child: Row(
                          children: [
                            DiceImage(
                              image: Image.asset('images/dice1.png'),
                              onPress: () {
                                playerData.rollRealDice(1);
                              },
                              width: width,
                              color: playerData.currentRoll == 1 &&
                                      !playerData.movedPlayer
                                  ? Colors.white70
                                  : playerData.boxColor,
                            ),
                            DiceImage(
                              image: Image.asset('images/dice2.png'),
                              onPress: () {
                                playerData.rollRealDice(2);
                              },
                              width: width,
                              color: playerData.currentRoll == 2 &&
                                      !playerData.movedPlayer
                                  ? Colors.white70
                                  : playerData.boxColor,
                            ),
                            DiceImage(
                              image: Image.asset('images/dice3.png'),
                              onPress: () {
                                playerData.rollRealDice(3);
                              },
                              width: width,
                              color: playerData.currentRoll == 3 &&
                                      !playerData.movedPlayer
                                  ? Colors.white70
                                  : playerData.boxColor,
                            ),
                            DiceImage(
                              image: Image.asset('images/dice4.png'),
                              onPress: () {
                                playerData.rollRealDice(4);
                              },
                              width: width,
                              color: playerData.currentRoll == 4 &&
                                      !playerData.movedPlayer
                                  ? Colors.white70
                                  : playerData.boxColor,
                            ),
                            DiceImage(
                              image: Image.asset('images/dice5.png'),
                              onPress: () {
                                playerData.rollRealDice(5);
                              },
                              width: width,
                              color: playerData.currentRoll == 5 &&
                                      !playerData.movedPlayer
                                  ? Colors.white70
                                  : playerData.boxColor,
                            ),
                            DiceImage(
                              image: Image.asset('images/dice6.png'),
                              onPress: () {
                                playerData.rollRealDice(6);
                              },
                              width: width,
                              color: playerData.currentRoll == 6 &&
                                      !playerData.movedPlayer
                                  ? Colors.white70
                                  : playerData.boxColor,
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                        ),
                      ),
                    ) //Dice Images
                  ],
                );
              }),
            ),
          ),
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: width / 15,
                    height: width / 15,
                    child: FittedBox(
                      child: FloatingActionButton(
                        backgroundColor: Color(0xffebc634),
                        onPressed: () => Alert(
                          style: AlertStyle(
                            isCloseButton: false,
                            alertBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          context: context,
                          title: 'Do you want to exit the game?',
                          buttons: [
                            DialogButton(
                              child: Text(
                                "YES",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () => Phoenix.rebirth(context),
                              color: Color.fromRGBO(230, 23, 47, 1.0),
                            ),
                            DialogButton(
                              child: Text(
                                "NO",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              color: Color.fromRGBO(0, 179, 134, 1.0),
                            )
                          ],
                        ).show(),
                        child: Icon(
                          Icons.arrow_back_ios,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        'Dice Mode:',
                        style: TextStyle(
                            color: Colors.white70, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: width / 15,
                        child: FittedBox(
                          child: LiteRollingSwitch(
                            animationDuration: Duration(milliseconds: 0),
                            value: true,
                            textOn: 'Real',
                            textOff: 'Virtual',
                            colorOn: Colors.green[900],
                            colorOff: Colors.blueGrey[800],
                            iconOn: Icons.account_circle,
                            iconOff: Icons.computer,
                            textSize: 16.0,
                            onChanged: (bool state) {
                              if (!state) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return VirtualDice();
                                  }),
                                );
                              }
                            },
                          ),
                        ),
                      ),
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
