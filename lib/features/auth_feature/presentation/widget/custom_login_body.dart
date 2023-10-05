import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/helper.dart';
import '../../../../app/widgets/button_widget.dart';
import '../../../../app/widgets/custom_form_field.dart';
import '../../../../app/widgets/text_button_widget.dart';
import '../presentation_logic_holder/auth_cubit.dart';
import '../screens/forget_pass_screen.dart';


class LoginCustomBody extends StatefulWidget {
  final bool fromCheckOut;
 const LoginCustomBody({super.key, this.fromCheckOut=false});

  @override
  State<LoginCustomBody> createState() => _LoginCustomBodyState();
}

class _LoginCustomBodyState extends State<LoginCustomBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthStates>(
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                24.verticalSpace,
                CustomFormField(
                  header: "Email".tr(),
                  hint: "EnterEmail".tr(),
                controller: cubit.loginEmailController,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icons.phone_android_sharp,
                ),
                12.verticalSpace,
                CustomFormField(
                  header: "Password".tr(),
                  hint: "EnterPassword".tr(),
                  controller: cubit.loginPasswordController,
                  prefixIcon: Icons.lock_outline_sharp,
                  suffixIcon: cubit.passObscure==false?Icons.visibility:Icons.visibility_off,
                  obscure: cubit.passObscure,
                  iconPressed: () {
                    cubit.changeVisible();
                  },
                ),
                24.verticalSpace,
                CustomTextButton(
                  title: "ForgotPassword".tr(),
                  titleColor: AppColors.gery455,
                  onPressed: () {
                    navigateTo(ForgetPassScreen());
                  },
                ),
                16.verticalSpace,
                ButtonWidget(
                  text: "SignIn".tr(),
                  loading: state is LoadingState,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                     cubit.login();
                    }
                  },
                ),
                16.verticalSpace,
                Align(
                  alignment: Alignment.center,
                  child: CustomTextButton(
                    titleSize: 22.sp,
                    titleFontWeight: FontWeight.bold,
                    onPressed: () {
                     // navigateTo(const BNBScreen(),replace: true);
                    },
                  ),
                ),
                100.verticalSpace


              ],
            ),
          ),
        );
      },
    );
  }
}