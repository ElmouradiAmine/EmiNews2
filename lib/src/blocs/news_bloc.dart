import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:emi_news/src/resources/repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emi_news/src/models/news_model.dart';

class NewsBloc {
  final _repository = Repository();

  Stream<QuerySnapshot> getAllNews(){
    return _repository.getAllNews();
  }


  List mapToList({List<DocumentSnapshot> docList}){
    List<NewsModel> newsList = [];
    if (docList != null){

      docList.forEach((document){
        String title = document.data["title"];
        String body = document.data["body"];
        newsList.add(NewsModel(title, body));
        return newsList;
      });
    }
    return newsList;
  }



  void dispose(){}


}