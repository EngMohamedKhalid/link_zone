import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/app_fonts.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../../app/widgets/text_widget.dart';
import '../widget/custom_login_body.dart';
import '../widget/custom_register_body.dart';

class AuthScreen extends StatefulWidget {
  final bool fromCheckout;
  const AuthScreen({super.key, this.fromCheckout = false});
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}
class _AuthScreenState extends State<AuthScreen> with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar color
            statusBarColor: AppColors.white,
            statusBarIconBrightness: Brightness.dark
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            64.verticalSpace,
            TextWidget(
              title: "welcomeTo".tr(),
              titleSize: 28.sp,
              titleColor: AppColors.black3333,
              titleFontWeight: FontWeight.w600,
            ),
            8.verticalSpace,
            TextWidget(
              title:"Link Zone",
              titleSize: 30.sp,
              titleFontWeight: FontWeight.w600,
              fontFamily: AppFonts.bold,
              titleColor: AppColors.mainColor,
            ),
            16.verticalSpace,
            TextWidget(
              title: "WeHappy".tr(),
              titleSize: 20.sp,
              titleColor: AppColors.hint,
              titleFontWeight: FontWeight.w500,
            ),
            32.verticalSpace,
            Expanded(child: LoginCustomBody(fromCheckOut: widget.fromCheckout,)),
          ],
        ),
      ),
    );
  }
}