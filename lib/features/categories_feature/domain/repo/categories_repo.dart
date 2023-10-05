import 'package:dartz/dartz.dart';

import '../../../../app/error/failures.dart';
import '../../data/models/categories_model.dart';
import '../../data/models/category_products.dart';
import '../../data/models/product_details.dart';

abstract class CategoriesRepo{
  Future<Either<Failure, CategoriesModel>>getAllCategories();
  Future<Either<Failure, CategoryProducts>>getCategoryProducts(int id);
  Future<Either<Failure, ProductDetails>>getProductDetails(int id);
}