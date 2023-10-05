import 'package:link_zone/features/categories_feature/data/models/product_details.dart';

class CategoryProducts{
  List <ProductDetails> categoryProducts = [];
  CategoryProducts({this.categoryProducts= const []});
  CategoryProducts.fromJson(dynamic json){
    if (json['data'] != null) {
      categoryProducts = [];
      json['data'].forEach((v) {
        categoryProducts.add(ProductDetails.fromJson(v));
      });
    }

  }
}


