import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MessageStoreService{
  var rand = Random().nextInt(800000000);
  static storeMessage({ String? userMessage ,  String? name ,   String? chatId , }){
    FirebaseAuth user = FirebaseAuth.instance;
    var rand = Random().nextInt(800000000);
    CollectionReference messageRef = FirebaseFirestore.instance.collection('chatroom').doc(chatId).collection('chats');
    messageRef.doc(rand.toString()+user.currentUser!.uid).set({
      "message":userMessage,
      "userEmail":user.currentUser!.email,
      "userid":user.currentUser!.uid,
      "time": DateTime.now(),
      "name":name,
    });
  }
}
