import 'dart:async';

import '../pages/game_page.dart';

import 'dart:math';

class GameService {
  final Function? playMove;
  static bool vsComputer = false;
  static List<String> board = List.filled(9, "");
  static String winner = "";
  static String player = "X";
  static String pcPlayer = "";
  static List lines = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ];

  GameService({this.playMove});

  static winnerGame() {
    for (var line in lines) {
      var a = board[line[0]];
      var b = board[line[1]];
      var c = board[line[2]];

      if (a == b && b == c && a != "") {
        winner = a;
        break;
      }
    }

    if (winner == "" && !board.contains("")) {
      winner = "Durrang";
    }
  }

  static void restartGame() {
    board = List.filled(9, "");
    player = "X";
    winner = "";

  }

  static void pcGame(playMove) {
    final random = Random();
    int index = random.nextInt(9);

    for (var line in lines) {
      var a = board[line[0]];
      var b = board[line[1]];
      var c = board[line[2]];

      if (a.isEmpty && b == c && c != "") {
        index = line[0];
        playMove(index)!;
        break;
      } else if (b.isEmpty && a == c && a != "") {
        index = line[1];
        playMove(index)!;
        break;
      } else if (c.isEmpty && a == b && a != "") {
        index = line[2];
        playMove(index)!;
        break;
      } else{
        while (board[index] != "") {
          index = random.nextInt(9);
          break;
        }
      }
    }
    playMove(index)!;
  }
}
