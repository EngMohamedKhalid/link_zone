import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_zone/app/widgets/custom_form_field.dart';
import 'package:link_zone/features/auth_feature/presentation/presentation_logic_holder/auth_cubit.dart';
import '../../../../app/services/cache_service.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/get_it_injection.dart';
import '../../../../app/utils/helper.dart';
import '../../../../app/widgets/carousel_widget/carousel_widget.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../../app/widgets/loading.dart';
import '../../../../app/widgets/text_widget.dart';
import '../../../categories_feature/presentation/screens/product_details_screen.dart';
class AIChatScreen extends StatelessWidget {
  const AIChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBarWidget(
        titleWidget: TextWidget(
          title: "Boot Chat Screen",
          titleFontWeight: FontWeight.w400,
          titleSize: 20.sp,
          titleColor: AppColors.gery455,
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.all(10.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
           Expanded(
             child: ListView.separated(
                itemCount: 20,
                 itemBuilder:(context, index) {
                   return  Container(
                     width: double.infinity,
                     child: ChatBubble(
                       padding: EdgeInsets.all(12.sp),
                       elevation: 0,
                       backGroundColor:index % 2 == 0 ?AppColors.mainColor:AppColors.blue7E8CAA ,
                       clipper: ChatBubbleClipper3(type:index % 2 == 0 ? BubbleType.sendBubble:BubbleType.receiverBubble),
                       child: TextWidget(
                         title: "If you encounter any specific issues or error messages , "
                             "please provide more details, and I'll do my best to assist you further.",
                         titleSize: 16.sp,
                         titleFontWeight: FontWeight.w600,
                          titleMaxLines: 5,
                         titleAlign: TextAlign.start,
                         titleColor: AppColors.white,
                       ),
                     ),
                   );
                 },
               separatorBuilder: (context, index) {
                 return 16.verticalSpace;
               },
             ),
           ),
            16.verticalSpace,
            Row(
              children: [
                const Expanded(
                  child:  CustomFormField(
                    hint: "Type Your Message",
                  ),
                ),
                10.horizontalSpace,
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.send,
                    size: 30.sp,
                    color: AppColors.mainColor,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
