import 'package:dartz/dartz.dart';

import '../../../../app/error/failures.dart';
import '../../../../app/usecase/usecase.dart';
import '../../data/model/user_model.dart';
import '../repo/auth_repo.dart';

class RegisterUseCase implements UseCase<UserModel ,RegisterUseCaseParams>{
  final AuthRepo authRepo;

  RegisterUseCase({required this.authRepo});
  @override
  Future<Either<Failure, UserModel>> call(params) async {
    return await authRepo.register(params.toMap());
  }

}




class RegisterUseCaseParams{
  final String name;
  final String phone;
  final String password;
  final String email;

  RegisterUseCaseParams({required this.name ,required this.phone,required  this.password,required this.email});

  Map<String, dynamic> toMap() {
    final map = {
      "name":name,
      "phone":phone,
      "password":password,
      "email":email,
    };
    return map;
  }

}