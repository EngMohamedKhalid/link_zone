class NotificationModel {
  NotificationModel({
      this.id, 
      this.type, 
      this.title, 
      this.body, 
      this.data, 
      this.createdAt,});

  NotificationModel.fromJson(dynamic json) {
    id = json['id'];
    type = json['type'];
    title = json['title'];
    body = json['body'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    createdAt = json['created_at'];
  }
  String? id;
  String? type;
  String? title;
  String? body;
  Data? data;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['type'] = type;
    map['title'] = title;
    map['body'] = body;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['created_at'] = createdAt;
    return map;
  }

}

class Data {
  Data({
      this.sender, 
      this.senderModel, 
      this.bodyAr, 
      this.bodyEn, 
      this.type,});

  Data.fromJson(dynamic json) {
    sender = json['sender'];
    senderModel = json['sender_model'];
    bodyAr = json['body_ar'];
    bodyEn = json['body_en'];
    type = json['type'];
  }
  String? sender;
  String? senderModel;
  String? bodyAr;
  String? bodyEn;
  String? type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sender'] = sender;
    map['sender_model'] = senderModel;
    map['body_ar'] = bodyAr;
    map['body_en'] = bodyEn;
    map['type'] = type;
    return map;
  }

}