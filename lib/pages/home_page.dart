import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:tic_tac_toe/pages/frends_page.dart';
import 'package:tic_tac_toe/pages/profil_page.dart';
import 'package:tic_tac_toe/pages/search_players.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static String get id => "home_page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late PageController controller;

  int selectedPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        onPageChanged: (int index){
          setState(() {
            selectedPage = index;
          });
        },
        children: [
          SearchPlayers(),
          FriendsPage(),
          ProfilePage(),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: FloatingNavbar(
        currentIndex: selectedPage,
        onTap: (int index){
          setState(() {
            selectedPage = index;
            controller.animateToPage(index, duration: Duration(microseconds: 5000), curve: Curves.easeIn);
          });
        },

        items: [
          FloatingNavbarItem(icon: EvaIcons.search),
          FloatingNavbarItem(icon: EvaIcons.people),
          FloatingNavbarItem(icon: Icons.home),
        ],
        backgroundColor: Colors.blue,
        elevation: 30,
        selectedBackgroundColor: Colors.transparent,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black54,
        margin: EdgeInsets.only(bottom:20,left: 20,right: 20),
      )
    );
  }
}
