import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/app_fonts.dart';
import '../../../../app/utils/helper.dart';
import '../../../../app/widgets/button_widget.dart';
import '../../../../app/widgets/custom_form_field.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../../app/widgets/loading.dart';
import '../../../../app/widgets/text_button_widget.dart';
import '../../../../app/widgets/text_widget.dart';
import '../../../profile_feature/presentation/widgets/custom_edit_button.dart';
import '../presentation_logic_holder/categories_cubit.dart';


class ProductDetailsScreen extends StatefulWidget {
  final int productId;
  const ProductDetailsScreen(this.productId,{super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

  @override
  void initState() {
    super.initState();
    CategoriesCubit.get().getProductDetails(productId: widget.productId);
  }
  TextEditingController controller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  int itemCount=1;
  int colorIndex=0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        var cubit = CategoriesCubit.get();
        return Scaffold(
          appBar: DefaultAppBarWidget(
            title: "ProductDetails".tr(),
            actionsWidgets: [
              CustomEditButton(
                onPressed: () {},
                icon: Icons.share_outlined,
                size: 35.sp,
                iconColor: AppColors.gery455,
                backColor: AppColors.gery455.withOpacity(.08),
              ),
              16.horizontalSpace,
            ],
          ),
          body: state is LoadingState ?const Loading():
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
                  color: AppColors.white,
                  //height: 500.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 293.h,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Card(
                                elevation: 1,
                                child: Container(
                                  color: Colors.white,
                                  child: ImageWidget(
                                    imageUrl:  CategoriesCubit.get().productDetails?.image??"",
                                    height: 290.w,
                                    //color:  CategoriesCubit.get().productDetails?.colors[0].attachments[0].attachment
                                    // colorIndex==0?Colors.grey:colorIndex==1?
                                    // Colors.black:colorIndex==2?Colors.yellow:Colors.brown,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: List<Widget>.generate(
                                  2,
                                      (index) => Expanded(
                                    child: Card(
                                      elevation: 1.5,
                                      child: Container(
                                        color: Colors.white,
                                        child: ImageWidget(
                                          imageUrl:cubit.productDetails?.images?[index]??"",
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      16.verticalSpace,
                      TextWidget(
                        title: CategoriesCubit.get().productDetails?.name??"",
                        titleColor: AppColors.black3333,
                        titleSize: 16.sp,
                        fontFamily: AppFonts.semiBold,
                        titleAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),
                8.verticalSpace,
                Container(
                  width: 1.sw,
                  padding: const EdgeInsets.all(16),
                  color: AppColors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        title: "DESCRIPTION".tr(),
                        titleColor: AppColors.black3333,
                        titleSize: 20.sp,
                        titleFontWeight: FontWeight.w600,
                        titleAlign: TextAlign.start,
                      ),
                      16.verticalSpace,
                      TextWidget(
                        title:CategoriesCubit.get().productDetails?.desc??"",
                        titleColor: AppColors.black,
                        titleSize: 19.sp,
                        titleFontWeight: FontWeight.w500,
                        titleAlign: TextAlign.start,
                        titleMaxLines: 200,
                      ),
                    ],
                  ),
                ),
                8.verticalSpace,
                // Container(
                //   width: 1.sw,
                //   padding: const EdgeInsets.all(16),
                //   color: AppColors.white,
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       TextWidget(
                //         title: "CustomQuestions".tr().toUpperCase(),
                //         titleColor: AppColors.black3333,
                //         titleSize: 21.sp,
                //         fontFamily: AppFonts.regular,
                //         titleFontWeight: FontWeight.w500,
                //         titleAlign: TextAlign.start,
                //       ),
                //       16.verticalSpace,
                //       // TextWidget(
                //       //   title: "10 ${"Questions".tr()}",
                //       //   titleColor: AppColors.black,
                //       //   titleSize: 20.sp,
                //       //   titleFontWeight: FontWeight.w500,
                //       //   titleAlign: TextAlign.start,
                //       // ),
                //       // 16.verticalSpace,
                //       // ButtonWidget(
                //       //   onPressed: () {
                //       //     showModalBottomSheet(
                //       //       shape: const RoundedRectangleBorder(
                //       //           borderRadius: BorderRadius.only(
                //       //             topLeft: Radius.circular(24),
                //       //             topRight: Radius.circular(24),
                //       //           )),
                //       //       context: context,
                //       //       builder: (context) {
                //       //         return SingleChildScrollView(
                //       //           child: Container(
                //       //             padding: EdgeInsets.only(
                //       //                 bottom:
                //       //                 MediaQuery.of(context).viewInsets.bottom,
                //       //                 top: 16.h,
                //       //                 left: 16.w,
                //       //                 right: 16.w),
                //       //             decoration: const BoxDecoration(
                //       //                 color: AppColors.white,
                //       //                 borderRadius: BorderRadius.only(
                //       //                   topLeft: Radius.circular(24),
                //       //                   topRight: Radius.circular(24),
                //       //                 )),
                //       //             child: Form(
                //       //               key: formKey,
                //       //               child: Column(
                //       //                 children: [
                //       //                   Align(
                //       //                     alignment: Alignment.centerRight,
                //       //                     child: IconButton(
                //       //                       onPressed: () {
                //       //                         Navigator.pop(context);
                //       //                       },
                //       //                       icon: Icon(
                //       //                         Icons.close,
                //       //                         size: 25.sp,
                //       //                         color: AppColors.gery455,
                //       //                       ),
                //       //                     ),
                //       //                   ),
                //       //                   TextWidget(
                //       //                     title: "AskQuestion".tr(),
                //       //                     titleSize: 22.sp,
                //       //                     titleFontWeight: FontWeight.w600,
                //       //                     titleColor: AppColors.black,
                //       //                   ),
                //       //                   30.verticalSpace,
                //       //                   CustomFormField(
                //       //                     controller: controller,
                //       //                     filled: true,
                //       //                     maxLines: 6,
                //       //                     minLines: 6,
                //       //                     fillColor: Colors.white,
                //       //                     prefixIcon: Icons.email_outlined,
                //       //                     prefixIconColor: Colors.white,
                //       //                     hint: "WriteYourQuestionHere".tr(),
                //       //                   ),
                //       //                   20.verticalSpace,
                //       //                   ButtonWidget(
                //       //                     onPressed: () {
                //       //                       if (formKey.currentState!.validate()) {
                //       //                         Navigator.pop(context);
                //       //                       }
                //       //                     },
                //       //                     text: "Ask".tr(),
                //       //                   ),
                //       //                   32.verticalSpace,
                //       //                 ],
                //       //               ),
                //       //             ),
                //       //           ),
                //       //         );
                //       //       },
                //       //     );
                //       //   },
                //       //   color: AppColors.gery455,
                //       //   text: "AskQuestion".tr(),
                //       // ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Colors.white.withOpacity(.98),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
              side: BorderSide(
                color: AppColors.mainColor,
                width: 3.w,
              ),
            ),
            onPressed: () {
              // CartCubit.get().addOrRemoveCart(
              //     id: CategoriesCubit.get().productDetails?.id?.toInt()??0,
              // );
            },
            icon: const Icon(
              Icons.add,
              color: AppColors.mainColor,
            ),
            label: TextWidget(
              title: "AddToCart".tr(),
              fontFamily: AppFonts.bold,
              titleSize: 14.sp,
              titleColor: AppColors.mainColor,
            ),
          ),
          bottomNavigationBar: Container(
            height: 96.h,
            padding: EdgeInsetsDirectional.all(20.sp),
            color: Colors.white,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      title: "Total".tr(),
                      titleColor: AppColors.gery455,
                      titleSize: 14.sp,
                    ),
                    8.verticalSpace,
                    TextWidget(
                      title: "${itemCount*(CategoriesCubit.get().productDetails?.price??0)} EGP",
                      titleColor: AppColors.gery455,
                      titleSize: 18.sp,
                      fontFamily: AppFonts.bold,
                    ),
                  ],
                ),
                44.horizontalSpace,
                Expanded(
                  child: ButtonWidget(
                      text: "BuyNow".tr(),
                      onPressed: () {
                        //todo add payment
                        //navigateTo(const CheckOutItemsDetails());
                      }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
