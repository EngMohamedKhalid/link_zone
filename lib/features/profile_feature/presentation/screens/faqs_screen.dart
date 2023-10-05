import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/app_fonts.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';
import '../../../../app/widgets/text_widget.dart';
import '../presentation_logic_holder/cubit/profile_cubit.dart';

class FAQSScreen extends StatefulWidget {
  const FAQSScreen({super.key});

  @override
  State<FAQSScreen> createState() => _FAQSScreenState();
}

class _FAQSScreenState extends State<FAQSScreen> {
  @override
  void initState() {
    super.initState();
    ProfileCubit.get(context).getFAQS();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        var cubit = ProfileCubit.get(context);
        return Scaffold(
          appBar: DefaultAppBarWidget(
            canBack: true,
            title: "FAQS".tr(),
          ),
          body: ListView.builder(
            itemCount: cubit.faqsModel?.data.length??0,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(16.sp),
                margin: EdgeInsets.only(
                  top: 16.h,right: 16.w,left: 16.w
                ),
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextWidget(
                          title: "Question :  ",
                          titleColor: AppColors.black,
                          titleSize: 20.sp,
                          fontFamily: AppFonts.semiBold,
                        ),
                        Expanded(
                          child: TextWidget(
                            title:  cubit.faqsModel?.data[index].question??"",
                            titleColor: AppColors.red,
                            overflow: TextOverflow.visible,
                            titleSize: 18.sp,
                            fontFamily: AppFonts.semiBold,
                            titleMaxLines: 100,
                            titleAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                    8.verticalSpace,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextWidget(
                          title: "Answer :  ",
                          titleColor: AppColors.black,
                          titleSize: 20.sp,
                          fontFamily: AppFonts.semiBold,
                        ),
                        Expanded(
                          child: TextWidget(
                            title:cubit.faqsModel?.data[index].answer??"",
                            titleColor: AppColors.gery455,
                            titleSize: 18.sp,
                            fontFamily: AppFonts.semiBold,
                            titleMaxLines: 100,
                            titleAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
