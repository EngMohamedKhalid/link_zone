import '../../../../app/network/network_manager.dart';
import '../../../../app/utils/consts.dart';
import '../../../../app/utils/hanlders/remote_data_source_handler.dart';
import '../models/home_model.dart';

abstract class HomeRemoteDataSource {
  /// Calls the [Get] {home} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<HomeModel> getHomeData();

}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final NetworkManager networkManager;

  HomeRemoteDataSourceImpl({required this.networkManager});

  @override
  Future<HomeModel> getHomeData() async {
    final res = await networkManager.requestWithFormData(
      endPoint: kHome,
      method: RequestMethod.get,
    );
    final data =  await RemoteDataSourceCallHandler().handleFormData(res);
    return HomeModel.fromJson(data.data);
  }

}