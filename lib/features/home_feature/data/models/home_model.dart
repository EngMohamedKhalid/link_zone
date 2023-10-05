
import '../../../categories_feature/data/models/product_details.dart';

class HomeModel{
  List<Banners> banners =[];
  List<ProductDetails> homeProducts =[];

  HomeModel({this.banners=const [], this.homeProducts= const []});

  HomeModel.fromJson(dynamic json){
    if (json['banners'] != null) {
      banners = [];
      json['banners'].forEach((v) {
        banners.add(Banners.fromJson(v));
      });
    }

    if (json['products'] != null) {
      homeProducts = [];
      json['products'].forEach((v) {
        homeProducts.add(ProductDetails.fromJson(v));
      });
    }
  }
}



class Banners {
  Banners({
    this.id,
    this.image,});

  Banners.fromJson(dynamic json) {
    id = json['id'];
    image = json['image'];
  }
  num? id;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['image'] = image;
    return map;
  }

}