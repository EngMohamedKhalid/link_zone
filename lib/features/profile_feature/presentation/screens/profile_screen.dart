import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:link_zone/features/auth_feature/presentation/presentation_logic_holder/auth_cubit.dart';
import 'package:link_zone/features/profile_feature/presentation/screens/my_posts_screen.dart';
import 'package:link_zone/features/profile_feature/presentation/screens/personal_info_screen.dart';

import '../../../../app/services/cache_service.dart';
import '../../../../app/services/image_picker_service/image_picker_service.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/app_fonts.dart';
import '../../../../app/utils/get_it_injection.dart';
import '../../../../app/utils/helper.dart';
import '../../../../app/widgets/custom_alert_dialog.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../../app/widgets/list_tile_widget.dart';
import '../../../../app/widgets/text_widget.dart';
import '../../../auth_feature/presentation/screens/auth_screen.dart';
import 'complaint_screen.dart';
import 'faqs_screen.dart';
import 'language_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  XFile? userImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondBackGround,
      appBar: DefaultAppBarWidget(
        notify: false,
        canBack: false,
        actions: true,
        actionsOnPressed: () {
         // navigateTo(const NotificationScreen());
        },
        leading: SizedBox(),
        title: "Profile".tr(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 30.h),
              child: FutureBuilder(
                future: FirebaseFirestore.instance.collection("users").doc(
                  FirebaseAuth.instance.currentUser?.uid
                ).get(),
                builder: (context, snapshot) {
                  if(snapshot.hasData){
                    return Row(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            snapshot.data?["image"]==null?
                            ImageWidget(
                              imageUrl:"assets/images/user.png",
                              width: 75.w,
                              height: 75.h,
                            ):
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.file(
                                File(snapshot.data?["image"]),
                                width: 75.w,
                                height: 75.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              right: -10.w,
                              bottom: -10.h,
                              child: Container(
                                width: 35.w,
                                height: 35.h,
                                decoration:const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:  Color(0xFF455A64)
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          width: double.infinity,
                                          decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(16),
                                                topRight: Radius.circular(16),
                                              )
                                          ),
                                          //height: 200.h,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 20.h
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              TextWidget(
                                                title: "chosePicture".tr(),
                                                titleAlign: TextAlign.center,
                                                titleSize: 20.sp,
                                                titleFontWeight: FontWeight.w600,
                                                fontFamily: AppFonts.regular,
                                                titleColor: Colors.black,
                                              ),
                                              20.verticalSpace,
                                              Row(
                                                mainAxisAlignment : MainAxisAlignment.spaceAround,
                                                children: [
                                                  IconButton(
                                                    onPressed:() async{
                                                      await ImagePickerService.getImage(imageSource: ImageSource.camera).then((value) {
                                                        userImage = value;
                                                      });
                                                      await FirebaseFirestore.instance.collection("users")
                                                          .doc(FirebaseAuth.instance.currentUser!.uid).update({
                                                        "image":userImage!.path,
                                                      });
                                                      Navigator.pop(context);
                                                      setState(() {

                                                      });
                                                    },
                                                    icon: Icon(
                                                      Icons.camera_alt_rounded,
                                                      color: Colors.black,
                                                      size:25.sp ,
                                                    ),
                                                  ),
                                                  IconButton(
                                                    onPressed:()async {
                                                      await ImagePickerService.getImage(imageSource: ImageSource.gallery).then((value) {
                                                        userImage = value;
                                                      });
                                                      await FirebaseFirestore.instance.collection("users")
                                                          .doc(FirebaseAuth.instance.currentUser!.uid).update({
                                                        "image":userImage!.path,
                                                      });
                                                      Navigator.pop(context);
                                                      setState(() {

                                                      });
                                                    },
                                                    icon: Icon(
                                                      Icons.photo_library_rounded,
                                                      color: Colors.black,
                                                      size:25.sp ,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  icon: Icon(
                                    Icons.camera_alt_outlined,
                                    size: 20.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        12.horizontalSpace,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                title:snapshot.data?["name"],
                                titleColor: AppColors.gery455,
                                titleSize: 17.sp,
                                titleFontWeight: FontWeight.w600,
                              ),
                              8.verticalSpace,
                              TextWidget(
                                title:snapshot.data?["email"],
                                titleColor: AppColors.hint,
                                titleSize: 16.sp,
                              ),
                            ],
                          ),
                        )

                      ],
                    );
                  }
                  return 0.verticalSpace;
                },
              ),
            ),
            23.verticalSpace,
            ///////////////////Personal Information//////////////////
            ListTileWidget(
                onTap: (){
                  navigateTo(const PersonalInfoScreen());
                },
                icon: Icons.person_outline_outlined,
                title: "PersonalInformation".tr(),
            ),
            16.verticalSpace,
            ///////////////////My Order//////////////////
            ListTileWidget(
              onTap: (){
                navigateTo(const MyPostsScreen());
              },
              image: true,
              imageUrl: "assets/icons/box.svg",
              icon: Icons.layers_outlined,
              title: "Posts".tr(),
            ),
            // 16.verticalSpace,
            // ///////////////////Shipping Addresses//////////////////
            // ListTileWidget(
            //   onTap: (){
            //     //todo add navigate here
            //     //navigateTo(const ShippingAddressScreen());
            //   },
            //   icon: Icons.location_on_outlined,
            //   title: "ShippingAddresses".tr(),
            // ),
            16.verticalSpace,
            ///////////////////language//////////////////
            ListTileWidget(
              onTap: (){
                navigateTo(const LanguageScreen());
              },
              icon: Icons.language,
              title: "Languages".tr(),
            ),
            16.verticalSpace,
            ///////////////////Complaints//////////////////
            ListTileWidget(
              onTap: (){
                navigateTo(const ComplaintScreen());
              },
              icon: Icons.sms,
              image: true,
              imageUrl: "assets/icons/sms-tracking.svg",
              title: "Complaints".tr(),
            ),
            // 16.verticalSpace,
            // ///////////////////Setting//////////////////
            // ListTileWidget(
            //   onTap: (){
            //    // navigateTo(const ComplaintScreen());
            //   },
            //   icon: Icons.sms,
            //   image: true,
            //   imageUrl: "assets/icons/sms-tracking.svg",
            //   title: "Settings".tr(),
            // ),
            16.verticalSpace,
            ///////////////////Faqs//////////////////
            ListTileWidget(
              onTap: (){
               navigateTo(const FAQSScreen());
              },
              icon: Icons.sms,
              image: true,
              imageUrl: "assets/icons/sms-tracking.svg",
              title: "FAQS".tr(),
            ),
            16.verticalSpace,
            ///////////////////log out//////////////////
            ListTileWidget(
              onTap: (){
                globalAlertDialogue(
                  "LogOut".tr(),
                  buttonText2: "yes".tr(),
                  buttonText: "No".tr(),
                  canCancel: true,
                  onOk: () {
                    AuthCubit.get(context).logout();
                    getIt<CacheService>().clear().then((value) => navigateTo(const AuthScreen(),removeAll: true));
                  },
                  onCancel: () {
                    Navigator.pop(context);
                  },
                );
              },
              image: true,
              imageUrl: "assets/icons/logout.svg",
              icon: Icons.logout_rounded,
              iconColor: AppColors.red,
              textColor: AppColors.red,
              tralingColor: Colors.white,
              title: "logOut".tr(),
            ),
            16.verticalSpace,
          ],
        ),
      ),
    );
  }
}
