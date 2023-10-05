import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../../../../app/error/failures.dart';
import '../../../../app/network/network_info.dart';
import '../../../../app/services/cache_service.dart';
import '../../../../app/utils/get_it_injection.dart';
import '../../../../app/utils/hanlders/repo_impl_callhandler.dart';
import '../../domain/repo/auth_repo.dart';
import '../data_source/auth_remote_data_source.dart';
import '../model/user_model.dart';

class AuthRepoImpl extends AuthRepo{
  final AuthRemoteDataSource authRemoteDataSource;
  final NetworkInfo networkInfo;

  AuthRepoImpl({required this.authRemoteDataSource, required this.networkInfo});
  @override
  Future<Either<Failure, UserModel>> signIn(Map<String, dynamic> map)async {
    return await RepoImplCallHandler<UserModel>(networkInfo)(() async {
      final result= await authRemoteDataSource.login(map);
      await getIt<CacheService>().setUserToken(token: result.token??"null");
      await getIt<CacheService>().saveUserData(encodedUser: json.encode(result.toJson()));
      return  result;
    });
  }

  @override
  Future<Either<Failure, String>> changePassword(Map<String, dynamic> map)async {
    return await RepoImplCallHandler<String>(networkInfo)(() async {
      final result = await authRemoteDataSource.changePassword(map);
      return result;
    });
  }

  @override
  Future<Either<Failure, UserModel>> getProfile()async {
    return await RepoImplCallHandler<UserModel>(networkInfo)(() async {
      final result = await authRemoteDataSource.getProfile();
      await getIt<CacheService>().setUserToken(token: result.token??"null");
      await getIt<CacheService>().saveUserData(encodedUser: json.encode(result.toJson()));
      return result;
    });
  }

  @override
  Future<Either<Failure, String>> logout()async {
    return await RepoImplCallHandler<String>(networkInfo)(() async {
      final result= await authRemoteDataSource.logout();
      await getIt<CacheService>().clear();
      return  result;
    });
  }

  @override
  Future<Either<Failure, UserModel>> register(Map<String, dynamic> map) async{
    return await RepoImplCallHandler<UserModel>(networkInfo)(() async {
      final result= await authRemoteDataSource.register(map);
      await getIt<CacheService>().setUserToken(token: result.token??"null");
      await getIt<CacheService>().saveUserData(encodedUser: json.encode(result.toJson()));
      return  result;
    });
  }

  @override
  Future<Either<Failure, UserModel>> updateProfile(Map<String, dynamic> map) async{
    return await RepoImplCallHandler<UserModel>(networkInfo)(() async {
      final result= await authRemoteDataSource.updateProfile(map);
      await getIt<CacheService>().setUserToken(token: result.token??"null");
      await getIt<CacheService>().saveUserData(encodedUser: json.encode(result.toJson()));
      return  result;
    });
  }

}