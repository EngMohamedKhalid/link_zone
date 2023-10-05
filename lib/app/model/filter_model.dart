class FilterModel {
  List<int> rate = [];
  String? price_from;
  String? price_to;
  String? best_selling;
  String? offer;
  String? wit_out_offer;

  FilterModel(
      {
        this.rate=const[],
        this.price_from,
        this.price_to,
        this.best_selling,
        this.offer,
        this.wit_out_offer,
      });

  Map<String, dynamic> toMap() {
    final map = {
      if(rate.isNotEmpty)"rate": rate.toString(),
      if(price_from!=null&&(price_from?.isNotEmpty??false))"price_from": price_from,
      if(price_to!=null&&(price_to?.isNotEmpty??false))"price_to": price_to,
      if(best_selling!=null)"best_selling": best_selling,
      if(offer!=null)"offer": offer,
      if(wit_out_offer!=null)"wit_out_offer": wit_out_offer,
    };
    return map;
  }
}