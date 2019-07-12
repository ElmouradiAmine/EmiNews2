import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

class FirestoreProvider {
  Firestore _firestore = Firestore.instance;

  Future<int> authenticateUser(String email, String password) async {
    final QuerySnapshot result = await _firestore
        .collection("users")
        .where("email", isEqualTo: email)
        .getDocuments();
    final List<DocumentSnapshot> docs = result.documents;
    if (docs.length == 0) {
      return 0;
    } else {
      return 1;
    }
  }

  Future<void> registerUser(String email, String password) async {
    //TODO: CHECK IF THE EMAIL IS ALREADY USED
    return _firestore
        .collection("users")
        .document(email)
        .setData({'email': email, 'password': password, 'isAdmin': false});
  }



  Future<void> uploadArticle(String title, String description, String texte, String author, String imgUrl) async {
    return _firestore
        .collection("news").add({"title" : title , "description" : description,
          "author" : author,
      "imgURL": imgUrl,
      "body": texte,
      "date" : DateTime.now().toUtc().toIso8601String().substring(17),
      "brand": "emi",
      "brandLogoUrl" : "https://firebasestorage.googleapis.com/v0/b/eminews-534f3.appspot.com/o/logo%2FemiLogo.png?alt=media&token=e388fe40-0206-4763-9df5-ca8b8582014c",
      "views": Random().nextInt(1000) + 1000,
      "stars" : Random().nextInt(1000),
      "comments": Random().nextInt(1000),
    });

  }


  void createUser(Map data) {
    _firestore.collection("users").document(data["userId"]).setData(data);
  }


  Future<DocumentSnapshot> getUserData(String userId) async {
    return await _firestore.collection("users").document(userId).get();
  }


  Stream<QuerySnapshot> getAllNews() {
    return _firestore.collection("news").snapshots();
  }

  Stream<QuerySnapshot> getAllEvents(){
    return _firestore.collection("news").snapshots();
  }
}
