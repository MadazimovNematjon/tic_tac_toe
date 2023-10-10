import 'package:flutter/material.dart';
import 'package:tic_tac_toe/pages/game_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  GamePage(),
      routes:{
        GamePage.id : (context) => GamePage(),
      },
    );
  }
}