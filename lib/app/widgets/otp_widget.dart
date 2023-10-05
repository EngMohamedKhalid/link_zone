import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../utils/app_colors.dart';

class OtpWidget extends StatelessWidget {
  final void Function(String)? onCompleted;
  final int length;
  final TextEditingController? controller;
  const OtpWidget({
    this.onCompleted,
    this.length =4,
    this.controller,
    super.key});

  @override
  Widget build(BuildContext context) {
    return  Pinput(
      controller:controller ,
      length: length,
      onCompleted: onCompleted,
      defaultPinTheme: PinTheme(
        width: 75.w,
        height: 75.w,
        textStyle: TextStyle(
          fontSize: 36.sp,
          color: AppColors.black3333,
          fontWeight: FontWeight.w700,
          // fontFamily: fontRegular,
        ),
        decoration: BoxDecoration(
          color: Color(0xffF8F8F8),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      focusedPinTheme: PinTheme(
        width: 75.w,
        height: 75.w,
        textStyle: TextStyle(
          fontSize: 36.sp,
          color: AppColors.black3333,
          fontWeight: FontWeight.w700,
          // fontFamily: fontRegular,
        ),
        decoration: BoxDecoration(
          color: Color(0xffF8F8F8),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.white,),
        ),
      ),
    );
  }
}
