import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:emi_news/src/models/news_model.dart';

class NewsDetails extends StatelessWidget {
  final NewsModel _newsModel;

  const NewsDetails(this._newsModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.share),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.star),
          )
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/EMILogo.png"),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              "EmiNews",
              style: TextStyle(color: Colors.white, fontSize: 21),
            ),
          ],
        ),
        elevation: 5.0,
      ),
      body: ListView(

        children: <Widget>[
          CachedNetworkImage(
            height: 200,
            width: double.infinity,
            fit: BoxFit.fill,
            placeholder: (context, url) => Container(
                  height: 200,
                  width: double.infinity,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
            imageUrl: _newsModel.imgURL,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(_newsModel.title,style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 21.0

            ),),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(_newsModel.description, style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold
            ),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(_newsModel.date + " 19:52", style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,

            ),),
          ),
          //Text(_newsModel.authorName),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(_newsModel.body,style: TextStyle(
              fontSize: 16.0
            ),),
          ),
        ],
      ),
    );
  }
}
