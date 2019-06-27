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
        String imgURL = document.data["imgURL"]?? "";
        int views = document.data["views"]?? 0;
        int comments = document.data["comments"]?? 0;
        int stars = document.data["stars"]?? 0;
        String brand = document.data["brand"]?? "";
        String brandLogoUrl = document.data["brandLogoUrl"]?? "";


        newsList.add(NewsModel(title, description,body,date,authorName,imgURL,views,comments,stars,brand,brandLogoUrl));

        return newsList;
      });
    }
    return newsList;
  }


  //TODO: dont forget to close the streams if you ever going to use them
  void dispose(){}


}