import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../app/utils/app_colors.dart';
import '../../../../../app/utils/app_fonts.dart';
import '../../../../../app/widgets/image_widget.dart';
import '../../../../../app/widgets/text_widget.dart';
import '../../data/models/onboard_model.dart';


class CustomOnBoardBody extends StatelessWidget {
  const CustomOnBoardBody({super.key, required this.onBoardModel});
  final OnBoardModel onBoardModel;
  @override
  Widget build(BuildContext context) {
    return    Column(
      children: [
        90.verticalSpace,
        ImageWidget(
          imageUrl: onBoardModel.image,
          width: 231.w,
          height: 231.h,
          //color: AppColors.mainColor,
        ),
        64.verticalSpace,
        TextWidget(
          title: onBoardModel.title1.tr(),
          //"We provide the best \n wholesale offers",
          titleSize: 24.sp,
          titleFontWeight: FontWeight.w800,
          fontFamily: AppFonts.regular,
          titleColor: AppColors.black,
        ),
        17.verticalSpace,
        TextWidget(
          title: onBoardModel.title2.tr(),
          //"Lorem Ipsum has been the industry's standard dummy text  1500s,an unknown ",
          titleSize: 14.sp,
          titleAlign: TextAlign.center,
          titleFontWeight: FontWeight.w400,
          fontFamily: AppFonts.regular,
          titleColor: AppColors.hint,
        ),
      ],
    );
  }
}