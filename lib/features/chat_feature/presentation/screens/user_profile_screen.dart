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
                   text1: "Rate : ",
                   hasRate: true,
                   rate:  snapshot.data?["rate"]??0,
                   text2: snapshot.data?["rate"]==null?"0.0":snapshot.data!["rate"].toString(),
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
               Container(
                 height: 200,
                 padding: EdgeInsets.all(16.sp),
                 margin: EdgeInsets.all(16.sp),
                 decoration: BoxDecoration(
                     color: AppColors.white,
                     borderRadius: BorderRadius.circular(16.r)
                 ),
                 child: Row(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     TextWidget(
                       title: "Skills",
                       titleColor: AppColors.black3333,
                       titleSize: 16.sp,
                       titleFontWeight: FontWeight.bold,
                     ),
                     16.horizontalSpace,
                     Expanded(
                         child:ListView.separated(
                           itemCount:snapshot.data?["skills"].length??0 ,
                             itemBuilder: (context, index) {
                               return TextWidget(
                                 title: snapshot.data?["skills"][index],
                                 titleColor: AppColors.black3333,
                                 titleSize: 16.sp,
                                 titleFontWeight: FontWeight.bold,
                                 titleAlign: TextAlign.start,
                               );
                             },
                           separatorBuilder: (context, index) {
                             return 8.verticalSpace;
                           },
                         ),
                     )
                   ],
                 ),
               ),
                30.verticalSpace,
              ],
            );
          }
          return 0.verticalSpace;
        },
      ),
    );
  }

  Future<void> _launchUrl({required String url}) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
