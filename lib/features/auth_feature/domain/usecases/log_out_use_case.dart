import 'package:dartz/dartz.dart';

import '../../../../app/error/failures.dart';
import '../../../../app/usecase/usecase.dart';
import '../repo/auth_repo.dart';

class LogOutUseCase implements UseCase<String,NoParams>{
  final AuthRepo authRepo;

  LogOutUseCase({required this.authRepo});

  @override
  Future<Either<Failure, String>> call(NoParams params) {
    return authRepo.logout();
  }

}