import 'package:dartz/dartz.dart';

import '../../../../app/error/failures.dart';
import '../../../../app/usecase/usecase.dart';
import '../../data/model/notification_model.dart';
import '../repo/notification_repo.dart';

class GetNotificationsUseCase implements UseCase<List<NotificationModel>, NoParams> {
  final NotificationRepo repository;

  GetNotificationsUseCase({required this.repository});

  @override
  Future<Either<Failure, List<NotificationModel>>> call(NoParams params) async{
    return await repository.getNotifications();
  }

}
