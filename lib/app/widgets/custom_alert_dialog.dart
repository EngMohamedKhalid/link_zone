import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_zone/app/widgets/text_widget.dart';
import '../../app/utils/app_colors.dart';
import '../../app/utils/app_strings.dart';
import '../../app/utils/get_it_injection.dart';
import '../../app/utils/helper.dart';
import '../../app/utils/navigation_helper.dart';
import 'button_widget.dart';

globalAlertDialogue(String title1,
    {
      String? title2,
      VoidCallback? onCancel,
      VoidCallback? onOk,
      String ?buttonText,
      String ?buttonText2,
      IconData? iconData,
      Color? iconDataColor,
      Color? iconBackColor,
      bool canCancel = false,
    }) {
  showDialog(
    context: getIt<NavHelper>().navigatorKey.currentState!.context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return  SizedBox(
        height: 250,
        width: 450.w,
        child: AlertDialog(
          contentPadding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 16),
          insetPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          alignment: Alignment.center,
          backgroundColor: Colors.white,
          title: Container(
            width: 72.w,
            height: 72.h,
            decoration: BoxDecoration(
              color:iconBackColor?? const Color(0xffFDEEEE) ,
              shape: BoxShape.circle
            ),
            child: Center(
              child: Icon(
                iconData??Icons.info,
                color: iconDataColor??AppColors.red,
                size: 35,
              ),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title1,
                textAlign: TextAlign.center,
                style: TextStyle(
                    // color: AppColors.blue,
                    fontSize: 20.sp,
                ),
              ),
              title2==null?const SizedBox():Text(
                title2,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: AppColors.green,
                    fontSize: 18.sp,
                  fontFamily: fontRegular,
                ),
              ),
              const SizedBox(height: 24,),
              canCancel?
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ButtonWidget(
                      onPressed: onCancel?? () {
                        Navigator.pop(context);
                      },
                      border: Border.all(color: AppColors.black),
                      color: AppColors.white,
                      outlined: false,
                      child: Center(
                        child: Text(
                          buttonText??AppStrings.ok,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColors.black,
                              fontSize: 18.sp
                          ),
                        ),
                      ),
                    ),
                  ),
                  10.horizontalSpace,
                  Expanded(
                    child: ButtonWidget(
                      onPressed: onOk?? () {
                        Navigator.pop(context);
                      },
                      color: Color(0xffEB5757),
                      child: Center(
                        child: Text(
                          buttonText2??AppStrings.ok,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColors.white,
                              fontSize: 18.sp
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
                  :
              ButtonWidget(
                onPressed: onOk?? () {
                      Navigator.pop(context);
                    },
                child: Center(
                  child: Text(
                    buttonText??AppStrings.ok,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 18.sp
                    ),
              ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

globalAlertDialogueWithDuration(String title1,
    {
      String? title2,
      IconData? iconData,
      int? seconds,
      required VoidCallback onOk,
    }) {
  showDialog(
    context: getIt<NavHelper>().navigatorKey.currentState!.context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return  SizedBox(
        height: 336.h,
        width: 348.w,
        child: AlertDialog(
          contentPadding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 16),
          // insetPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          alignment: Alignment.center,
          backgroundColor: AppColors.white,
          title: Center(
            child: Icon(
              iconData??Icons.check_circle,
              color: AppColors.green,
              size: 46,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextWidget(
                title: title1,
                titleSize: 24.sp,
                titleAlign: TextAlign.center,
                titleFontWeight: FontWeight.w600,
              ),
              Text(
                title2??"",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.green,
                  fontSize: 18.sp,
                  fontFamily: fontRegular,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
  Future.delayed(Duration(seconds:seconds??2),(){
   onOk();
  });
}
