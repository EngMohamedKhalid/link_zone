import 'package:dartz/dartz.dart';

import '../../../../app/error/failures.dart';
import '../../../../app/usecase/usecase.dart';
import '../../data/model/user_model.dart';
import '../repo/auth_repo.dart';

class LogInUseCase implements UseCase<UserModel ,LoginUseCaseParams>{
  final AuthRepo authRepo;

  LogInUseCase({required this.authRepo});
  @override
  Future<Either<Failure, UserModel>> call(params) async {
   return await authRepo.signIn(params.toMap());
  }

}




class LoginUseCaseParams{
  final String email;
  final String password;

  LoginUseCaseParams({required  this.password,required this.email});

  Map<String, dynamic> toMap() {
    final map = {
     "email":email,
     "password":password,
    };
    return map;
  }

}