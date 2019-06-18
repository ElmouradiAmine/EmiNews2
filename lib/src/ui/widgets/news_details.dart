import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:emi_news/src/models/news_model.dart';

class NewsDetails extends StatelessWidget {
  final NewsModel _newsModel;

  final String imgUrl =
      "https://www.emi.ac.ma/images/stories/baniere12112012/SNC102700.jpg";

  const NewsDetails(this._newsModel);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EmiNews"),
      ),
      body: Container(
        child: Column(
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
              imageUrl: imgUrl,
            ),
            Text(_newsModel.title),
            Text(_newsModel.description),
            Text(_newsModel.date),
            Text(_newsModel.authorName),
            Text(_newsModel.body),

          ],
        ),
      ),
    );
  }
}
