class CategoriesModel {
  List<CategoryModelData> categories = [];
  CategoriesModel ({this.categories = const []});

  CategoriesModel.fromJson(dynamic json){
    if (json['data'] != null) {
      categories = [];
      json['data'].forEach((v) {
        categories.add(CategoryModelData.fromJson(v));
      });
    }
  }
}


class CategoryModelData {
  CategoryModelData({
    this.id,
    this.name,
    this.image,});

  CategoryModelData.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
  num? id;
  String? name;
  String? image;

}