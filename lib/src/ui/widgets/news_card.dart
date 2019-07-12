import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:emi_news/src/ui/widgets/news_details.dart';
import 'package:emi_news/src/models/news_model.dart';

class NewsCard extends StatelessWidget {
  final NewsModel _newsModel;
  NewsCard(this._newsModel);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 4.0),
      child: GestureDetector(
        onTap: () {
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
                    padding:
                        EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          ' ${_newsModel.views} vues',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        Expanded(child: Container()),
                        Icon(Icons.comment,color: Colors.blue,),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(_newsModel.comments.toString(),style: TextStyle(
                          color: Colors.white,

                        ),),

                        Icon(Icons.star,color: Colors.amber,),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(_newsModel.stars.toString(),style: TextStyle(
                          color: Colors.white,

                        ),),
                      ],
                    ),
                  ),
                  Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                      color: Colors.black.withOpacity(0.6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            _newsModel.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            _newsModel.description,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )),

                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle
                  ),
                  padding: EdgeInsets.all(3.0),
                  height: 40,
                  width: 40,
                  child: Image.network(_newsModel.brandLogoUrl),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void pushToNewsDetails(context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NewsDetails(_newsModel);
    }));
  }
}
