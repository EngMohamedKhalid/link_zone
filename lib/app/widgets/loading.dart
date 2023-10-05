import 'package:flutter/material.dart';

import '../../app/utils/app_colors.dart';

class Loading extends StatelessWidget {
  final double height ;
  final double width ;
  final bool isBackground ;


  const Loading({super.key, this.height = 50, this.width = 50 , this.isBackground = false });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: height,
        height: width,
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          //color: PRIMARY_COLOR,
            shape: BoxShape.circle
        ),
        child:  CircularProgressIndicator(
           valueColor:  AlwaysStoppedAnimation<Color>(isBackground ? AppColors.white : AppColors.mainColor),
        ),
      ),
    );
  }
}