import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/utils/helper.dart';
import '../../../../app/widgets/custom_form_field.dart';
import '../../../../app/widgets/text_button_widget.dart';

void showSheet({required BuildContext context,required TextEditingController controller ,
  void Function()? onSave,
}){
  showModalBottomSheet(
    context: context,
    shape :RoundedRectangleBorder(
        borderRadius :BorderRadius.circular(20)
    ),
    isScrollControlled: true,
    builder:(context) => SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 30.h,
            left: 15.w,
            right: 15.w
        ),
        decoration:const BoxDecoration(
            color:Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomFormField(
              controller: controller,
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextButton(
                  onPressed: onSave,
                  title: "Save".tr(),
                ),
                CustomTextButton(
                  onPressed: (){
                    goBack();
                  },
                  title: "Cancel".tr(),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}