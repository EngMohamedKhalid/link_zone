import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_zone/app/utils/helper.dart';
import 'package:link_zone/app/widgets/button_widget.dart';
import 'package:link_zone/features/chat_feature/presentation/screens/chat_screen.dart';
import 'package:link_zone/features/home_feature/presentation/widgets/custom_home_row.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';
import '../../../../app/widgets/text_widget.dart';
class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key,required this.id, required this.name});
 final String id;
 final String name;

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBarWidget(
        titleWidget: TextWidget(
          title: "Profile Details",
          titleFontWeight: FontWeight.w400,
          titleSize: 20.sp,
          titleColor: AppColors.gery455,
        ),
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection("users").doc(widget.id).get(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return ListView(
              children: [
               CustomHomeRow(
                   text1: "Name : ",
                   text2: snapshot.data?["name"]??"",
               ),
               CustomHomeRow(
                 onTap: ()async {
                   await _launchUrl(url:"mailto:${snapshot.data?["email"]}");
                 },
                   text1: "Email : ",
                   text2: snapshot.data?["email"]??"",
                 isUnderLine: true,
               ),
                CustomHomeRow(
                  text1: "Github Link : ",
                  onTap: ()async {
                    await _launchUrl(url:snapshot.data?["github"]);
                  },
                  text2: snapshot.data?["github"]??"",
                  isUnderLine: true,
                ),
                CustomHomeRow(
                  text1: "Phone Number : ",
                  onTap: ()async {
                    await _launchUrl(url:"tel:${snapshot.data?["phone"]}");
                  },
                  text2: snapshot.data?["phone"]??"",
                  isUnderLine: true,
                ),
               CustomHomeRow(
                   text1: "Account Type : ",
                   text2: snapshot.data?["accountType"]??"",
               ),
               CustomHomeRow(
                   text1: "Work Type : ",
                   text2: snapshot.data?["workType"]??"",
               ),
               CustomHomeRow(
                   text1: "Interests : ",
                   text2: snapshot.data?["interested"]??"",
               ),
               CustomHomeRow(
                   text1: "Skills : ",
                   text2: snapshot.data?["skills"]??"",
               ),
              ],
            );
          }
          return 0.verticalSpace;
        },
      ),
      bottomNavigationBar: Container(
        color: AppColors.white,
        padding: EdgeInsets.symmetric(horizontal: 16.sp,vertical: 16.sp),
        child: ButtonWidget(
          text: "Chat With ${widget.name}",
          onPressed: () {
            navigateTo(ChatScreen());
          },
        ),
      ),
    );
  }

  Future<void> _launchUrl({required String url}) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
