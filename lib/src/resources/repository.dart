import 'package:cloud_firestore/cloud_firestore.dart';

import 'firestore_provider.dart';

class Repository {
  final FirestoreProvider _firestoreProvider = FirestoreProvider();

  Stream<QuerySnapshot> getAllNews() => _firestoreProvider.getAllNews();




}