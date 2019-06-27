import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:emi_news/src/ui/widgets/news_details.dart';
import 'package:emi_news/src/models/news_model.dart';

class NewsCard extends StatelessWidget {
  final NewsModel _newsModel;
  final String imgUrl =
      "https://www.emi.ac.ma/images/stories/baniere12112012/SNC102700.jpg";

  NewsCard(this._newsModel);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3.0,horizontal: 4.0),
      child: GestureDetector(
        onTap: (){
          pushToNewsDetails(context);
        },
        child: Stack(
          children: <Widget>[
            Material(
              elevation: 5.0,
              child: Container(
                height: 200,
                width: double.infinity,
              ),
            ),
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
            Container(
              height: 200,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 4.0,horizontal: 8.0),
                    child: Text(' ${_newsModel.views} vues • Il y a 1 heure',style: TextStyle(
                      color: Colors.white
                          ,
                      fontSize: 12
                    ),),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 4.0,horizontal: 8.0),
                    color: Colors.black.withOpacity(0.6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(_newsModel.title,style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),),
                        Text(_newsModel.description,style: TextStyle(
                          color: Colors.white
                        ),),
                      ],
                    )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void pushToNewsDetails(context){
    Navigator.push(context,MaterialPageRoute(builder: (context){
      return NewsDetails(_newsModel);

    }));
  }
}
