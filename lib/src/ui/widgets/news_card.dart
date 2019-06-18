import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewsCard extends StatelessWidget {
  final String title;
  final String description;
  final String imgUrl =
      "https://www.emi.ac.ma/images/stories/baniere12112012/SNC102700.jpg";

  const NewsCard({Key key, this.title, this.description})
      : super(key: key); // placeholder for the moment

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0, right: 4.0, left: 4.0),
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
            imageUrl: imgUrl,
          ),
          Container(
            height: 200,
            width: double.infinity,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 4.0,horizontal: 8.0),
                color: Colors.black.withOpacity(0.4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(title,style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),),
                    Text(description,style: TextStyle(
                      color: Colors.white
                    ),),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
