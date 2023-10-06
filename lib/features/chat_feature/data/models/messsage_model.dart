
class Message{
  final String message;
  final String email;
  Message(this.message, this.email , );

  factory Message.fromJson(jsonData){
    return Message(jsonData["message"] ,jsonData["userEmail"]  );
  }
}