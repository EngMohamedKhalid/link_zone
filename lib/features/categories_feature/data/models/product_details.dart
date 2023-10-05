class ProductDetails{
  num? id;
  num? discount;
  num? price ;
  num ?oldPrice ;
  String? image;
  String ?name;
  String ?desc;
  bool ? inFavorites;
  bool ? inCart;
  List<dynamic>? images;

  ProductDetails(
      {this.id,
        this.discount,
        this.price,
        this.oldPrice,
        this.image,
        this.name,
        this.inFavorites,
        this.images,
        this.inCart,
        this.desc});

  ProductDetails.fromJson(dynamic json){
    id = json["id"];
    price = json["price"];
    oldPrice = json["old_price"];
    discount = json["discount"];
    image = json["image"];
    name = json["name"];
    desc = json["description"];
    inFavorites = json["in_favorites"];
    inCart = json["in_cart"];
    images = json["images"];
  }
}