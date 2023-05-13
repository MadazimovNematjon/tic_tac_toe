import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:icons_plus/icons_plus.dart';

import 'home_page.dart';

class SignIn extends StatefulWidget {
  static String get id => 'sign_in';

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/svg/xo.svg',
                width: 100,
              ),
              SizedBox(
                height: 37,
              ),
              Text(
                "Welcome",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 34,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 2,
              ),
              Text("Please sign in to continue.",
                  style: TextStyle(
                      fontSize: 16, fontFamily: 'Roboto', color: Colors.grey)),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.pushReplacementNamed(context, HomePage.id);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  width: double.infinity,
                  height: 54,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      )),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Logo(Logos.google,size: 20,),
                        SizedBox(width: 5,),
                        Text("Sing in with Google",style: TextStyle(fontSize:14,color: Colors.black,fontFamily: 'Roboto' ),),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                width: double.infinity,
                height: 54,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    )),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Logo(Logos.facebook_f,size: 20,),
                      SizedBox(width: 5,),
                      Text("Sing in with Facebook",style: TextStyle(fontSize:14,color: Colors.black,fontFamily: 'Roboto' ),),
                    ],
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
