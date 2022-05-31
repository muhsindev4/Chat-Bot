import 'package:chatest/models/ChatModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ThemeApp.dart';

class TypingPad extends StatelessWidget{
  TextEditingController myController=TextEditingController();
  ValueChanged? onSend;
  TypingPad({this.onSend});
  @override
  Widget build(BuildContext context) {
   return Container(
     margin: EdgeInsets.only(left: 10,right: 10,bottom: 10),
     decoration: BoxDecoration(
         color: Colors.white,
         borderRadius: BorderRadius.circular(15)
     ),
     child: Row(
       children: [
         Expanded(
           child: TextField(
             keyboardType: TextInputType.multiline,
             controller: myController,
             decoration: InputDecoration(
               contentPadding: EdgeInsets.all(20),
               hintText:' Type to start chat',
               hintStyle: ThemeApp.txtHint,
               suffixIcon: IconButton(
                 color: ThemeApp.primery,
                 padding: EdgeInsets.only(right: 30),
                 onPressed: () {
                   if(myController.text.isNotEmpty){
                     ChatModel chatModel=ChatModel();
                     chatModel.time= DateTime.now().millisecondsSinceEpoch;
                     chatModel.msg= myController.text.toString();
                     chatModel.type= 'txt';
                     chatModel.userId= 'muh';




                     ///bot
                     ChatModel chatModelBot=ChatModel();
                     chatModelBot.time= DateTime.now().millisecondsSinceEpoch;
                     chatModelBot.msg= myController.text.toString();
                     chatModelBot.type= 'txt';
                     chatModelBot.userId= 'bot';

                     myController.clear();
                     onSend!([chatModel,chatModelBot]);
                   }
                 },
                 icon: Icon(
                   Icons.send_outlined,
                   size: 30,
                 ),
               ),
               border: UnderlineInputBorder(borderSide: BorderSide.none),
               enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
               focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none),
             ),
           ),
         ),
       ],

     ),
   );
  }

}