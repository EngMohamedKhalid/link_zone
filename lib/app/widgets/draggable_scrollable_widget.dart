import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/get_it_injection.dart';
import '../utils/navigation_helper.dart';

void draggableScrollableWidget(
    GlobalKey<ScaffoldState> scaffoldKey, Widget child,
    {Color? backgroundColor, double? height}) {
  scaffoldKey.currentState!.showBottomSheet(
    backgroundColor:Colors.white,
    constraints: BoxConstraints(
      maxHeight: 200.h,
      minHeight: 199.h
    ),
    (context) => child,
    enableDrag: true,
    elevation: 4,
    // backgroundColor: Colors.red,
  );
}

void showScrollableWidget(Widget child,
    {Color? backgroundColor, double? height,bool useSafeArea = true}) {
  showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    context: getIt<NavHelper>().navigatorKey.currentState!.context,
     useSafeArea: useSafeArea,
    builder: (context) {
      return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            child,
          ],
        ),
      );
    },
  );
}
