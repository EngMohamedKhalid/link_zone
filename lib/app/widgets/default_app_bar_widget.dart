import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';
import '../utils/app_fonts.dart';
import 'text_widget.dart';

class DefaultAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String? title;
  final bool actions;
  final bool notify;
  final Widget? leading;
  final Widget? titleWidget;
  final VoidCallback? onPop;
  final VoidCallback? actionsOnPressed;
  final bool canBack;
  final double? leadingWidth;
  final List<Widget>? actionsWidgets;

  const DefaultAppBarWidget(
      {this.title,
      this.actions = false,
      Key? key,
      this.onPop,
      this.canBack = true, this.leading,  this.notify=true, this.actionsOnPressed, this.titleWidget,
        this.leadingWidth,
        this.actionsWidgets,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: canBack
          ? IconButton(
              onPressed: onPop ??
                  () {
                    Navigator.pop(context);
                  },
              icon: Container(
                width: 45.w,
                height: 45.w,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.white,
                      width: 1,
                    )),
                child:leading?? Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color:const Color(0xff455A64),
                  size: 20.sp,
                ),
              ),
            )
          : null,
      title: titleWidget?? TextWidget(
        title: title??"",
        fontFamily: AppFonts.bold,
        titleSize: 18.sp,
          titleColor: AppColors.gery455
      ),
      actions: actions
          ? [
             Container(
               width: 48.w,
               height: 48.h,
               margin: EdgeInsetsDirectional.symmetric(vertical: 5.h,horizontal: 14.w),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(16.r),
                 color: AppColors.gery455.withOpacity(.05)
               ),
               child:
               notify?
               Stack(
                 alignment: Alignment.topRight,
                 children: [
                   IconButton(
                       onPressed:actionsOnPressed?? (){},
                       icon: Icon(
                         Icons.notifications,
                         color: AppColors.gery455,
                         size: 30.sp,
                       ),
                   ),
                   Positioned(
                     right: 10.w,
                     top: 10.h,
                     child: CircleAvatar(
                       radius: 4.r,
                       backgroundColor: AppColors.red,
                     ),
                   )
                 ],
               )
                   :
               IconButton(
                 onPressed:actionsOnPressed?? (){},
                 icon: Icon(
                   Icons.notifications,
                   color: AppColors.gery455,
                   size: 30.sp,
                 ),
               ),
             )
            ]
          : actionsWidgets,
      leadingWidth:leadingWidth ,

    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(500, 56);
}
