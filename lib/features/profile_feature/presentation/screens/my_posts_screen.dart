import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';
import '../../../../app/widgets/text_widget.dart';
import '../../../home_feature/presentation/widgets/custom_post_item.dart';
class MyPostsScreen extends StatelessWidget {
  const MyPostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBarWidget(
        titleWidget: TextWidget(
          title: "My Posts",
          titleFontWeight: FontWeight.w400,
          titleSize: 20.sp,
          titleColor: AppColors.gery455,
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("posts")
        .where("userId",isEqualTo: FirebaseAuth.instance.currentUser?.uid).snapshots(),
        builder: (context, snapshot){
          if(snapshot.hasData){
           return snapshot.data!.docs.isEmpty?
            const Center(
              child: TextWidget(
                title: "No Posts",
              ),
            ):
            ListView.separated(
              physics:const BouncingScrollPhysics(),
              itemCount: snapshot.data?.docs.length??0,
              padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: CustomPostItem(
                    name: snapshot.data?.docs[index]["name"]??"",
                    post: snapshot.data?.docs[index]["post"]??"",
                  ),
                );
              },
              separatorBuilder: (context, index) => 16.horizontalSpace,
            );
          }
          return 0.verticalSpace;
        },
      ),
    );
  }
}
