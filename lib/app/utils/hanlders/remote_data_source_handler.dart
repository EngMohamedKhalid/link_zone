import 'dart:developer';
import 'package:http/http.dart';
import '../../../features/auth_feature/data/model/user_model.dart';
import '../../../features/auth_feature/presentation/screens/auth_screen.dart';
import '../../error/exceptions.dart';
import '../../model/global_response_model.dart';
import '../../services/cache_service.dart';
import '../get_it_injection.dart';
import '../helper.dart';

class RemoteDataSourceCallHandler {
  RemoteDataSourceCallHandler();

  Future<dynamic> call(Response res,) async {
    if (res.statusCode == 200) {
      GlobalResponseModel response ;
      response = GlobalResponseModel.fromJson(res.body.toString());
      if(response.success==false){
        throw ServerException(response.msg??"unknown Error");
      }else{
        return response.data??{};
      }
    } else {
      throw ServerException("unknown error");
    }
  }

  Future<GlobalResponseModel> handleFormData(StreamedResponse res,) async {
    log(res.statusCode.toString(),name: "status code");
    String responseData = await res.stream.bytesToString();
    log(responseData,name: "response body");
    if (res.statusCode == 200) {
      final response = GlobalResponseModel.fromJson(responseData);
      if(response.authError==true){
        await getIt<CacheService>().clear();
        navigateTo(AuthScreen(),removeAll: true);
        throw ServerException(response.msg ?? "unknown Error");
      }
      else if(response.success==false) {
        if(response.key=="needActive"){
          throw AuthException(response.msg??"unknown Error",user:UserModel.fromMap(response.data));
        }
        throw ServerException(response.msg ?? "unknown Error");
      }
      return response;
    } else {
      throw ServerException("unknown error${res.statusCode}");
    }
  }
}
