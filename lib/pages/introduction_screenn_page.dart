import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:tic_tac_toe/pages/sign_in.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({Key? key}) : super(key: key);
  static String get id => 'introduction_page';

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {

  List<PageViewModel> getPage(){
    return [
      PageViewModel(
        image: Image.asset("assets/images/lamp.png",width: 200,height: 200,),
        title: "Welcome",
        body: "Most fun game now available on your smartphone device!",
      ),
      PageViewModel(
        image: Image.asset("assets/images/sword.png",width: 200,height: 200,),
        title: "Compete",
        body: "Play online with your friends and top the leaderboard!"
      ),
      PageViewModel(
          image: Image.asset("assets/images/cubic.png",width: 200,height: 200,),
          title: "Scoreboard",
          body: "Earn points for each game and make your way to top the scoreboard!"
      ),

    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IntroductionScreen(
        done: Text("done"),
        bodyPadding: EdgeInsets.only(top: 200),
        onDone: (){
          Navigator.pushReplacementNamed(context, SignIn.id);
        },
        pages: getPage(),
        next: Text("Next"),

        globalBackgroundColor: Colors.white,
      ),
    );
  }
}
