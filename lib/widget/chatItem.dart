import 'package:chatest/ThemeApp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget{
  String? msg;
  String? user;
  ChatItem({this.msg,this.user});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:user=='muh'? MainAxisAlignment.end: MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: ThemeApp.chatbg,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(15),
            )
          ),
          margin: EdgeInsets.all(12),
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width*0.5,
          child: Text(msg!,style: ThemeApp.txtchatBox,),
        )
      ],
    );
  }

}