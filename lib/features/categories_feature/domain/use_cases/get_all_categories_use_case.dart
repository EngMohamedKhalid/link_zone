import 'package:dartz/dartz.dart';
import '../../../../app/error/failures.dart';
import '../../../../app/usecase/usecase.dart';
import '../../data/models/categories_model.dart';
import '../repo/categories_repo.dart';


class GetAllCategoriesUseCase implements UseCase<CategoriesModel, NoParams> {
  final CategoriesRepo repository;

  GetAllCategoriesUseCase({required this.repository});

  @override
  Future<Either<Failure, CategoriesModel>> call(NoParams params) async{
    return await repository.getAllCategories();
  }
}