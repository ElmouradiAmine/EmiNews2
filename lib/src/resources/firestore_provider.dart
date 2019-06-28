import 'package:cloud_firestore/cloud_firestore.dart';

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
