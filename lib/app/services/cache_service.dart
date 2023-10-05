import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/auth_feature/data/model/user_model.dart';
import '../utils/get_it_injection.dart';

class CacheService {
  static const String userToken = "token";
  static const String FCM_TOKEN = "FcmToken";
  static const String OLD_FCM_TOKEN = "ExpiredFcmToken";
  final _prefs = getIt<SharedPreferences>();


  Future<bool> setUserToken({required String token}) async {
    return _prefs.setString(userToken, token);
  }
  String? getUserToken(){
    final String? token = _prefs.getString(userToken);
    debugPrint("getting userToken : $token");
    return token;
  }

  Future<bool> setFCMToken({required String fcmToken}) async {
    return _prefs.setString(FCM_TOKEN, fcmToken);
  }

  String? getFcmToken(){
    final String? token = _prefs.getString(FCM_TOKEN);
    debugPrint("getting fcmToken : $token");
    return token;
  }

  Future<String?> getOldFcmToken() async {
    final String? token = _prefs.getString(OLD_FCM_TOKEN);
    debugPrint("getting oldFcmToken : $token");
    return token;
  }

  Future<bool> updateToken({required String newFcmToken}) async {
    await _prefs.setString(OLD_FCM_TOKEN,  getFcmToken() ?? "");
    return _prefs.setString(FCM_TOKEN, newFcmToken);
  }

  Future<bool?> clear() async {
    try {
      return await _prefs.clear();
    } catch (e) {
      return null;
    }
  }

  Future<void> saveUserData({required String encodedUser,}) async {
    await _prefs.setString('user', encodedUser);
  }

  UserModel? getUserData() {
     final result = _prefs.getString('user');
     if(result !=null){
        return UserModel.fromMap(json.decode(result));
     }
     return null ;
  }

  Future<bool> setOnBoarding() async {
    return _prefs.setString("onBoarding", "onBoarding");
  }

   String? getOnBoarding() {
    final String? onBoarding = _prefs.getString("onBoarding");
    debugPrint("getting onBoarding : $onBoarding");
    return onBoarding;
  }
}
