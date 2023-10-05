
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../app/services/cache_service.dart';
import '../../../../app/services/image_picker_service/image_picker_service.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/app_fonts.dart';
import '../../../../app/utils/get_it_injection.dart';
import '../../../../app/utils/helper.dart';
import '../../../../app/widgets/custom_alert_dialog.dart';
import '../../../../app/widgets/custom_form_field.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';
import '../../../../app/widgets/loading.dart';
import '../../../../app/widgets/text_button_widget.dart';
import '../../../../app/widgets/text_widget.dart';
import '../../../auth_feature/domain/usecases/update_profile_use_case.dart';
import '../../../auth_feature/presentation/presentation_logic_holder/auth_cubit.dart';
import '../presentation_logic_holder/cubit/profile_cubit.dart';
import '../widgets/custom_edit_button.dart';
import '../widgets/custom_sheet_profile.dart';
import 'change_pass_screen.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  XFile? userImage;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AuthCubit.get(context).updateProfileNameController.text=getIt<CacheService>().getUserData()?.name??"";
    AuthCubit.get(context).updateProfilePhoneController.text=getIt<CacheService>().getUserData()?.phone??"";
    AuthCubit.get(context).updateProfileEmailController.text=getIt<CacheService>().getUserData()?.email??"";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: DefaultAppBarWidget(
          canBack: true,
          title: "PersonalInformation".tr(),
        ),
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            return state is UpdateProfileLoading?Loading():
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.all(16),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    40.verticalSpace,
                    CustomFormField(
                      controller: AuthCubit.get(context).updateProfileNameController,
                      header: "FullName".tr(),
                      filled: true,
                      suffixIconWidget:CustomEditButton(
                        onPressed: () {
                          showSheet(context: context, controller: AuthCubit.get(context).updateProfileNameController,
                              onSave: (){
                                goBack();
                                if(AuthCubit.get(context).updateProfileNameController.text.isNotEmpty){
                                  AuthCubit.get(context).updateProfile();
                                }
                              }
                          );
                        },
                      ),
                      fillColor: Colors.white,
                      prefixIcon: Icons.person_outline_outlined,
                      hint: "EnterFullName".tr(),
                    ),
                    16.verticalSpace,
                    CustomFormField(
                      controller:  AuthCubit.get(context).updateProfilePhoneController,
                      header: "MobileNumber".tr(),
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icons.phone_android,
                      suffixIconWidget:CustomEditButton(
                        onPressed: () {
                          showSheet(context: context, controller:  AuthCubit.get(context).updateProfilePhoneController,
                              onSave: (){
                                goBack();
                                if( AuthCubit.get(context).updateProfilePhoneController.text.isNotEmpty){
                                  AuthCubit.get(context).updateProfile();
                                }
                              }
                          );
                        },
                      ),
                      hint: "EnterMobile".tr(),
                    ),
                    16.verticalSpace,
                    CustomFormField(
                      controller: AuthCubit.get(context).updateProfileEmailController,
                      header: "Email".tr(),
                      filled: true,
                      fillColor: Colors.white,
                      suffixIconWidget:CustomEditButton(
                        onPressed: () {
                          showSheet(context: context, controller: AuthCubit.get(context).updateProfileEmailController,
                              onSave: (){
                                goBack();
                                if(AuthCubit.get(context).updateProfileEmailController.text.isNotEmpty){
                                  AuthCubit.get(context).updateProfile();
                                }
                              });
                        },
                      ),
                      prefixIcon: Icons.email_outlined,
                      hint: "EnterEmail".tr(),
                    ),
                    32.verticalSpace,
                    Row(
                      children: [
                        CustomTextButton(
                          onPressed: () {
                            navigateTo(const ChangePassScreen());
                          },
                          title: "ChangePassword".tr(),
                          titleColor: AppColors.gery455,
                          titleSize: 19.sp,
                          titleFontWeight: FontWeight.w600,
                        ),
                        Icon(
                          Icons.arrow_forward_rounded,
                          size: 18.sp,
                          color: AppColors.gery455,
                        )
                      ],
                    ),
                    32.verticalSpace,
                    // Row(
                    //   children: [
                    //     CustomTextButton(
                    //       //TODO implement delete account
                    //       onPressed: () {},
                    //       title: "DeleteAccount".tr(),
                    //       titleColor: AppColors.red,
                    //       titleSize: 19.sp,
                    //       titleFontWeight: FontWeight.w600,
                    //     ),
                    //     Icon(
                    //       Icons.arrow_forward_rounded,
                    //       size: 18.sp,
                    //       color: AppColors.red,
                    //     )
                    //   ],
                    // ),
                  ],
                ),
              ),
            );
          },
        )
    );
  }
}
