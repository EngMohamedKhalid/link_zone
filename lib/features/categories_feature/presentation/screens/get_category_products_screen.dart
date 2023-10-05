import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_zone/features/categories_feature/presentation/screens/product_details_screen.dart';

import '../../../../app/utils/helper.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';
import '../../../../app/widgets/loading.dart';
import '../../../home_feature/presentation/widgets/custom_product_item.dart';
import '../presentation_logic_holder/categories_cubit.dart';

class CategoryProductsScreen extends StatefulWidget {
  const CategoryProductsScreen({super.key, required this.catId, required this.catName});
  final int catId;
  final String catName;
  @override
  State<CategoryProductsScreen> createState() =>
      _CategoryProductsScreenState();
}

class _CategoryProductsScreenState extends State<CategoryProductsScreen> {
  @override
  void initState() {
    super.initState();
    CategoriesCubit.get().getCategoryProducts(catId: widget.catId );
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        var cubit = CategoriesCubit.get();
        return Scaffold(
          appBar: DefaultAppBarWidget(
              title: widget.catName
          ),
          body:state is LoadingState?
          const Loading():
          ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding:  EdgeInsets.all(16.sp),
            itemCount: cubit.categoryProducts?.categoryProducts.length??0,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  navigateTo(ProductDetailsScreen(cubit.categoryProducts!.categoryProducts[index].id?.toInt()??0));
                },
                child: CustomProductItemDetails(
                    productDetails: cubit.categoryProducts!.categoryProducts[index],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
