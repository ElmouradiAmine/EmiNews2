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

        String title = document.data["title"] ?? "";
        String description = document.data["description"]?? "";
        String body = document.data["body"]?? "";
        String date = document.data["date"]?? "";
        String authorName = document.data["author"]?? "";

        newsList.add(NewsModel(title, description,body,date,authorName));

        return newsList;
      });
    }
    return newsList;
  }


  void dispose(){}


}