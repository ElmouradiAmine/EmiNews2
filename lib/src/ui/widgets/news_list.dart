import 'package:flutter/material.dart';
import 'package:emi_news/src/blocs/news_bloc_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emi_news/src/models/news_model.dart';
import 'package:emi_news/src/ui/widgets/news_card.dart';

class NewsList extends StatefulWidget {
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  NewsBloc _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = NewsBlocProvider.of(context);
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0, 0),
      child: StreamBuilder<QuerySnapshot>(
          stream: _bloc.getAllNews(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
            if (snapshot.hasData){
              List<DocumentSnapshot> docs = snapshot.data.documents;
              List<NewsModel> newsList = _bloc.mapToList(docList: docs);
              if (newsList.isNotEmpty) {
                return _buildList(newsList);
              } else {
                return Text("There is no news");
              }
            }
            return Icon(Icons.language);

      }),
    );
  }


  ListView _buildList(List<NewsModel> newsList){
    return ListView.builder(
      itemCount:  newsList.length,
        itemBuilder: (context,index){
          return NewsCard(
            title: newsList[index].title,
            description: newsList[index].body,
          );
        });

  }
}
