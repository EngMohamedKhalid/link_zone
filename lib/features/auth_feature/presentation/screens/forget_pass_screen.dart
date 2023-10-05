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
import '../../../../app/widgets/text_button_widget.dart';
import '../../../../app/widgets/text_widget.dart';
import '../presentation_logic_holder/auth_cubit.dart';

class ForgetPassScreen extends StatefulWidget {
  const ForgetPassScreen({super.key,});
  @override
  State<ForgetPassScreen> createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const DefaultAppBarWidget(title: "",),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          physics:const BouncingScrollPhysics(),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                ImageWidget(
                    imageUrl: AppAssets.forgetPass,
                  height: 285.w,
                  width: 285.h,
                ),
                32.verticalSpace,
                TextWidget(
                    title: "ForgotPassword".tr(),
                  titleSize: 24.sp,
                  titleFontWeight: FontWeight.w600,
                  titleColor: AppColors.black3333,
                ),
                12.verticalSpace,
                TextWidget(
                  title: "associated".tr(),
                  titleSize: 16.sp,
                  titleFontWeight: FontWeight.w500,
                  titleColor: AppColors.hint,
                ),
                32.verticalSpace,
                CustomFormField(
                  header: "MobileNumber".tr(),
                  hint: "EnterMobile".tr(),
                  //controller: AuthCubit.get(context).forgetPhoneController,
                  keyboardType: TextInputType.phone,
                  prefixIcon: Icons.phone_android_sharp,
                ),
                32.verticalSpace,
                BlocBuilder<AuthCubit, AuthStates>(
                  builder: (context, state) {
                    return ButtonWidget(
                      loading: state is ForgetPasswordLoadingState,
                                  onPressed: (){

                                    if(formKey.currentState!.validate()&&AuthCubit.get(context).signUpEmailController.text.length==11){
                                   //   AuthCubit.get(context).forgetPassword();
                                    }else{
                                      showToast(msg: "wrongNumber".tr(),backgroundColor: AppColors.red,textColor: AppColors.white);
                                    }
                                  },
                                  text: "Submit".tr(),
                                );
                  },
                ),
                40.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(
                        title: "Back".tr(),
                      titleSize: 19.sp,
                      titleFontWeight: FontWeight.w500,
                    ),
                    CustomTextButton(
                      title: "SignIn".tr(),
                      titleSize: 21.sp,
                      titleFontWeight: FontWeight.w600,
                      titleColor: AppColors.gery455,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
