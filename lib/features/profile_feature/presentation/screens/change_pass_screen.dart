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
import '../../../auth_feature/presentation/presentation_logic_holder/auth_cubit.dart';
import '../presentation_logic_holder/cubit/profile_cubit.dart';

class ChangePassScreen extends StatefulWidget {
  const ChangePassScreen({super.key});

  @override
  State<ChangePassScreen> createState() => _ChangePassScreenState();
}

class _ChangePassScreenState extends State<ChangePassScreen> {
  final passwordConfirmation = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return
      BlocBuilder<ProfileCubit, ProfileState>(
      builder: (ctx, state) {
        var cubit = ProfileCubit.get(context);
        return Scaffold(
          backgroundColor: AppColors.white,
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
                    16.verticalSpace,
                    TextWidget(
                      title: "ChangePassword".tr(),
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
                      header: "CurrentPassword".tr(),
                      hint: "EnterYourCurrentPassword".tr(),
                      controller: AuthCubit.get(context).currentPasswordController,
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
                      header: "NewPassword".tr(),
                      hint: "EnterNewPassword".tr(),
                      controller: AuthCubit.get(context).newPasswordController,
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
                      controller: passwordConfirmation,
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
                      text: "ChangePassword".tr(),
                      loading:  state is UpdatePasswordLoading,
                      onPressed: () {
                        if (formKey.currentState!.validate() && AuthCubit.get(context).currentPasswordController.text==passwordConfirmation.text) {
                          AuthCubit.get(context).changePassword();
                        }else{
                          showToast(msg: "Password doesn't match");
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
