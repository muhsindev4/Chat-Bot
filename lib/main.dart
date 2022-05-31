
import 'dart:async';

import 'package:chatest/ThemeApp.dart';
import 'package:chatest/models/ChatModel.dart';
import 'package:chatest/widget/TypingPad.dart';
import 'package:chatest/widget/chatItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: ThemeApp.primery,
    ),
    home: TestMessge(),
  ));
}

class TestMessge extends StatefulWidget{
  @override
  State<TestMessge> createState() => _TestMessgeState();
}

class _TestMessgeState extends State<TestMessge> {
  List<ChatModel> chatList=[];
  ScrollController _scrollController=ScrollController();


  addingDemo(){
    chatList.add(ChatModel(
      msg: 'Hi',
      type: 'txt',
      time: DateTime.now().millisecondsSinceEpoch,
      userId: 'muh',
    ));

    chatList.add(ChatModel(
      msg: 'Hi',
      type: 'txt',
      time: DateTime.now().millisecondsSinceEpoch,
      userId: 'bot',
    ));

    chatList.add(ChatModel(
      msg: 'How are you',
      type: 'txt',
      time: DateTime.now().millisecondsSinceEpoch,
      userId: 'muh',
    ));

    chatList.add(ChatModel(
      msg: 'I am fine',
      type: 'txt',
      time: DateTime.now().millisecondsSinceEpoch,
      userId: 'bot',
    ));


    chatList.add(ChatModel(
      msg: 'What is your name',
      type: 'txt',
      time: DateTime.now().millisecondsSinceEpoch,
      userId: 'muh',
    ));

    chatList.add(ChatModel(
      msg: 'My name is Bot',
      type: 'txt',
      time: DateTime.now().millisecondsSinceEpoch,
      userId: 'bot',
    ));

    chatList.add(ChatModel(
      msg: 'And You',
      type: 'txt',
      time: DateTime.now().millisecondsSinceEpoch,
      userId: 'bot',
    ));


    chatList.add(ChatModel(
      msg: 'My name is Muhsin',
      type: 'txt',
      time: DateTime.now().millisecondsSinceEpoch,
      userId: 'muh',
    ));


    chatList.add(ChatModel(
      msg: 'You from',
      type: 'txt',
      time: DateTime.now().millisecondsSinceEpoch,
      userId: 'muh',
    ));

    chatList.add(ChatModel(
      msg: 'Iam From Flutter',
      type: 'txt',
      time: DateTime.now().millisecondsSinceEpoch,
      userId: 'bot',
    ));

    chatList.add(ChatModel(
      msg: 'And You',
      type: 'txt',
      time: DateTime.now().millisecondsSinceEpoch,
      userId: 'bot',
    ));

    chatList.add(ChatModel(
      msg: 'Iam From Malappuram',
      type: 'txt',
      time: DateTime.now().millisecondsSinceEpoch,
      userId: 'muh',
    ));

  }

  _scrollToBottom() {
    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  }
  bool _scrollClient(){
    if(_scrollController.hasClients==true){
      setState(() {
        _scrollToBottom();
      });
      return true;
    }else{
      return false;
    }
  }
  @override
  void initState() {
    super.initState();
    addingDemo();
    _scrollClient();
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     bottomSheet: TypingPad(
       onSend: (models){

         setState(() {
           chatList.add(models[0]);
           _scrollToBottom();
         });
         Future.delayed(Duration(seconds: 1)).then((value){
           setState(() {
             chatList.add(models[1]);
             _scrollToBottom();
           });
         });


       },
     ),
      body: SafeArea(
        child:  ListView.builder(
          controller: _scrollController,
          itemCount: chatList.length,
          itemBuilder: (BuildContext context, int index) {
            return ChatItem(
              msg: chatList[index].msg,
              user: chatList[index].userId,
            );
          },
        )
      ),
    );
  }
}
