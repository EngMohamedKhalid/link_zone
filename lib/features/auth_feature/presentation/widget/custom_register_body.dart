import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../app/utils/helper.dart';
import '../../../../app/widgets/button_widget.dart';
import '../../../../app/widgets/custom_drop_down.dart';
import '../../../../app/widgets/custom_form_field.dart';
import '../../../../app/widgets/text_button_widget.dart';
import '../presentation_logic_holder/auth_cubit.dart';
import '../screens/otp_screen.dart';

class RegisterCustomBody extends StatefulWidget {
  const RegisterCustomBody({super.key, this.fromCheckOut=false});
  final bool fromCheckOut;
  @override
  State<RegisterCustomBody> createState() => _RegisterCustomBodyState();
}
GlobalKey<FormState> formKey = GlobalKey<FormState>();

class _RegisterCustomBodyState extends State<RegisterCustomBody> {
  List<String> jobs=["Full Time","Part Time"];
  List<String> accounts=["Individual","Project Creator"];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthStates>(
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return  SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                24.verticalSpace,
                CustomFormField(
                  header: "FullName".tr(),
                  hint: "EnterFullName".tr(),
                  controller:cubit.signUpFullNameController,
                  prefixIcon: Icons.person,
                ),
                16.verticalSpace,
                CustomFormField(
                  header: "MobileNumber".tr(),
                  hint: "EnterMobile".tr(),
                  controller: cubit.signUpPhoneController,
                  prefixIcon: Icons.phone_android_sharp,
                  keyboardType: TextInputType.phone,
                ),
                16.verticalSpace,
                CustomFormField(
                  header: "Email".tr(),
                  hint: "EnterEmail".tr(),
                  controller: cubit.signUpEmailController,
                  prefixIcon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                ),
                16.verticalSpace,
                CustomFormField(
                  header: "Password".tr(),
                  hint: "EnterPassword".tr(),
                 controller: cubit.signUpPasswordController,
                  prefixIcon: Icons.lock_outline_sharp,
                  suffixIcon:cubit.passObscure==false?Icons.visibility:Icons.visibility_off,
                  obscure:cubit.passObscure,
                  iconPressed: () {
                    cubit.changeVisible();
                  },
                ),
                16.verticalSpace,
                CustomFormField(
                  header: "GitHub",
                  hint: "GitHub url",
                  controller: cubit.githubLink,
                  prefixIcon: Icons.link,
                ),
                16.verticalSpace,
                CustomFormField(
                  header: "Interested",
                  hint: "type your Interested",
                  controller: cubit.interested,
                  prefixIcon: Icons.interests,
                ),
                16.verticalSpace,
                CustomFormField(
                  header: "Skills",
                  hint: "type your Skills",
                  controller: cubit.skills,
                  prefixIcon: Icons.grid_view,
                ),
                16.verticalSpace,
                CustomFormField(
                  header: "Current Job",
                  hint: "your Current Job",
                  controller: cubit.job,
                  prefixIcon: Icons.work,
                ),
                16.verticalSpace,
                CustomDropDown(
                  onItemChanged: (val){
                    setState(() {
                     cubit.jobType = val;
                    });
                  },
                  items:jobs ,
                  dropDownHint: cubit.jobType??"Work Type",
                  headLine: "Work Type",
                ),
                16.verticalSpace,
                CustomDropDown(
                  onItemChanged: (val){
                    setState(() {
                      cubit.accountType = val;
                    });
                  },
                  items:accounts ,
                  dropDownHint: cubit.accountType??"Account Type",
                  headLine: "Account Type",
                ),
                32.verticalSpace,
                ButtonWidget(
                  text: "SignUp".tr(),
                  loading: state is LoadingState,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                     cubit.register();
                    }
                  },
                ),
                25.verticalSpace,
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
                100.verticalSpace,

              ],
            ),
          ),
        );
      },

    );
  }
}