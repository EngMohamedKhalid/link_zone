import 'package:dartz/dartz.dart';
import '../../../../app/error/failures.dart';
import '../../../../app/usecase/usecase.dart';
import '../../data/models/categories_model.dart';
import '../../data/models/category_products.dart';
import '../repo/categories_repo.dart';


class GetAllCategoryProductsUseCase implements UseCase<CategoryProducts, GetAllCategoryProductsUseCaseParams> {
  final CategoriesRepo repository;

  GetAllCategoryProductsUseCase({required this.repository});

  @override
  Future<Either<Failure, CategoryProducts>> call(GetAllCategoryProductsUseCaseParams params) async{
    return await repository.getCategoryProducts(params.id);
  }
}

class GetAllCategoryProductsUseCaseParams {
  final int id;

  GetAllCategoryProductsUseCaseParams({required this.id});

}
