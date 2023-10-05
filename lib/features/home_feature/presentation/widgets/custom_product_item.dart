import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/app_fonts.dart';
import '../../../../app/widgets/flutter_toast.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../../app/widgets/text_widget.dart';
import '../../../categories_feature/data/models/product_details.dart';
import 'custom_add_to_card.dart';
import 'custom_add_to_favourite.dart';

class CustomProductItemDetails extends StatelessWidget {
  const CustomProductItemDetails({super.key, required this.productDetails});
  final ProductDetails productDetails;
  @override
  Widget build(BuildContext context) {
    return  ClipRRect(
      child: Container(
        height: 130.h,
        margin: EdgeInsets.only(bottom: 16.h),
        padding: EdgeInsetsDirectional.all(12.sp),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white
        ),
        child: Row(
          children: [
            ImageWidget(
              imageUrl: "assets/images/user.png",
              height: 75.h,width: 100.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                16.verticalSpace,
                TextWidget(
                  title: "Eng Mohamed Khalid",
                  titleColor: AppColors.black3333,
                  titleSize: 15.sp,
                  titleMaxLines: 1,
                  fontFamily: AppFonts.bold,
                ),
                12.verticalSpace,
                TextWidget(
                  title: "Flutter Developer",
                  titleColor: AppColors.black3333,
                  titleSize: 14.sp,
                  fontFamily: AppFonts.bold,
                ),
                4.horizontalSpace,
                TextWidget(
                  title: "Part Time",
                  titleColor: AppColors.hint,
                  titleSize: 14.sp,
                ),
              ],
            )
          ],
        ),

      ),
    );
  }
}
