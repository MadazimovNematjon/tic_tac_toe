import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tic_tac_toe/pages/introduction_screenn_page.dart';

class IntroPage extends StatefulWidget {
  static String get id => 'intro_page';
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {

  void _initTimer(){
    setState(() {
      Timer(const Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context, IntroductionPage.id);
      });
    });
  }
  @override
  void initState() {
    super.initState();
    _initTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(child: SvgPicture.asset("assets/svg/xo.svg"))
      ),
    );
  }
}
