import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:tic_tac_toe/model/member.dart';
import 'package:tic_tac_toe/pages/game_page.dart';
import 'package:tic_tac_toe/utils/style.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({Key? key}) : super(key: key);

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {

  var controller = TextEditingController();
  List<Member> items = [];
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    items.add(Member("fullName", "gmail",));
    items.add(Member("fullName", "gmail",));
    items.add(Member("fullName", "gmail",));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Friends",
          style: kDefaultTextStyle,
        ),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, GamePage.id);
          }, icon: Icon(BoxIcons.bxs_game,color: Colors.black,))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(right: 10,left: 10),
              width: double.infinity,
              height:54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  width: 2,
                  color: Colors.blue
                ),
              ),
              child:  Center(
                child: TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    hintText: 'Search Friends',
                    hintStyle: TextStyle(color: Colors.grey,fontSize: 14),
                    icon: Icon(EvaIcons.search),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                  itemBuilder: (context,index) => _searchFriends(items[index]),
              ),
            ),
          ],
        ),
      )
    );
  }
 Widget _searchFriends(Member member){
    return Container(
      margin: EdgeInsets.only(top: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(member.fullName!,style: TextStyle(fontSize: 16,color: Colors.black,fontFamily: 'Roboto',fontWeight: FontWeight.w600),),
              Row(
                children: [
                  Container(
                    height: 5,
                    width: 5,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20),
                    ) ,
                  ),
                  SizedBox(width: 5,),
                  Text("Online",style: TextStyle(fontSize: 14,fontFamily: 'Roboto',fontWeight: FontWeight.w500),)
                ],
              )
            ],
          ),

          Container(
            height: 26,
            width: 53,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                width: 1,
                color: Colors.black
              ),
            ),
            child: Center(child: Text("Invite",style: TextStyle(fontSize: 12,color: Colors.black,fontWeight: FontWeight.w600,fontFamily: 'Roboto'),)),
          ),
        ],
      ),
    );
  }
}
