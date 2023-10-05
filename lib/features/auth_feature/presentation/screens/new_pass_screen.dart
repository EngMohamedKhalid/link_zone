
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/widgets/button_widget.dart';
import '../../../../app/widgets/custom_form_field.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';
import '../../../../app/widgets/flutter_toast.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../../app/widgets/text_widget.dart';
import '../presentation_logic_holder/auth_cubit.dart';

class NewPassScreen extends StatefulWidget {
  const NewPassScreen({super.key});

  @override
  State<NewPassScreen> createState() => _NewPassScreenState();
}

class _NewPassScreenState extends State<NewPassScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthStates>(
      builder: (ctx, state) {
        var cubit = AuthCubit.get(context);
        return Scaffold(
          appBar:const DefaultAppBarWidget(title: "",),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.w),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    ImageWidget(
                        imageUrl: AppAssets.forgetPass,
                      width: 284.w,
                      height: 284.h,
                    ),
                    32.verticalSpace,
                    TextWidget(
                      title: "ResetPassword".tr(),
                      titleSize: 24.sp,
                      titleFontWeight: FontWeight.w600,
                      titleColor: AppColors.black3333,
                    ),
                    SizedBox(height:12.h ,),
                    TextWidget(
                      title: "8characters".tr(),
                      titleSize: 16.sp,
                      titleFontWeight: FontWeight.w500,
                      titleColor: AppColors.hint,
                    ),
                    32.verticalSpace,
                    CustomFormField(
                      header: "NewPassword".tr(),
                      hint: "EnterNewPassword".tr(),
                     // controller: cubit.resetPasswordController,
                      prefixIcon: Icons.lock_outline_sharp,
                      suffixIcon: cubit.passObscure == false
                          ? Icons.visibility
                          : Icons.visibility_off,
                      obscure: cubit.passObscure,
                      iconPressed: () {
                        cubit.changeVisible();
                      },
                    ),
                    16.verticalSpace,
                    CustomFormField(
                      header: "ReEnterNewPassword".tr(),
                      hint: "ReEnterNewPassword".tr(),
                     // controller: cubit.resetPasswordConfirmationController,
                      prefixIcon: Icons.lock_outline_sharp,
                      suffixIcon: cubit.passObscure == false
                          ? Icons.visibility
                          : Icons.visibility_off,
                      obscure: cubit.passObscure,
                      iconPressed: () {
                        cubit.changeVisible();
                      },
                    ),
                    32.verticalSpace,
                    ButtonWidget(
                      text: "ResetPassword".tr(),
                      loading:  state is ResetPasswordLoadingState,
                      onPressed: () {
                        if (formKey.currentState!.validate() &&cubit.signUpEmailController.text.length >=8&&
                            cubit.signUpEmailController.text==cubit.signUpEmailController.text) {
                         //cubit.resetPassword();
                        }else{
                          showToast(
                              msg: "condition".tr(),
                              backgroundColor: AppColors.red,
                              textColor: AppColors.white,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
