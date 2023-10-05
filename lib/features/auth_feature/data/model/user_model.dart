import 'dart:convert';

import '../../../../app/error/exceptions.dart';

class UserModel{
  num? id;
  num? points;
  num? credit;
  String? name;
  String? email;
  String? phone;
  String? image;
  String? token;
  String? deviceToken;

  UserModel(
      {this.id,
        this.credit,
        this.points,
      this.name,
      this.email,
      this.phone,
      this.image,
      this.token,
      this.deviceToken}
      );

  UserModel.fromMap(dynamic json){
    id = json['id'];
    points = json['points'];
    credit = json['credit'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    token = json['token'];
    image = json['image'];
    deviceToken = json["device_token"];
  }

  Map<String, dynamic>toJson(){
    final map = <String, dynamic>{};
    map['id']= id ;
    map['credit']= credit ;
    map['points']= points ;
    map['name']=name ;
    map['email']= email;
    map['phone']=  phone;
    map['token']=  token;
    map['image']=   image ;
    map["device_token"]=  deviceToken;
    return map;
  }

  factory UserModel.fromJson(String source) {
    try {
      return UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
    } catch (e) {
      throw DataParsingException(e.toString());
    }
  }


}