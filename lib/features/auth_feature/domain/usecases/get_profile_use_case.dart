import 'package:dartz/dartz.dart';
import '../../../../app/error/failures.dart';
import '../../../../app/usecase/usecase.dart';
import '../../data/model/user_model.dart';
import '../repo/auth_repo.dart';

class GetProfileUseCase implements UseCase<UserModel,NoParams>{
  final AuthRepo authRepo;

  GetProfileUseCase({required this.authRepo});

  @override
  Future<Either<Failure, UserModel>> call(NoParams params) {
   return authRepo.getProfile();
  }

}