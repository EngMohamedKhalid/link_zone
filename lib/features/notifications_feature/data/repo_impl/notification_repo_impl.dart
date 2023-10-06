import 'package:dartz/dartz.dart';

import '../../../../app/error/failures.dart';
import '../../../../app/network/network_info.dart';
import '../../../../app/utils/hanlders/repo_impl_callhandler.dart';
import '../../domain/repo/notification_repo.dart';
import '../data_source/notification_remote_data_source.dart';
import '../model/notification_model.dart';

class NotificationRepoImpl extends NotificationRepo{
  final NotificationRemoteDataSource notificationRemoteDataSource;
  final NetworkInfo networkInfo;
  NotificationRepoImpl({required this.notificationRemoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, String>> getNotificationCount() async{
    return await RepoImplCallHandler<String>(networkInfo)(() async {
      return await notificationRemoteDataSource.getNotificationCount();
    });
  }

  @override
  Future<Either<Failure, List<NotificationModel>>> getNotifications() async{
    return await RepoImplCallHandler<List<NotificationModel>>(networkInfo)(() async {
      return await notificationRemoteDataSource.getNotifications();
    });
  }



}