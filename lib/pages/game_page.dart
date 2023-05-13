import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tic_tac_toe/service/game_servise.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  static String get id => 'game_page';

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  bool Loading = false;
  var vsComputer = false;






 playMove(int index) {
    if (GameService.board[index] == "" && GameService.winner == "") {
      setState(() {
        vsComputer = true;
        print(vsComputer);
        GameService.board[index] = GameService.player;
        GameService.winnerGame();
        GameService.player = GameService.player == "X" ? "O" : "X";
        if (vsComputer == true && GameService.player == "O") {
          print("=====================$vsComputer");
          Timer(Duration(seconds: 1), () {
            // GameService(playMove: playMove(index));
            try{
              GameService.pcGame(playMove);
            }catch(e){
              print(e);
            }

          });
        }
     });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text(Loading == true ? "Loading" : 'play'),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {

                  GameService.restartGame();
                });
              },
              icon: Icon(
                Icons.restart_alt,
                color: Colors.black,
              ))
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              GameService.winner == ""
                  ? "Player ${GameService.player}"
                  : "Winner ${GameService.winner}",
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 48,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: 9,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          playMove(index);
                          print(GameService.player);
                        },
                        child: Container(
                          height: 104,
                          width: 104,
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: GameService.board[index].isEmpty
                                  ? Colors.white
                                  : GameService.board[index] == "X"
                                      ? Color(0x3346A3FF)
                                      : Color(0x33FF827E),
                              border: Border.all(
                                width: 2,
                                color: GameService.board[index].isEmpty
                                    ? Color(0xFFE3E3E3)
                                    : GameService.board[index] == "X"
                                        ? Color(0xFF46A3FF)
                                        : Color(0xFFFF827E),
                              )),
                          child: Center(
                            child: GameService.board[index].isNotEmpty
                                ? SvgPicture.asset(
                                    GameService.board[index] == "X"
                                        ? 'assets/svg/x.svg'
                                        : 'assets/svg/o.svg',
                                    height: 28,
                                    width: 28,
                                  )
                                : SizedBox.shrink(),
                          ),
                        ));
                  }),
            )
          ],
        ),
      ),
    );
  }
}
//
