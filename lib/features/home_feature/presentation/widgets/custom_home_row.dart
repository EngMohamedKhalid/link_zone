import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rate/rate.dart';

import '../../../../app/utils/app_colors.dart';
import '../../../../app/widgets/text_widget.dart';

class CustomHomeRow extends StatelessWidget {
  const CustomHomeRow({super.key,this.onTap, required this.text1,
    required this.text2,  this.isUnderLine=false,  this.rate=0,  this.hasRate=false});
  final String text1;
  final String text2;
  final double rate;
  final bool isUnderLine;
  final bool hasRate;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return  Container(
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
            title: text1,
            titleColor: AppColors.black3333,
            titleSize: 16.sp,
            titleFontWeight: FontWeight.bold,
          ),
          Expanded(
            child: InkWell(
              onTap: onTap??(){},
              child:
              hasRate?   Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget(
                    title: text2,
                    titleColor: AppColors.gery455,
                    titleSize: 18.sp,
                    titleFontWeight: FontWeight.w500,
                    textDecoration: isUnderLine?TextDecoration.underline:TextDecoration.none,
                  ),
                  8.horizontalSpace,
                  Rate(
                    color:Colors.amber,
                    allowHalf: true,
                    readOnly: true,
                    initialValue: rate,
                  )
                ],
              ): TextWidget(
                title: text2,
                titleColor: AppColors.gery455,
                titleSize: 18.sp,
                titleFontWeight: FontWeight.w500,
                textDecoration: isUnderLine?TextDecoration.underline:TextDecoration.none,
              ),
            ),
          )
        ],
      ),
    );
  }
}
