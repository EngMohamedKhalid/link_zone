import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:link_zone/app/utils/app_colors.dart';
import 'package:link_zone/app/widgets/default_app_bar_widget.dart';
import 'package:link_zone/app/widgets/image_widget.dart';
import 'package:link_zone/app/widgets/text_widget.dart';

import '../../../../app/services/image_picker_service/image_picker_service.dart';
import '../../../../app/utils/app_fonts.dart';
import '../../../../app/widgets/button_widget.dart';
import '../../../../app/widgets/custom_form_field.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBarWidget(
        title: "Projects Archive",
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.sp),
        itemCount: 20,
        itemBuilder:(context, index) {
          return Container(
            padding: EdgeInsets.all(16.sp),
            margin: EdgeInsets.only(bottom: 16.w),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16)
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: ImageWidget(
                      imageUrl: "assets/images/space.jpeg",
                    fit: BoxFit.cover,
                    width: 90.w,
                  ),
                ),
                16.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                        title: "Artificial Intelligence",
                      titleColor: AppColors.black,
                      titleFontWeight: FontWeight.w600,
                      titleSize: 16.sp,
                    ),
                    4.verticalSpace,
                    TextWidget(
                      title: "NASA Science Mission ...",
                      titleColor: AppColors.greyB1B1B1,
                      titleFontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                      titleSize: 15.sp,
                    ),
                  ],
                )
              ],
            ),
          );
        },
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
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomFormField(
                          header: "Project Name",
                          hint: "Type your Project Name",
                        ),
                        16.verticalSpace,
                        CustomFormField(
                          header: "Project Description",
                          hint: "Type your Project Description",
                          maxLines: 10,
                          minLines: 10,
                        ),
                        16.verticalSpace,
                        CustomFormField(
                          header: "Upload Data",
                          hint: "Upload",
                          enabled: false,
                          keyboardType: TextInputType.none,
                          suffixIconWidget:
                          IconButton(
                              icon:Icon(
                                  Icons.upload,
                                size: 28.sp,
                                color: AppColors.black,
                              ),
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
                                            title: "Upload File".tr(),
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

                                                  });
                                                  Navigator.pop(context);

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
                                                  });
                                                  Navigator.pop(context);

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

                          ),
                        ),
                        16.verticalSpace,
                        ButtonWidget(
                          onPressed: (){
                          },
                          text: "Add Project",
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
  }
  void uploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;

      // Perform any necessary operations with the selected file
      // For example, you can upload the file to a server

      // Print the file path to the console
      print(file.path);
    } else {
      // User canceled the file selection
    }
  }
}
