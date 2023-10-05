import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/widgets/flutter_toast.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../../app/widgets/loading.dart';

class CustomAddToFavourite extends StatefulWidget {
  const CustomAddToFavourite({super.key, required this.id, });
  final int id;
  @override
  State<CustomAddToFavourite> createState() => _CustomAddToFavouriteState();
}

class _CustomAddToFavouriteState extends State<CustomAddToFavourite> {
  bool isLoading =false;
  bool isFirst = true;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async{
        setState(() {
          isLoading =true;
        });
        // await CartCubit.get().addOrRemoveFavourite(
        //   id: widget.id.toInt(),
        // ).then((value) {
        //  isFirst? showToast(msg: "Added To Favourites Successfully",):
        //  showToast(msg: "Removed From Favourites Successfully",);
        // });
        setState(() {
          isLoading =false;
          isFirst=false;
        });
      },
      child: Icon(
       isLoading? Icons.favorite_outlined:Icons.favorite_border,
        color: AppColors.mainColor,
        size: 30.sp,
      ),
    );
  }
}
