import 'package:dartz/dartz.dart';
import '../../../../app/error/failures.dart';
import '../../data/model/notification_model.dart';

abstract  class NotificationRepo{
  Future<Either<Failure, List<NotificationModel>>>getNotifications();
  Future<Either<Failure, String>>getNotificationCount();
}