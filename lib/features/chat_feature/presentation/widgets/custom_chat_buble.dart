// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_5.dart';
import 'package:link_zone/app/utils/app_colors.dart';

import '../../data/models/messsage_model.dart';
class CustomChatBubble extends StatelessWidget {
  CustomChatBubble({Key? key, required this.message, }) : super(key: key);
  final Message message;
  final String amPm= DateTime.now().hour<12?"Am" :"Pm" ;
  final  time1 = DateTime.now().hour.remainder(12)==0?DateTime.now().hour.remainder(12)+12:DateTime.now().hour.remainder(12);
  final  time2 = DateTime.now().minute;
  @override
  Widget build(BuildContext context) {
    return
      Align(
          alignment: Alignment.centerRight,
          child:
          ChatBubble(
            clipper: ChatBubbleClipper5(type: BubbleType.sendBubble),
            alignment: Alignment.topRight,
            margin:const EdgeInsets.only(top: 20,right: 10,left: 10,bottom: 20),
            backGroundColor: AppColors.mainColor,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7,
              ),
              child: Text(
                message.message,
                style:const TextStyle(color: Colors.white ,fontSize: 20),
              ),
            ),
          )
      );
  }
}

class CustomFriendChatBubble extends StatelessWidget {
  CustomFriendChatBubble({Key? key, required this.message, }) : super(key: key);
  final Message message;
  final String amPm= DateTime.now().hour<12?"Am" :"Pm" ;
  final  time1 = DateTime.now().hour.remainder(12)==0?DateTime.now().hour.remainder(12)+12:DateTime.now().hour.remainder(12);
  final  time2 = DateTime.now().minute;
  @override
  Widget build(BuildContext context) {
    return
      Align(
          alignment: Alignment.centerLeft,
          child:
          ChatBubble(
            clipper: ChatBubbleClipper5(type: BubbleType.receiverBubble),
            alignment: Alignment.topLeft,
            margin:const EdgeInsets.only(top: 20,right: 10,left: 10,bottom: 20),
            backGroundColor: Colors.white,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7,
              ),
              child: Text(
                message.message,
                style: TextStyle(color: AppColors.mainColor ,fontSize: 20),
              ),
            ),
          )
      );
  }
}
