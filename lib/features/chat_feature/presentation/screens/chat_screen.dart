import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_zone/app/utils/helper.dart';
import 'package:link_zone/app/widgets/button_widget.dart';
import 'package:link_zone/app/widgets/custom_alert_dialog.dart';
import 'package:link_zone/app/widgets/text_button_widget.dart';
import 'package:link_zone/features/auth_feature/presentation/screens/user_data_screen.dart';
import 'package:link_zone/features/chat_feature/presentation/screens/user_profile_screen.dart';
import 'package:rate/rate.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/widgets/custom_form_field.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';
import '../../../../app/widgets/text_widget.dart';
import '../../data/models/messsage_model.dart';
import '../widgets/custom_chat_buble.dart';
import '../widgets/send_services_fun.dart';
class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.chatRoomId, required this.name, required this.userId});
  final String chatRoomId;
  final String userId;
  final String name;
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController controller = TextEditingController();
  final scrollController = ScrollController();
  String? ema = FirebaseAuth.instance.currentUser!.email;
  var messages = FirebaseFirestore.instance;
  double ?rate ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBarWidget(
       actionsWidgets: [
         CustomTextButton(
           onPressed: () {
           showModalBottomSheet(
               context: context,
               builder: (context) {
                 return Padding(
                   padding: const EdgeInsets.all(16.0),
                   child: SizedBox(
                     height: 250.h,
                     child: Column(
                       children: [
                         TextWidget(
                             title: "Please , Give Rate To ${widget.name}",
                             titleSize: 16.sp,
                             titleFontWeight: FontWeight.w600,
                           titleColor: AppColors.black,
                         ),
                         32.verticalSpace,
                         Rate(
                           color:Colors.amber,
                           allowHalf: true,
                           iconSize: 40.sp,
                           initialValue: rate??0,
                           onChange: (value) {
                             setState(() {
                               rate = value;
                             });
                             print(rate);
                           },
                         ),
                         45.verticalSpace,
                         ButtonWidget(
                           onPressed: () {
                             FirebaseFirestore.instance.collection("users").doc(widget.userId).update({
                               "rate":rate
                             }).then((value){
                               Navigator.pop(context);
                             });
                           },
                           text: "Rate",
                           textSize: 16.sp,
                         )

                       ],
                     ),
                   ),
                 );
               },
           );
           },
           title: "End Project",
         )
       ],
        titleWidget: InkWell(
          onTap: () {
            navigateTo(UserProfileScreen(
                id: widget.userId, name: widget.name,
            ));
          },
          child: TextWidget(
            title: widget.name,
            titleFontWeight: FontWeight.w400,
            titleSize: 20.sp,
            titleColor: AppColors.gery455,
          ),
        ),
      ),
      body:
      Column(
        children: [
          Expanded(
              child:StreamBuilder(
                stream:messages.collection('chatroom').doc(widget.chatRoomId).collection('chats').orderBy('time', descending: true).snapshots(),
                builder: (context, snapshot) {
                  if(snapshot.hasData){
                    List <Message> listMessages = [];
                    for (int i = 0; i < snapshot.data!.docs.length; i++) {
                      listMessages.add(Message.fromJson(snapshot.data!.docs[i]));
                    }
                    return ListView.builder(
                      reverse: true,
                      controller: scrollController,
                      itemCount: listMessages.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            listMessages[index].email == ema?
                            CustomChatBubble(
                              message: listMessages[index],
                            ): CustomFriendChatBubble(
                              message: listMessages[index],
                            )
                          ],
                        );
                      },
                    );
                  }
                  return 0.verticalSpace;
                },
              )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 16),
            child: Row(
              children: [
                Expanded(
                  child:  CustomFormField(
                    hint: "Type Your Message",
                    controller: controller,
                  ),
                ),
                10.horizontalSpace,
                IconButton(
                  onPressed:()async {
                    await MessageStoreService.storeMessage(
                      chatId: widget.chatRoomId,
                      name: widget.name,
                      userMessage: controller.text,
                    );
                    scrollController.jumpTo(
                        0
                    );
                    controller.clear();
                  },
                  icon: Icon(
                    Icons.send,
                    size: 30.sp,
                    color: AppColors.mainColor,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
