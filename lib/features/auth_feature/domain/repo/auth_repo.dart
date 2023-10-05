import 'package:dartz/dartz.dart';

import '../../../../app/error/failures.dart';
import '../../data/model/user_model.dart';

abstract class AuthRepo{
  Future<Either<Failure, UserModel>>signIn(Map<String,dynamic> map);
  Future<Either<Failure, UserModel>>register(Map<String,dynamic> map);
  Future<Either<Failure, String>>logout();
  Future<Either<Failure, UserModel>>getProfile();
  Future<Either<Failure, UserModel>>updateProfile(Map<String,dynamic> map);
  Future<Either<Failure, String>>changePassword(Map<String,dynamic> map);
}