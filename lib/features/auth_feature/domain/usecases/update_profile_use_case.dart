import 'package:dartz/dartz.dart';

import '../../../../app/error/failures.dart';
import '../../../../app/usecase/usecase.dart';
import '../../data/model/user_model.dart';
import '../repo/auth_repo.dart';

class UpdateProfileUseCase implements UseCase<UserModel , UpdateProfileUseCaseParams>{
  final AuthRepo authRepo ;
  UpdateProfileUseCase({required this.authRepo});
  @override
  Future<Either<Failure, UserModel>> call(UpdateProfileUseCaseParams params) {
    return authRepo.updateProfile(params.toMap());
  }

}
class UpdateProfileUseCaseParams{
  final String? name;
  final String ?phone;
  final String ?email;
  final String ?password;
  final String ?image;

  UpdateProfileUseCaseParams(
      { this.name,  this.phone,  this.email,  this.password,  this.image});


  Map<String ,dynamic> toMap(){
    final map={
      "name":name,
      "phone":phone,
      "email":email,
      "password":password,
      "image":image,
    };
    return map;
}
}