

import '../../../../app/network/network_manager.dart';
import '../../../../app/utils/consts.dart';
import '../../../../app/utils/hanlders/remote_data_source_handler.dart';
import '../models/categories_model.dart';
import '../models/category_products.dart';
import '../models/product_details.dart';

abstract class CategoriesRemoteDataSource{
  Future<CategoriesModel> getAllCategories();
  Future<CategoryProducts> getCategoryProducts({required int catId});
  Future<ProductDetails> getProductDetails({required int productId});
}


class CategoriesRemoteDataSourceImpl implements CategoriesRemoteDataSource{
  final NetworkManager networkManager ;

  CategoriesRemoteDataSourceImpl({required this.networkManager});

  @override
  Future<CategoriesModel> getAllCategories()async {
    final res = await networkManager.requestWithFormData(
      endPoint: kCategories,
      method: RequestMethod.get,
    );
    final data =  await RemoteDataSourceCallHandler().handleFormData(res);
    return CategoriesModel.fromJson(data.data);
  }

  @override
  Future<CategoryProducts> getCategoryProducts({required int catId}) async{
    final res = await networkManager.requestWithFormData(
      endPoint: "$kCatProducts/$catId",
      method: RequestMethod.get,
    );
    final data =  await RemoteDataSourceCallHandler().handleFormData(res);
    return CategoryProducts.fromJson(data.data);
  }

  @override
  Future<ProductDetails> getProductDetails({required int productId})async {
    final res = await networkManager.requestWithFormData(
      endPoint: "$kProductDetails/$productId",
      method: RequestMethod.get,
    );
    final data =  await RemoteDataSourceCallHandler().handleFormData(res);
    return ProductDetails.fromJson(data.data);
  }

}