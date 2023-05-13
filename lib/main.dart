import 'package:flutter/material.dart';
import 'package:tic_tac_toe/pages/game_page.dart';
import 'package:tic_tac_toe/pages/home_page.dart';
import 'package:tic_tac_toe/pages/intro_page.dart';
import 'package:tic_tac_toe/pages/introduction_screenn_page.dart';
import 'package:tic_tac_toe/pages/sign_in.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  IntroPage(),
      routes:{
        IntroductionPage.id : (context) => IntroductionPage(),
        SignIn.id : (context) => SignIn(),
        HomePage.id : (context) => HomePage(),
        GamePage.id : (context) => GamePage(),
      },
    );
  }
}