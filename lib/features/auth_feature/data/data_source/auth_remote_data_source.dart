

import '../../../../app/network/network_manager.dart';
import '../../../../app/utils/consts.dart';
import '../../../../app/utils/hanlders/remote_data_source_handler.dart';
import '../model/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(Map<String, dynamic> map);
  Future<UserModel> register(Map<String, dynamic> map);
  Future<String> logout();
  Future<UserModel> getProfile();
  Future<UserModel> updateProfile(Map<String, dynamic> map);
  Future<String> changePassword(Map<String, dynamic> map);
}

class AuthRemoteDataSourceImp implements AuthRemoteDataSource{
  final NetworkManager networkManager;

  AuthRemoteDataSourceImp({required this.networkManager});
  @override
  Future<UserModel> login(Map<String, dynamic> map)async {
    final res =  await networkManager.requestWithFormData(
        endPoint: kLogin,
      body:  map
    );
    final data =  await RemoteDataSourceCallHandler().handleFormData(res);
    return UserModel.fromMap(data.data);
  }

  @override
  Future<String> changePassword(Map<String, dynamic> map)async {
    final res =  await networkManager.requestWithFormData(
        endPoint: kChangePassword,
        body:  map
    );
    final data =  await RemoteDataSourceCallHandler().handleFormData(res);
    return data.msg??"";
  }

  @override
  Future<UserModel> getProfile()async {
    final res =  await networkManager.requestWithFormData(
        endPoint: kProfile,
    );
    final data =  await RemoteDataSourceCallHandler().handleFormData(res);
    return UserModel.fromMap(data.data);
  }
  //method: RequestMethod.delete,
  @override
  Future<String> logout() async {
    final res = await networkManager.requestWithFormData(
      endPoint: kLogOut,
      method: RequestMethod.post,
    );
    final data =  await RemoteDataSourceCallHandler().handleFormData(res);
    return data.msg??"";
  }

  @override
  Future<UserModel> register(Map<String, dynamic> map) async{
    final res =  await networkManager.requestWithFormData(
        endPoint: kRegister,
        body:  map
    );
    final data =  await RemoteDataSourceCallHandler().handleFormData(res);
    return UserModel.fromMap(data.data);
  }

  @override
  Future<UserModel> updateProfile(Map<String, dynamic> map)async {
    final res =  await networkManager.requestWithFormData(
        endPoint: kUpdateProfile,
        body:  map,
      method: RequestMethod.put
    );
    final data =  await RemoteDataSourceCallHandler().handleFormData(res);
    return UserModel.fromMap(data.data);
  }

}