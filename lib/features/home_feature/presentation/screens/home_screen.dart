import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_zone/features/auth_feature/presentation/presentation_logic_holder/auth_cubit.dart';
import 'package:link_zone/features/chat_feature/presentation/screens/chat_screen.dart';
import 'package:link_zone/features/chat_feature/presentation/screens/user_profile_screen.dart';
import 'package:link_zone/features/home_feature/presentation/widgets/custom_post_item.dart';
import '../../../../app/services/cache_service.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/get_it_injection.dart';
import '../../../../app/utils/helper.dart';
import '../../../../app/widgets/button_widget.dart';
import '../../../../app/widgets/carousel_widget/carousel_widget.dart';
import '../../../../app/widgets/custom_form_field.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';
import '../../../../app/widgets/flutter_toast.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../../app/widgets/loading.dart';
import '../../../../app/widgets/text_widget.dart';
import '../../../categories_feature/presentation/screens/product_details_screen.dart';
import '../../../notifications_feature/presentation/screens/notification_screen.dart';
import '../presentation_logic_holder/home_cubit.dart';
import '../presentation_logic_holder/home_state.dart';
import '../widgets/custom_product_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    HomeCubit.get().getHomeData();
  }
  TextEditingController controller = TextEditingController();
  TextEditingController nameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String ?name ;
  String chatRoomId(String user1, String user2) {
    if (user1[0].toLowerCase().codeUnits[0] >
        user2.toLowerCase().codeUnits[0]) {
      return "$user1$user2";
    } else {
      return "$user2$user1";
    }
  }
 final cont = TextEditingController();
  Stream<QuerySnapshot<Map<String, dynamic>>>? stream;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get();
        return Scaffold(
          appBar: DefaultAppBarWidget(
            actionsOnPressed: () {
             navigateTo(const NotificationScreen());
            },
            onPop: () {},
            actions: true,
            canBack: false,
            titleWidget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  title: "HelloMr".tr(),
                  titleFontWeight: FontWeight.w400,
                  titleSize: 20.sp,
                  titleColor: AppColors.gery455,
                ),
                FutureBuilder(
                  future: FirebaseFirestore.instance.collection("users").doc(
                      FirebaseAuth.instance.currentUser?.uid
                  ).get(),
                    builder:(context, snapshot) {
                      if(snapshot.hasData){
                        name = snapshot.data?["name"];
                        return TextWidget(
                          title: snapshot.data?["name"],
                          titleFontWeight: FontWeight.bold,
                          titleSize: 22.sp,
                          titleColor: AppColors.gery455,
                        );
                      }
                      return 0.verticalSpace;
                    },
                )
              ],
            ),
          ),
          body:state is HomeLoading?
         const  Loading():
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.verticalSpace,
               Padding(
                 padding: EdgeInsets.symmetric(horizontal: 16.w),
                 child: CustomFormField(
                   controller:cont ,
                   hint: "Search..",
                   onChange: (val) {
                     // if(val.isNotEmpty){
                     //   stream =   FirebaseFirestore.instance.collection("posts").where(
                     //     "post",isGreaterThanOrEqualTo: val,
                     //     isLessThan: val + 'z',).orderBy('post').orderBy('time', descending: true).snapshots();
                     // }else{
                     //   stream =  FirebaseFirestore.instance.collection("posts").orderBy('time', descending: true).snapshots();
                     // }
                     // setState(() {
                     //
                     // });
                   },
                 ),
               ),
              16.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: TextWidget(
                  title: "Posts",
                  titleColor: AppColors.black,
                  titleSize: 19.sp,
                  titleFontWeight: FontWeight.w600,
                ),
              ),
              16.verticalSpace,
              Expanded(
                child: StreamBuilder(
                  stream:FirebaseFirestore.instance.collection("posts").orderBy('time', descending: true).snapshots(),
                  builder: (context, snapshot) {
                    if(snapshot.hasData){
                      return
                        snapshot.data!.docs.isEmpty?
                       const Center(
                          child: TextWidget(
                            title: "No Posts",
                          ),
                        ):
                        ListView.separated(
                        physics:const BouncingScrollPhysics(),
                        itemCount: snapshot.data?.docs.length??0,
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        itemBuilder: (context, index) {
                          return CustomPostItem(
                           name: snapshot.data?.docs[index]["name"]??"",
                           post: snapshot.data?.docs[index]["post"]??"",
                            isCurrentUser:  snapshot.data!.docs[index]["userId"]==
                                FirebaseAuth.instance.currentUser!.uid?false:true,
                            onPressed:
                              snapshot.data!.docs[index]["userId"]!=
                                  FirebaseAuth.instance.currentUser!.uid?
                                  () {
                                String roomId = chatRoomId(
                                    FirebaseAuth.instance.currentUser!.uid,
                                    snapshot.data!.docs[index]["userId"]
                                );
                                navigateTo(
                                    ChatScreen(
                                      chatRoomId: roomId,
                                      name: snapshot.data!.docs[index]["name"],
                                      userId:snapshot.data!.docs[index]["userId"],
                                    )
                                );
                              }:(){}
                          );
                        },
                        separatorBuilder: (context, index) => 16.horizontalSpace,
                      );
                    }
                    return Text("");
                  },
                ),
              ),
              16.verticalSpace,
              //  Padding(
              //    padding: EdgeInsets.symmetric(horizontal: 16.w),
              //    child: TextWidget(
              //      title: "Most Popular",
              //      titleColor: AppColors.black,
              //      titleSize: 19.sp,
              //      titleFontWeight: FontWeight.w600,
              //    ),
              //  ),
              // 16.verticalSpace,
              // ListView.builder(
              //   physics:const NeverScrollableScrollPhysics(),
              //   shrinkWrap: true,
              //   itemCount: cubit.homeModel?.homeProducts.length??0,
              //   padding: EdgeInsets.symmetric(horizontal: 16.w),
              //   itemBuilder: (context, index) {
              //     return InkWell(
              //       onTap: () {
              //         navigateTo(
              //             ChatScreen()
              //         );
              //       },
              //       child: CustomProductItemDetails(
              //           productDetails:cubit.homeModel!.homeProducts[index],
              //       ),
              //     );
              //   },
              // )

            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.mainColor,
            onPressed: (){
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return Container(
                    width:double.infinity,
                    padding:EdgeInsetsDirectional.all(16.sp),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.r),
                          topLeft: Radius.circular(20.r),
                        )
                    ),
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom ),
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // CustomFormField(
                            //   header: "Name",
                            //   hint: "Type your Name",
                            //   controller:nameController ,
                            // ),
                            // 16.verticalSpace,
                            CustomFormField(
                              header: "Post",
                              hint: "Type your Post",
                              maxLines: 10,
                              minLines: 10,
                              controller:controller ,
                            ),
                            16.verticalSpace,
                            ButtonWidget(
                              onPressed: (){
                                if(formKey.currentState!.validate()){
                                  FirebaseFirestore.instance.
                                  collection("posts").doc(
                                  ).set({
                                    "post":controller.text,
                                    "name":name,
                                    "time":DateTime.now(),
                                    "userId":FirebaseAuth.instance.currentUser?.uid,
                                    "userEmail":FirebaseAuth.instance.currentUser?.email,
                                  }).then((value){
                                    Navigator.pop(context);
                                    controller.clear();
                                    nameController.clear();
                                    showToast(msg: "Post Added Successfully");
                                  });
                                }
                              },
                              text: "Add Post",
                              textSize: 16.sp,
                              textColor: AppColors.white,
                            ),
                            10.verticalSpace
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            child: Icon(
              Icons.add,
              size: 25.sp,
              color: AppColors.white,
            ),
          ),
        );
      },
    );
  }
}


