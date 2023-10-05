import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';
import '../../../../app/widgets/text_widget.dart';
class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBarWidget(
        actionsOnPressed: () {
          //navigateTo(const NotificationScreen());
        },
        actions: true,
        titleWidget: TextWidget(
          title: "Chat Screen",
          titleFontWeight: FontWeight.w400,
          titleSize: 20.sp,
          titleColor: AppColors.gery455,
        ),
      ),
    );
  }
}
