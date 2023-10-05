import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/widgets/button_widget.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../../app/widgets/otp_widget.dart';
import '../../../../app/widgets/text_button_widget.dart';
import '../../../../app/widgets/text_widget.dart';
import '../presentation_logic_holder/auth_cubit.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key,this.toActivate = false});

  final bool toActivate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBarWidget(title: "",),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              ImageWidget(
                imageUrl: AppAssets.otp,
                width: 245.w,
                height: 245.w,
              ),
              24.verticalSpace,
              TextWidget(
                title: "VerificationCode".tr(),
                titleFontWeight: FontWeight.w600,
                titleSize: 24.sp,
                titleColor: AppColors.black3333,
              ),
              12.verticalSpace,
              TextWidget(
                title: "codeSent".tr(),
                titleFontWeight: FontWeight.w500,
                titleSize: 16.sp,
                titleColor: AppColors.hint,
              ),
              37.verticalSpace,
              OtpWidget(
                //controller: AuthCubit.get(context).codeController,
                onCompleted: (pin) {
                  // toActivate?AuthCubit.get(context).activateAccount():
                  // AuthCubit.get(context).verifyOtp();
                },
              ),
              32.verticalSpace,
              BlocBuilder<AuthCubit, AuthStates>(
                builder: (context, state) {
                  return ButtonWidget(
                    text: "Verify".tr(),
                    textSize: 18.sp,
                    loading: state is VerifyLoadingState,
                    onPressed: () {
                      // toActivate?AuthCubit.get(context).activateAccount():
                      // AuthCubit.get(context).verifyOtp();
                    },
                  );
                },
              ),
              40.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget(
                    title: "Didn'tReceive".tr(),
                    titleFontWeight: FontWeight.w500,
                    titleSize: 16.sp,
                    titleColor: AppColors.field,
                  ),
                  CustomTextButton(
                    title: "ResendCode".tr(),
                    titleSize: 16.sp,
                    titleFontWeight: FontWeight.w600,
                    onPressed: () {

                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
