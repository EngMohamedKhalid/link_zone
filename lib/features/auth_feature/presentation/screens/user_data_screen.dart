import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_zone/app/widgets/default_app_bar_widget.dart';
import 'package:link_zone/app/widgets/text_widget.dart';
import 'package:link_zone/features/auth_feature/presentation/presentation_logic_holder/auth_cubit.dart';

import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/app_fonts.dart';
import '../../../../app/utils/helper.dart';
import '../../../../app/widgets/button_widget.dart';
import '../../../../app/widgets/custom_drop_down.dart';
import '../../../../app/widgets/custom_form_field.dart';

class UserDataScreen extends StatefulWidget {
  const UserDataScreen({super.key});

  @override
  State<UserDataScreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  List<String> jobs = ["Full Time", "Part Time"];
  List<String> accounts = ["Individual", "Creator"];
  List<String> Interests = ['Frontend Development', 'Software Development','Internet of Things', "Space", "Earth", "Science", 'Firmware Development', 'Artificial Intelligence', 'User Experience Design', 'Big Data',];
  List<String> workExperience = ["+1 Years","+2 Years","+3 Years","+4 Years","+5 Years","+7 Years","+8 Years","+10 Years"];
//['Machine Learning', 'C++', 'webDevelopment', 'databaseManagement', 'Java', 'dataAnalysis', 'Python']
  bool machineLearning= false;
  bool cPlus = false;
  bool webDevelopment = false;
  bool databaseManagement = false;
  bool java = false;
  bool dataAnalysis = false;
  bool python = false;
  List <String> skills  = [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthStates>(
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: DefaultAppBarWidget(
            title: "Skills",
            elevetion:.175,
            colorBack: AppColors.white,
          ),
          body: ListView(
            padding: EdgeInsets.all(16.sp),
            children: [
              CustomDropDown(
                onItemChanged: (val) {
                  setState(() {
                    cubit.jobType = val;
                  });
                },
                items: jobs,
                dropDownHint: cubit.jobType ?? "Availability",
                headLine: "Availability",
              ),
              16.verticalSpace,
              CustomDropDown(
                onItemChanged: (val) {
                  setState(() {
                    cubit.accountType = val;
                  });
                },
                items: accounts,
                dropDownHint: cubit.accountType ?? "Account Type",
                headLine: "Account Type",
              ),
              16.verticalSpace,
              CustomDropDown(
                onItemChanged: (val) {
                  setState(() {
                    cubit.Interests = val;
                  });
                },
                items: Interests,
                dropDownHint: cubit.Interests ?? "Interests",
                headLine: "Interests",
              ),
              16.verticalSpace,
              CustomDropDown(
                onItemChanged: (val) {
                  setState(() {
                    cubit.workExperience = val;
                  });
                },
                items: workExperience,
                dropDownHint: cubit.workExperience ?? "Work Experience",
                headLine: "Work Experience",
              ),
              16.verticalSpace,
              TextWidget(
                  title: "Skills",
                titleFontWeight: FontWeight.bold,
                titleColor: AppColors.black3333,
                titleAlign: TextAlign.start,
                titleSize: 18.sp,
              ),
              16.verticalSpace,
              Row(
                children: [
                  Checkbox(
                    value: machineLearning,
                    activeColor: AppColors.mainColor,
                    onChanged: (val) {
                      if(val == true){
                        skills.add("Machine Learning");
                        print(skills);
                      }
                      setState(() {
                        machineLearning=!machineLearning;
                      });
                    },
                  ),
                  TextWidget(
                      title: "Machine Learning",
                      fontFamily: AppFonts.bold,
                      titleSize: 16.sp,
                      titleColor: AppColors.black
                  )
                ],
              ),
              16.verticalSpace,
              Row(
                children: [
                  Checkbox(
                    value: cPlus,
                    activeColor: AppColors.mainColor,
                    onChanged: (val) {
                      if(val == true){
                        skills.add("C++");
                        print(skills);
                      }
                      setState(() {
                        cPlus=!cPlus;
                      });
                    },
                  ),
                  TextWidget(
                      title: "C++",
                      fontFamily: AppFonts.bold,
                      titleSize: 16.sp,
                      titleColor: AppColors.black
                  )
                ],
              ),
              16.verticalSpace,
              Row(
                children: [
                  Checkbox(
                    value: webDevelopment,
                    activeColor: AppColors.mainColor,
                    onChanged: (val) {
                      if(val == true){
                        skills.add("Web Development");
                        print(skills);
                      }
                      setState(() {
                        webDevelopment=!webDevelopment;
                      });
                    },
                  ),
                  TextWidget(
                      title: "Web Development",
                      fontFamily: AppFonts.bold,
                      titleSize: 16.sp,
                      titleColor: AppColors.black
                  )
                ],
              ),
              16.verticalSpace,
              Row(
                children: [
                  Checkbox(
                    value: databaseManagement,
                    activeColor: AppColors.mainColor,
                    onChanged: (val) {
                      if(val == true){
                        skills.add("Database Management");
                        print(skills);
                      }
                      setState(() {
                        databaseManagement=!databaseManagement;
                      });
                    },
                  ),
                  TextWidget(
                      title: "Database Management",
                      fontFamily: AppFonts.bold,
                      titleSize: 16.sp,
                      titleColor: AppColors.black
                  )
                ],
              ),
              16.verticalSpace,
              Row(
                children: [
                  Checkbox(
                    value: dataAnalysis,
                    activeColor: AppColors.mainColor,
                    onChanged: (val) {
                      if(val == true){
                        skills.add("Data Analysis");
                        print(skills);
                      }
                      setState(() {
                        dataAnalysis=!dataAnalysis;
                      });
                    },
                  ),
                  TextWidget(
                      title: "Data Analysis",
                      fontFamily: AppFonts.bold,
                      titleSize: 16.sp,
                      titleColor: AppColors.black
                  )
                ],
              ),
              16.verticalSpace,
              Row(
                children: [
                  Checkbox(
                    value: java,
                    activeColor: AppColors.mainColor,
                    onChanged: (val) {
                      if(val == true){
                        skills.add("Java");
                        print(skills);
                      }
                      setState(() {
                        java=!java;
                      });
                    },
                  ),
                  TextWidget(
                      title: "Java",
                      fontFamily: AppFonts.bold,
                      titleSize: 16.sp,
                      titleColor: AppColors.black
                  )
                ],
              ),
              32.verticalSpace,
              ButtonWidget(
                text: "Done".tr(),
                loading: state is LoadingState,
                onPressed: () {
                    cubit.register(skills: skills);
                },
              ),
              25.verticalSpace,
            ],
          ),
        );
      },
    );
  }
}

// CustomFormField(
//   header: "Interested",
//   hint: "type your Interested",
//   controller: cubit.interested,
//   prefixIcon: Icons.interests,
// ),
// 16.verticalSpace,
// CustomFormField(
//   header: "Skills",
//   hint: "type your Skills",
//   controller: cubit.skills,
//   prefixIcon: Icons.grid_view,
// ),
// 16.verticalSpace,
// CustomFormField(
//   header: "Current Job",
//   hint: "your Current Job",
//   controller: cubit.job,
//   prefixIcon: Icons.work,
// ),
// 16.verticalSpace,
// 16.verticalSpace,
// CustomDropDown(
//   onItemChanged: (val){
//     setState(() {
//       cubit.accountType = val;
//     });
//   },
//   items:accounts ,
//   dropDownHint: cubit.accountType??"Account Type",
//   headLine: "Account Type",
// ),
// 32.verticalSpace,
