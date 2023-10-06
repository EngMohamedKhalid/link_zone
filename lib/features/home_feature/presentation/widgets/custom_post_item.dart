import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_zone/app/widgets/text_button_widget.dart';

import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/app_fonts.dart';
import '../../../../app/widgets/flutter_toast.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../../app/widgets/text_widget.dart';
import '../../../categories_feature/data/models/product_details.dart';
import 'custom_add_to_card.dart';
import 'custom_add_to_favourite.dart';

class CustomPostItem extends StatelessWidget {
  const CustomPostItem({super.key, this.post, this.name, this.onPressed,  this.isCurrentUser=false});
  final String? post;
  final String? name;
  final VoidCallback? onPressed;
  final bool isCurrentUser;
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 300.w,
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsetsDirectional.all(12.sp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ImageWidget(
                imageUrl: "assets/images/user.png",
                height: 40.h,width: 50.w,
              ),
              16.horizontalSpace,
              TextWidget(
                title:name?? "Eng Mohamed Khalid",
                titleColor: AppColors.black3333,
                titleSize: 15.sp,
                titleMaxLines: 1,
                fontFamily: AppFonts.bold,
              ),
            ],
          ),
          16.verticalSpace,
          TextWidget(
            title:post?? """Make sure to call either requestNotificationPermission() or checkNotificationPermissionStatus() as needed in your Flutter application. For example, you can request the permission when the user explicitly triggers a notification-related action or check the permission status during app initialization.
Remember to handle the permission response appropriately based on your app's requirements and user experience. You can display custom dialogues or user prompts to inform the user about the permission request and guide them to grant or deny the permission as desired.""",
            titleColor: AppColors.black3333,
            titleSize: 16.sp,
            titleAlign: TextAlign.start,
            titleMaxLines: 500,
            titleFontWeight: FontWeight.normal,
          ),
          12.verticalSpace,
          isCurrentUser?Align(
            alignment: AlignmentDirectional.centerEnd,
            child: CustomTextButton(
              onPressed: onPressed??() {},
              title: "Chat With $name ",
              titleSize: 16.sp,
              titleFontWeight: FontWeight.w600,
            ),
          ):0.verticalSpace
        ],
      ),

    );
  }
}
