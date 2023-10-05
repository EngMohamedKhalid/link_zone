import 'package:dartz/dartz.dart';
import '../../../../app/error/failures.dart';
import '../../../../app/usecase/usecase.dart';
import '../../data/models/home_model.dart';
import '../repo/home_repo.dart';

class GetHomeDataUseCase implements UseCase<HomeModel, NoParams> {
  final HomeRepo repository;

  GetHomeDataUseCase({required this.repository});

  @override
  Future<Either<Failure, HomeModel>> call(NoParams params) async{
    return await repository.getHomeData();
  }
}