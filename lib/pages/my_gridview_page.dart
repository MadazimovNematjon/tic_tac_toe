import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../service/game_servise.dart';


class MyGridViewPage extends StatefulWidget {
  const MyGridViewPage({Key? key}) : super(key: key);

  @override
  State<MyGridViewPage> createState() => _MyGridViewPageState();
}

class _MyGridViewPageState extends State<MyGridViewPage> {
  bool Loading = false;
  bool vsComputer = false;

  playMove(int index) {
    if (GameService.board[index] == "" && GameService.winner.isEmpty) {
      setState(() {
        GameService.winnerGame();
        vsComputer = true;

        GameService.board[index] = GameService.player;
        GameService.winnerGame();

        GameService.player = GameService.player == "X" ? "O" : "X";

        if (vsComputer == true && GameService.player == "O") {
          // print("=====================$vsComputer");

          Timer(const Duration(seconds: 1), () async {
            // GameService(playMove: playMove(index));
            try {
              await GameService.pcGame(playMove);
            } catch (e) {}
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: 9,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                vsComputer == true && GameService.player == "O"
                    ? const SizedBox.shrink()
                    : playMove(index);
              });
            },
            child: Container(
              height: 104,
              width: 104,
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: GameService.board[index].isEmpty
                      ? Colors.white
                      : GameService.board[index] == "X"
                          ? const Color(0x3346A3FF)
                          : const Color(0x33FF827E),
                  border: Border.all(
                    width: 2,
                    color: GameService.board[index].isEmpty
                        ? const Color(0xFFE3E3E3)
                        : GameService.board[index] == "X"
                            ? const Color(0xFF46A3FF)
                            : const Color(0xFFFF827E),
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
                    : const SizedBox.shrink(),
              ),
            ),
          );
        });
  }
}
