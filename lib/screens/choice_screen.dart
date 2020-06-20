import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../player_data.dart';
import 'real_dice.dart';
import 'package:provider/provider.dart';
import 'virtual_dice.dart';

class ChoiceScreen extends StatefulWidget {
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
            Text(
              'CHOOSE DICE TYPE:',
              style: TextStyle(
                  color: Colors.greenAccent, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            LiteRollingSwitch(
              animationDuration: Duration(milliseconds: 300),
              value: real,
              textOn: 'Real',
              textOff: 'Virtual',
              colorOn: Colors.green[900],
              colorOff: Colors.blueGrey[800],
              iconOn: Icons.account_circle,
              iconOff: Icons.computer,
              textSize: 18.0,
              onChanged: (bool state) {
                real = state;
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
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
                      playerSelectionButton(Colors.red[800], 0),
                      SizedBox(
                        width: 10.0,
                      ),
                      playerSelectionButton(Colors.green[800], 1)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      playerSelectionButton(Colors.blue[800], 3),
                      SizedBox(
                        width: 10.0,
                      ),
                      playerSelectionButton(Colors.yellow[700], 2)
                    ],
                  )
                ],
              ),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              color: Color(0xfffc8c03),
              child: Container(
                  width: 100,
                  child: Text(
                    'Let\'s Play',
                    textAlign: TextAlign.center,
                  )),
              onPressed: () {
                if (players < 2) {
                  Alert(
                          style: AlertStyle(isCloseButton: false),
                          context: context,
                          title: 'Ludo is played with minimum of 2 players.')
                      .show();
                  return;
                }
                if (players < 4) {
                  for (int i = 0; i < 4; i++) {
                    if (!buttonState[i]) {
                      Provider.of<PlayerData>(context, listen: false)
                          .winners
                          .add(i * 4);
                    }
                  }
                  if (!buttonState[0]) {
                    Provider.of<PlayerData>(context, listen: false)
                        .nextPlayer();
                  }
                }
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return real ? RealDice() : VirtualDice();
                  }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  FlatButton playerSelectionButton(Color color, int i) {
    return FlatButton(
      child: Text(
        buttonText[i],
        style: TextStyle(color: Colors.white),
      ),
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
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
          Provider.of<PlayerData>(context, listen: false).playing[i] = true;
          Provider.of<PlayerData>(context, listen: false).numberOfPlayers++;
        } else {
          Provider.of<PlayerData>(context, listen: false).playing[i] = false;
          Provider.of<PlayerData>(context, listen: false).numberOfPlayers--;
        }
      },
    );
  }
}
