import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/utils/app_colors.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';
import '../../../../app/widgets/loading.dart';
import '../../../../app/widgets/text_widget.dart';
import '../../../profile_feature/presentation/widgets/custom_edit_button.dart';
import '../presentation_logic_holder/cubit/notification_cubit.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    super.initState();
    NotificationCubit().getAllNotifications();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (context, state) {
        var cubit = NotificationCubit.get();
        return Scaffold(
          backgroundColor: AppColors.secondBackGround,
          appBar: DefaultAppBarWidget(
            title: "Notifications".tr(),
            leading: 0.horizontalSpace,
            leadingWidth: 6,
            actionsWidgets: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Container(
                  width: 45.w,
                  height: 45.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.white,
                        width: 1,
                      )),
                  child: Icon(
                    Icons.close,
                    color: const Color(0xff455A64),
                    size: 24.sp,
                  ),
                ),
              ),
            ],
          ),
          body: state is NotificationLoading
              ?
          const Loading()
              :
         Center(
           child: TextWidget(
             title: "you don't have any notifications",
             titleColor: AppColors.black3333,
             titleSize: 16.sp,
             titleAlign: TextAlign.start,
             titleFontWeight: FontWeight.w500,
           ),
         )
        );
      },
    );
  }
}
