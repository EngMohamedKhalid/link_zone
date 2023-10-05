import 'package:dartz/dartz.dart';


import '../../../../app/error/failures.dart';
import '../../../../app/usecase/usecase.dart';
import '../repo/auth_repo.dart';

class ChangePasswordUseCase implements UseCase<String , ChangePasswordUseCaseParams >{
  final AuthRepo authRepo ;

  ChangePasswordUseCase({required this.authRepo});
  @override
  Future<Either<Failure, String>> call(ChangePasswordUseCaseParams params) {
   return authRepo.changePassword(params.toMap());
  }

}


class ChangePasswordUseCaseParams{
  final String currentPassword;
  final String newPassword;

  ChangePasswordUseCaseParams({required this.currentPassword,required  this.newPassword});

  Map<String,dynamic > toMap(){
    final map = {
      "current_password":currentPassword,
      "new_password":newPassword,
    };

    return map;
  }

}