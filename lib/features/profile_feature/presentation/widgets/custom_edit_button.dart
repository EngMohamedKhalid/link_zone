import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomEditButton extends StatelessWidget {
  const CustomEditButton({super.key, this.onPressed, this.icon, this.backColor, this.iconColor, this.size,this.iconSize});
 final void Function()? onPressed;
 final IconData? icon;
 final Color ? backColor;
 final double ? iconSize;
 final double ? size;
 final Color ? iconColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size??40.w,
      height: size??40.h,
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
          color:backColor??const Color(0xff28C169).withOpacity(.1),
          borderRadius: BorderRadius.circular(8)
      ),
      child: IconButton(
          padding: EdgeInsets.zero,
          onPressed:onPressed??() {},
          icon: Icon(
            icon??Icons.edit_outlined,
            size:iconSize?? 35.sp,
            color:iconColor??const Color(0xff28C169),
          )
      ),
    );
  }
}
