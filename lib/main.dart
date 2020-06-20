import 'package:flutter/material.dart';
import 'screens/choice_screen.dart';
import 'package:provider/provider.dart';
import 'player_data.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

void main() {
  runApp(Phoenix(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PlayerData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ludo',
        home: ChoiceScreen(),
      ),
    );
  }
}
