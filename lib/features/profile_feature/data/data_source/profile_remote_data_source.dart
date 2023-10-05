

import '../../../../app/network/network_manager.dart';
import '../../../../app/utils/consts.dart';
import '../../../../app/utils/hanlders/remote_data_source_handler.dart';
import '../models/faqs_model.dart';

abstract class ProfileRemoteDataSource{
  Future<String> sendComplaint(Map<String,dynamic> map);
  Future<FAQSModel> getFaqs();
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource{
  final NetworkManager networkManager;

  ProfileRemoteDataSourceImpl({required this.networkManager});

  @override
  Future<FAQSModel> getFaqs()async {
    final res =  await networkManager.requestWithFormData(
        endPoint: kFaqs,
      method: RequestMethod.get
    );
    final data =  await RemoteDataSourceCallHandler().handleFormData(res);
    return FAQSModel.fromJson(data.data);
  }

  @override
  Future<String> sendComplaint(Map<String, dynamic> map) async{
    final res =  await networkManager.requestWithFormData(
        endPoint: kComplaints,
        body:  map
    );
    final data =  await RemoteDataSourceCallHandler().handleFormData(res);
    return data.msg??"";
  }

}