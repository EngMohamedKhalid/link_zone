import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_assets.dart';
import 'image_widget.dart';

class CliqueAppBarWidget extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  const CliqueAppBarWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 62.w,
      leading: ImageWidget(
        imageUrl: AppAssets.appbarLogo,
        width: 62.w,
        height: 45.h,
      ),
      title: Text(
          title,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 24.sp,
        ),
      ),
      actions: [
        InkWell(
          onTap: (){},
          child: ImageWidget(
            imageUrl: AppAssets.appBarLocationAction,
            width: 30.w,
            height: 30.h,
          ),
        ),
        SizedBox(width: 10.w),
        InkWell(
          onTap: (){},
          child: ImageWidget(
            imageUrl: AppAssets.appBarBellAction,
            width: 30.w,
            height: 30.h,
          ),
        ),
        SizedBox(width: 23.w,)
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(500,56);}



