import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rate/rate.dart';

import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../../app/widgets/loading.dart';
import '../../../../app/widgets/text_widget.dart';
import '../../../profile_feature/presentation/widgets/custom_edit_button.dart';
import '../presentation_logic_holder/cubit/notification_cubit.dart';

class CustomReviewItem extends StatelessWidget {
  const CustomReviewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      margin:const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageWidget(
            imageUrl: AppAssets.profile,
            width: 48.w,
            height: 48.h,
          ),
          8.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  title: "Esraa samir",
                  titleColor: AppColors.black3333,
                  titleSize: 14.sp,
                  titleFontWeight: FontWeight.w600,
                ),
                3.horizontalSpace,
                Rate(
                  initialValue: 3.5,
                  color: Colors.amber,
                  iconSize: 20.sp,
                ),
                3.horizontalSpace,
                TextWidget(
                  title: "Lorem ipsum dolor sit amet consectetur. Etiam ante sem natoque maecenas volutpat adipiscing.",
                  titleColor: AppColors.black3333,
                  titleSize: 14.sp,
                  titleAlign: TextAlign.start,
                  titleFontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
          TextWidget(
            title: "25 Aug 2022",
            titleColor: AppColors.black3333,
            titleSize: 12.sp,
            titleFontWeight: FontWeight.w600,
          ),

        ],
      ),
    );
  }
}
