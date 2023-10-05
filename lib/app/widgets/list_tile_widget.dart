import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_zone/app/widgets/text_widget.dart';

import '../utils/app_colors.dart';
import '../utils/app_fonts.dart';
import 'image_widget.dart';

class ListTileWidget extends StatelessWidget {
  final void Function() onTap;
  final IconData icon;
  final String title;
  final String imageUrl;
  final Color? tralingColor;
  final Color? textColor;
  final Color? iconColor;
  final bool arrowIcon;
  final bool image;

  const ListTileWidget({
    super.key,
    required this.onTap,
    required this.icon,
    this.tralingColor,
    this.arrowIcon = true, required this.title, this.textColor, this.iconColor, this.image= false,  this.imageUrl="",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70.h,
      alignment: AlignmentDirectional.center,
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
      margin: EdgeInsets.symmetric(horizontal: 16.w,),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12)
      ),
      child: ListTile(
        onTap: onTap,
        leading:image?
            ImageWidget(
                imageUrl: imageUrl,
              width: 25.w,
              height: 25.h,
              color: AppColors.mainColor,
            )
            :
        Icon(
          icon,
          size: 25.sp,
          color:iconColor?? AppColors.mainColor,
        ),
        minLeadingWidth: 8.w,
        contentPadding: const EdgeInsets.symmetric(horizontal: 0,),
        title: TextWidget(
          title: title,
          titleSize: 18.sp,
          fontFamily: AppFonts.semiBold,
          titleFontWeight: FontWeight.w600,
          titleColor:textColor?? AppColors.gery455,
          titleAlign: TextAlign.start,
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color:tralingColor?? AppColors.gery455,
          size: 20.sp,
        ),

      ),
    );
  }
}
