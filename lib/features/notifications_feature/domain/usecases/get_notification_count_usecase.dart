import 'package:dartz/dartz.dart';

import '../../../../app/error/failures.dart';
import '../../../../app/usecase/usecase.dart';
import '../repo/notification_repo.dart';

class GetNotificationCountUseCase implements UseCase<String, NoParams> {
  final NotificationRepo repository;

  GetNotificationCountUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call(NoParams params) async{
    return await repository.getNotificationCount();
  }

}
