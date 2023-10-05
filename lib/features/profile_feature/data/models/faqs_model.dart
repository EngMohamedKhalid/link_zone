class FAQSModel{
  List <FaqsDataModel> data = [];

  FAQSModel({this.data = const []});

  FAQSModel.fromJson(dynamic json){
    if(json["data"] !=null){
      data=[];
      json['data'].forEach((v) {
        data.add(FaqsDataModel.fromJson(v));
      });
    }
  }
}
class FaqsDataModel{
  num? id;
  String?question;
  String?answer;

  FaqsDataModel({this.id, this.question, this.answer});

  FaqsDataModel.fromJson(dynamic json){
    id = json["id"];
    question = json["question"];
    answer = json["answer"];
  }
}