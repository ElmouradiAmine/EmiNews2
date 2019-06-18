import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:emi_news/src/resources/repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewsBloc {
  final _repository = Repository();

  Stream<QuerySnapshot> getAllNews(){
    return _repository.getAllNews();
  }


  void dispose(){}


}