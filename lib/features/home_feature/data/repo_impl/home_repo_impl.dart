import 'package:dartz/dartz.dart';
import '../../../../app/error/failures.dart';
import '../../../../app/network/network_info.dart';
import '../../../../app/utils/hanlders/repo_impl_callhandler.dart';
import '../../domain/repo/home_repo.dart';
import '../data_source/home_remote_data_source.dart';
import '../models/home_model.dart';

class HomeRepoImpl extends HomeRepo{
  final HomeRemoteDataSource homeRemoteDataSource;
  final NetworkInfo networkInfo;
  HomeRepoImpl({required this.homeRemoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, HomeModel>> getHomeData()async {
    return await RepoImplCallHandler<HomeModel>(networkInfo)(() async {
      return await homeRemoteDataSource.getHomeData();
    });
  }
}