import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../app/services/cache_service.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/app_fonts.dart';
import '../../../../app/utils/helper.dart';
import '../../../../app/utils/language_manager.dart';
import '../../../../app/widgets/button_widget.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../../app/widgets/text_button_widget.dart';
import '../../../../app/widgets/text_widget.dart';
import '../../../auth_feature/presentation/screens/auth_screen.dart';
import '../../data/models/onboard_model.dart';
import '../widgets/custom_body.dart';
import 'onboarding_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController controller = PageController();
  List<OnBoardModel> list = [
    OnBoardModel(
      image: "assets/images/onboard2.jpeg",
      title1: "onboard1",
      title2: "onboardSub",
    ),
    OnBoardModel(
      image: "assets/images/onboard1.jpeg",
      title1: "onboard2",
      title2: "onboardSub".tr(),
    )
  ];
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if(controller.page==1) {
        controller.previousPage(duration: const Duration(milliseconds: 500), curve: Curves.ease);
      }
      else{
        controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.ease);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: DefaultAppBarWidget(
        leading: Icon(
          Icons.arrow_back_ios,
          size: 28.sp,
          color: AppColors.gery455,
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: PageView.builder(
                controller: controller,
                itemCount: list.length,
                itemBuilder:(context, index) {
                  return CustomOnBoardBody(onBoardModel: list[index]);
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  82.verticalSpace,
                  SmoothPageIndicator(
                    controller: controller,
                    count: list.length,
                    //models.length,
                    effect:const ExpandingDotsEffect(
                        activeDotColor: AppColors.mainColor,
                        dotColor:  Color(0xffD9D9D9),
                        radius: 10,
                        spacing: 7,
                        expansionFactor: 3,
                        dotHeight: 10,
                        dotWidth: 10
                    ),
                  ),
                  25.verticalSpace,
                  ButtonWidget(
                    onPressed: () {
                      CacheService().setOnBoarding().then((value) {
                        navigateTo(const AuthScreen(),replace: true)
                        ;});
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidget(
                          title: "StartNow".tr(),
                          titleSize: 18.sp,
                          titleFontWeight: FontWeight.w700,
                          fontFamily: AppFonts.regular,
                          titleColor: AppColors.white,
                        ),
                        5.horizontalSpace,
                        Icon(
                          Icons.arrow_forward,
                          size: 24.sp,
                          color: AppColors.white,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}