import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/usecase/usecase.dart';
import '../../../../app/utils/get_it_injection.dart';
import '../../../../app/utils/hanlders/error_state_handler.dart';
import '../../../../app/utils/navigation_helper.dart';
import '../../data/models/categories_model.dart';
import '../../data/models/category_products.dart';
import '../../data/models/product_details.dart';
import '../../domain/use_cases/get_all_categories_use_case.dart';
import '../../domain/use_cases/get_category_products.dart';
import '../../domain/use_cases/get_product_details_use_case.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(InitialState());
  static CategoriesCubit get() => BlocProvider.of(getIt<NavHelper>().navigatorKey.currentState!.context);

  CategoryProducts? categoryProducts;
  ProductDetails? productDetails;
  CategoriesModel ? categoriesModel ;


  void getAllCategories()async {
    emit(LoadingState());
    final res = await getIt<GetAllCategoriesUseCase>()(NoParams());
    res.fold(
           errorStateHandler,
            (r) {
             categoriesModel = r;
             print("===============================");
             print(categoriesModel?.categories??[]);
             print(categoriesModel?.categories.length??0);
             print(categoriesModel?.categories[0].name??"NO Name");
            },
    );
    emit(InitialState());
  }

  void getCategoryProducts({required int catId})async {
    emit(LoadingState());
    final res = await getIt<GetAllCategoryProductsUseCase>()(
      GetAllCategoryProductsUseCaseParams(id:catId )
    );
    res.fold(
           errorStateHandler,
            (r) {
             categoryProducts = r;
             print("===============================");
             print(categoryProducts?.categoryProducts??[]);
             print(categoryProducts?.categoryProducts.length??0);
             print(categoryProducts?.categoryProducts[0].name??"NO Name");
            },
    );
    emit(InitialState());
  }
  void getProductDetails({required int productId})async {
    emit(LoadingState());
    final res = await getIt<GetProductDetailsUseCase>()(
      GetProductDetailsUseCaseParams(id: productId)
    );
    res.fold(
           errorStateHandler,
            (r) {
             productDetails = r;
             print("===============================");
             print(productDetails?.name??"NoName");
             print(productDetails?.images);
             print(productDetails?.price??0);
             print(productDetails?.oldPrice??0);
            },
    );
    emit(InitialState());
  }

}
