import 'package:flutter/material.dart';


class ChatList extends StatefulWidget {
  const ChatList({super.key});

  @override
  State<ChatList> createState() => __ChatListState();
}

class __ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat list'),
      ),
      body: Container(
        height: 550,
        //child: SfCartesianChart(),
        ),
    );
  }
}