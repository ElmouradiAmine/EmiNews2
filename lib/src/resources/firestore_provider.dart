import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreProvider {
  Firestore _firestore = Firestore.instance;

  Stream<QuerySnapshot> getAllNews() {
    return _firestore.collection("news").snapshots();
  }
}
