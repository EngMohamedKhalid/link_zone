import 'package:dartz/dartz.dart';


import '../../../../app/error/failures.dart';
import '../../../../app/network/network_info.dart';
import '../../../../app/utils/hanlders/repo_impl_callhandler.dart';
import '../../domain/repo/profile_repo.dart';
import '../data_source/profile_remote_data_source.dart';
import '../models/faqs_model.dart';

class ProfileRepoImpl extends ProfileRepo{
  final ProfileRemoteDataSource profileRemoteDataSource;
  final NetworkInfo networkInfo;

  ProfileRepoImpl({required this.profileRemoteDataSource,required this.networkInfo});
  @override
  Future<Either<Failure, FAQSModel>> getFaqs() async{
    return await RepoImplCallHandler<FAQSModel>(networkInfo)(() async {
      final result = await profileRemoteDataSource.getFaqs();
      return result;
    });
  }

  @override
  Future<Either<Failure, String>> sendComplaint(Map<String, dynamic> map) async{
    return await RepoImplCallHandler<String>(networkInfo)(() async {
      final result = await profileRemoteDataSource.sendComplaint(map);
      return result;
    });
  }

}