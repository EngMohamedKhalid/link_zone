import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_zone/app/utils/helper.dart';
import 'package:link_zone/app/widgets/default_app_bar_widget.dart';
import 'package:link_zone/features/chat_feature/presentation/screens/chat_screen.dart';
import 'package:link_zone/features/home_feature/presentation/widgets/custom_product_item.dart';

import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/app_fonts.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../../app/widgets/text_widget.dart';

class AllChatsScreen extends StatefulWidget {
  const AllChatsScreen({super.key});

  @override
  State<AllChatsScreen> createState() => _AllChatsScreenState();
}

class _AllChatsScreenState extends State<AllChatsScreen> {
  String chatRoomId(String user1, String user2) {
    if (user1[0].toLowerCase().codeUnits[0] >
        user2.toLowerCase().codeUnits[0]) {
      return "$user1$user2";
    } else {
      return "$user2$user1";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBarWidget(
        title: "Chats",
      ),
      body: StreamBuilder(
        stream:FirebaseFirestore.instance.collection("users").where(
            "id",isNotEqualTo:FirebaseAuth.instance.currentUser!.uid
        ).snapshots() ,
        builder:  (context, snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
              padding: EdgeInsets.all(16.sp ),
              itemCount: snapshot.data?.docs.length??0,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      String roomId = chatRoomId(
                          FirebaseAuth.instance.currentUser!.uid,
                          snapshot.data!.docs[index]["id"]
                      );
                      navigateTo(ChatScreen(
                          chatRoomId: roomId,
                          userId: snapshot.data!.docs[index]["id"]??"",
                          name: snapshot.data!.docs[index]["name"]??"",
                      ));
                    },
                    child: Container(
                      height: 130.h,
                      margin: EdgeInsets.only(bottom: 16.h),
                      padding: EdgeInsetsDirectional.all(4.sp),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white
                      ),
                      child: Row(
                        children: [
                          ImageWidget(
                            imageUrl: "assets/images/user.png",
                            height: 75.h,width: 100.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              16.verticalSpace,
                              TextWidget(
                                title:snapshot.data?.docs[index]["name"]?? "",
                                titleColor: AppColors.black3333,
                                titleSize: 15.sp,
                                titleMaxLines: 1,
                                fontFamily: AppFonts.bold,
                              ),
                              12.verticalSpace,
                              TextWidget(
                                title: snapshot.data?.docs[index]["currentJob"]??"",
                                titleColor: AppColors.black3333,
                                titleSize: 14.sp,
                                fontFamily: AppFonts.bold,
                              ),
                              4.horizontalSpace,
                              TextWidget(
                                title:snapshot.data?.docs[index]["workType"]??"",
                                titleColor: AppColors.hint,
                                titleSize: 14.sp,
                              ),
                            ],
                          )
                        ],
                      ),

                    ),
                  );
                },
            );
          }
          return 0.verticalSpace;
        },
      ),
    );
  }
}
