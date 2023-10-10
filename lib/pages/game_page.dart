import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tic_tac_toe/pages/my_gridview_page.dart';
import 'package:tic_tac_toe/service/game_servise.dart';

import '../utils/style.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  static String get id => 'game_page';

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text('Play',style: kDefaultTextStyle),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  GameService.restartGame();
                });

              },
              icon: const Icon(
                Icons.restart_alt,
                color: Colors.black,
              ))
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              GameService.winner == ""
                  ? "Player ${GameService.player}"
                  : "Winner ${GameService.winner}",
              style: const TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 48,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: MyGridViewPage(),
            )
          ],
        ),
      ),
    );
  }
}
