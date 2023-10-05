import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../app/services/cache_service.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/app_fonts.dart';
import '../../../../app/utils/get_it_injection.dart';
import '../../../../app/utils/helper.dart';
import '../../../../app/utils/language_manager.dart';
import '../../../../app/widgets/button_widget.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../../app/widgets/text_button_widget.dart';
import '../../../../app/widgets/text_widget.dart';
import '../../../auth_feature/presentation/screens/auth_screen.dart';
import '../../../bottom_navigation_feature/presentation/screens/bottom_navigation_screen.dart';
import '../../data/models/onboard_model.dart';
import '../widgets/custom_body.dart';
import 'choose_lang_screen.dart';
import 'onboarding_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
   Future.delayed(const Duration(seconds: 2),(){
     late Widget widget ;
     if(getIt<CacheService>().getOnBoarding()!=null){
       if(FirebaseAuth.instance.currentUser != null ){
         widget = const BNBScreen();
       }else{
         widget = const AuthScreen();
       }
     }else{
       widget = const ChooseLangScreen();
     }
     navigateTo(widget,removeAll: true);
   });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor:  AppColors.mainColor,
        ),
      ),
      body: Center(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.w),
          child: Hero(
            tag: "logo",
            child: TextWidget(
              title:"Link Zone",
              titleSize: 20.sp,
              titleFontWeight: FontWeight.w600,
              fontFamily: AppFonts.regular,
              titleColor: AppColors.white,
            ),
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
