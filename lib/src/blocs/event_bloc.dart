import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:emi_news/src/resources/repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emi_news/src/models/event_model.dart';

class EventBloc {
  final _repository = Repository();

  Stream<QuerySnapshot> getAllEvents(){
    return _repository.getAllNews();
  }


  List mapToList({List<DocumentSnapshot> docList}){
    List<EventModel> newsList = [];
    if (docList != null){
      docList.forEach((document){

        String title = document.data["title"] ?? "";
        String description = document.data["description"]?? "";
        String body = document.data["body"]?? "";
        String date = document.data["date"]?? "";
        String authorName = document.data["author"]?? "";

        newsList.add(EventModel(title, description,body,date,authorName));

        return newsList;
      });
    }
    return newsList;
  }


  //TODO: dont forget to close the streams if you ever going to use them
  void dispose(){}


}