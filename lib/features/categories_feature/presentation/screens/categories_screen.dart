import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/utils/helper.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';
import '../presentation_logic_holder/categories_cubit.dart';
import '../widgets/custom_category_item.dart';
import 'get_category_products_screen.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  void initState() {
    super.initState();
    CategoriesCubit.get().getAllCategories();
  }
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<CategoriesCubit, CategoriesState>(
  builder: (context, state) {
    var cubit = CategoriesCubit.get();
    return Scaffold(
      appBar: DefaultAppBarWidget(
        actionsOnPressed: () {
          //navigateTo(const NotificationScreen());
        },
          canBack: false,
        onPop: () {},
        actions: true,
        title:"Categories"
      ),
      body : GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        physics: const BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 24.h,
            crossAxisSpacing: 16.w,
            childAspectRatio: 1.3
        ),
        itemCount: cubit.categoriesModel?.categories.length??0,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                navigateTo(CategoryProductsScreen(
                    catId:cubit.categoriesModel?.categories[index].id!.toInt()??0,
                  catName: cubit.categoriesModel?.categories[index].name??"",
                ));
              },
              child: CustomCategoryItem(categoryModelData:cubit.categoriesModel!.categories[index]));
        },
      ),
    );
  },
);
  }
}
