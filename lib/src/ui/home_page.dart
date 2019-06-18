import 'package:flutter/material.dart';
import 'package:emi_news/src/blocs/news_bloc.dart';
import 'package:emi_news/src/blocs/news_bloc_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NewsBloc _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = NewsBlocProvider.of(context);
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0, 0),
      child: StreamBuilder<QuerySnapshot>(
          stream: _bloc.getAllNews(),
          builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
            if(snapshot.hasData){
              List<DocumentSnapshot> docs = snapshot.data.documents;
              return Text(docs[0].data["title"]);
            }
            return Text("There is no data");

          }),
    );
  }
}
