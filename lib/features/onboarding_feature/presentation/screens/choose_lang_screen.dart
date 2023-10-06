import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/app_fonts.dart';
import '../../../../app/utils/helper.dart';
import '../../../../app/utils/language_manager.dart';
import '../../../../app/widgets/button_widget.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../../app/widgets/text_widget.dart';
import 'onboarding_screen.dart';

class ChooseLangScreen extends StatefulWidget {
  const ChooseLangScreen({super.key});

  @override
  State<ChooseLangScreen> createState() => _ChooseLangScreenState();
}

class _ChooseLangScreenState extends State<ChooseLangScreen> {
  double _opacity =0;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100),(){
      setState(() {
        _opacity=1;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor:  AppColors.white,
        ),
      ),
      body: Center(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: "logo",
                child: Column(
                  children: [
                    ImageWidget(
                        imageUrl: "assets/images/app_logo.png",
                      width: 200.w,
                      height: 200.h,
                    )
                  ],
                ),
              ),
              AnimatedOpacity(
                opacity: _opacity,
                duration:const Duration(milliseconds: 1500),
                child: Column(
                  children: [
                    TextWidget(
                      title: """Select Langauge\nاختر اللغة""",
                      titleSize: 20.sp,
                      titleFontWeight: FontWeight.w600,
                      fontFamily: AppFonts.bold,
                      titleColor: AppColors.mainColor,
                    ),
                    24.verticalSpace,
                    ButtonWidget(
                      onPressed: (){
                        if(context.locale==arabic_local) {
                          context.setLocale(english_local);
                        }
                        navigateTo(const OnBoardingScreen());
                      },
                      text:"English",
                      color: AppColors.mainColor,
                      textColor: AppColors.white,
                      fontFamily: AppFonts.bold,
                    ),
                    15.verticalSpace,
                    ButtonWidget(
                      onPressed: (){
                        if(context.locale==english_local) {
                          context.setLocale(arabic_local);
                        }
                        navigateTo(const OnBoardingScreen());
                      },
                      text: "العربيه",
                      color: AppColors.mainColor,
                      textColor: AppColors.white,
                      textSize: 20.sp,
                      fontFamily: AppFonts.bold,
                    ),
                  ],
                ),
              ),
              44.verticalSpace,
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(bottom:60.h),
        child: TextWidget(
          title:"Version 1.0",
          titleSize: 18.sp,
          titleFontWeight: FontWeight.w400,
          fontFamily: AppFonts.regular,
          titleColor: AppColors.white,
        ),
      ),
    );
  }
}
