import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/usecase/usecase.dart';
import '../../../../../app/utils/get_it_injection.dart';
import '../../../../../app/utils/hanlders/error_state_handler.dart';
import '../../../../../app/utils/navigation_helper.dart';
import '../../../data/model/notification_model.dart';
import '../../../domain/usecases/get_notifications_usecase.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());
  static NotificationCubit get() => BlocProvider.of(getIt<NavHelper>().navigatorKey.currentState!.context);

  List<NotificationModel> ? notificationsList;

  void getAllNotifications()async{
    emit(NotificationLoading());
    var response = await getIt<GetNotificationsUseCase>()(NoParams());

    response.fold(
      errorStateHandler,
            (r) {
         notificationsList=r;
            },
    );
    emit(NotificationInitial());
  }



}
