import 'package:flutter/material.dart';
import 'package:tic_tac_toe/utils/style.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String fullName = "Nematjon", gmail = 'nmadazimov734@gmail.com', image = 'https://mobimg.b-cdn.net/v3/fetch/cd/cde7d5b248d4ba3642204a6d032b7dc1.jpeg';
  int wins = 0, losses = 0, draws = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Profile",
          style: kDefaultTextStyle,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.logout_sharp,
                color: Colors.black,
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(66),
                  border: Border.all(
                    width: 3,
                    color: Colors.red
                  )
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(33),
                  child: Image.network(image, width: 65,height: 65,fit: BoxFit.cover,),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10),
                width: double.infinity,
                height: 160,
                child: Column(
                  children: [
                    Text(fullName,style: const TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold,fontFamily: 'Roboto'),),
                    Text(gmail,style: const TextStyle(fontSize: 14,color: Colors.grey,),),

                    const SizedBox(height: 36,),



                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(wins.toString(),style: const TextStyle(fontSize: 24,fontFamily: 'Roboto',fontWeight: FontWeight.bold),),
                              const SizedBox(height: 5,),
                              const Text("Wins",style: TextStyle(fontSize: 14,fontFamily: 'Roboto',fontWeight: FontWeight.w600,color: Colors.grey),),
                            ],
                          ),
                          Container(width: 1,height:24,color: Colors.grey,),
                          Column(
                            children: [
                              Text(wins.toString(),style: const TextStyle(fontSize: 24,fontFamily: 'Roboto',fontWeight: FontWeight.bold),),
                              const SizedBox(height: 5,),
                              const Text("Losses",style: TextStyle(fontSize: 14,fontFamily: 'Roboto',fontWeight: FontWeight.w600,color: Colors.grey),),
                            ],
                          ),

                          Container(width: 1,height:24,color: Colors.grey,),

                          Column(
                            children: [
                              Text(wins.toString(),style: const TextStyle(fontSize: 24,fontFamily: 'Roboto',fontWeight: FontWeight.bold),),
                              const SizedBox(height: 5,),
                              const Text("Draws",style: TextStyle(fontSize: 14,fontFamily: 'Roboto',fontWeight: FontWeight.w600,color: Colors.grey),),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),


              //body

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /*Game History*/

                  Text("Game History",style: TextStyle(fontSize: 16,color: Colors.black,fontFamily: 'Roboto',fontWeight: FontWeight.w600),),
                  SizedBox(height: 15,),
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Color(0xFFF1F1F1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  
                  SizedBox(height: 24,),

                  /*Scoreboard*/

                  Text("Scoreboard",style: TextStyle(fontSize: 16,color: Colors.black,fontFamily: 'Roboto',fontWeight: FontWeight.w600),),
                  SizedBox(height: 15,),
                  Container(
                    margin: EdgeInsets.only(bottom: 100),
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Color(0xFFF1F1F1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
