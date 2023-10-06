import '../../../../app/network/network_manager.dart';
import '../../../../app/utils/consts.dart';
import '../../../../app/utils/hanlders/remote_data_source_handler.dart';
import '../model/notification_model.dart';

abstract class NotificationRemoteDataSource {
  /// Calls the [Get] {guest/notifications} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<NotificationModel>> getNotifications();

  /// Calls the [GET] {guest/count-notifications} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<String> getNotificationCount();

}

class NotificationRemoteDataSourceImpl implements NotificationRemoteDataSource {
  final NetworkManager networkManager;

  NotificationRemoteDataSourceImpl({required this.networkManager});

  @override
  Future<List<NotificationModel>> getNotifications() async {
    final res = await networkManager.requestWithFormData(
      method: RequestMethod.get,
      endPoint: "kNotifications",

    );
    final data =  await RemoteDataSourceCallHandler().handleFormData(res);
    return ((data.data?['notifications']['data']??[]) as List).map((e) => NotificationModel.fromJson(e)).toList();
  }

  @override
  Future<String> getNotificationCount()async {
    final res = await networkManager.requestWithFormData(
      method: RequestMethod.get,
      endPoint: "kNotificationsCount",
    );
    final data =  await RemoteDataSourceCallHandler().handleFormData(res);
    return data.data?['count'].toString()??"";
  }

}
