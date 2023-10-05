import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/app_fonts.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../../app/widgets/text_widget.dart';
import '../../data/models/categories_model.dart';

class CustomCategoryItem extends StatelessWidget {
  const CustomCategoryItem({super.key, required this.categoryModelData, this.color,});
  final CategoryModelData categoryModelData;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.w,
      height: 130.h,
      margin: EdgeInsetsDirectional.only(end: 10.h),
      padding: EdgeInsetsDirectional.all(10.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color:color?? const Color(0xffD7E8E8),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16)
              ),
              child: ImageWidget(
                imageUrl:categoryModelData.image??"",
                height: 90.h,
                fit: BoxFit.fill,
              ),
            ),
          ),
          12.verticalSpace,
          TextWidget(
            title:"Flutter Track",
            titleFontWeight: FontWeight.w700,
            titleSize: 14.sp,
            titleColor: AppColors.gery455,
            fontFamily: AppFonts.bold,
          )
        ],
      ),
    );
  }
}
