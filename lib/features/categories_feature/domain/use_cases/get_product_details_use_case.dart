import 'package:dartz/dartz.dart';
import '../../../../app/error/failures.dart';
import '../../../../app/usecase/usecase.dart';
import '../../data/models/categories_model.dart';
import '../../data/models/product_details.dart';
import '../repo/categories_repo.dart';


class GetProductDetailsUseCase implements UseCase<ProductDetails, GetProductDetailsUseCaseParams> {
  final CategoriesRepo repository;

  GetProductDetailsUseCase({required this.repository});

  @override
  Future<Either<Failure, ProductDetails>> call(GetProductDetailsUseCaseParams params) async{
    return await repository.getProductDetails(params.id);
  }
}

class GetProductDetailsUseCaseParams {
  final int id;

  GetProductDetailsUseCaseParams({required this.id});

}
