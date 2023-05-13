import 'package:flutter/material.dart';

class SearchPlayers extends StatefulWidget {
  const SearchPlayers({Key? key}) : super(key: key);

  @override
  State<SearchPlayers> createState() => _SearchPlayersState();
}

class _SearchPlayersState extends State<SearchPlayers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Text("Serch"),),
    );
  }
}
