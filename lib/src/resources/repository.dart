import 'package:cloud_firestore/cloud_firestore.dart';

import 'firestore_provider.dart';

class Repository {
  final FirestoreProvider _firestoreProvider = FirestoreProvider();

  Stream<QuerySnapshot> getAllNews() => _firestoreProvider.getAllNews();



  Future<int> authenticateUser(String email, String password) =>
      _firestoreProvider.authenticateUser(email, password);

  Future<void> registerUser(String email, String password) =>
      _firestoreProvider.registerUser(email, password);



}