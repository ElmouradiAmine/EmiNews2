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
            child: Row(
              children: <Widget>[
                Text(
                  ' ${_newsModel.views} vues',
                  style: TextStyle( fontSize: 12),
                ),
                Expanded(child: Container()),
                Icon(Icons.comment,color: Colors.blue,),
                SizedBox(
                  width: 5.0,
                ),
                Text(_newsModel.comments.toString(),style: TextStyle(

                ),),

                Icon(Icons.star,color: Colors.amber,),
                SizedBox(
                  width: 5.0,
                ),
                Text(_newsModel.stars.toString(),style: TextStyle(

                ),),
              ],
            ),
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
            child: Text(_newsModel.date, style: TextStyle(
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Icon(Icons.person,color: Colors.white,),

                ),
                SizedBox(
                  width: 10.0,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text("@Auteur",style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold
                      ),),
                      Text(_newsModel.authorName,style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),),
                      Text('Jeune passionné par le monde infini de l\'information.',style: TextStyle(
                        color: Colors.grey,
                        fontStyle: FontStyle.italic
                      ),)
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black)
              ),
              child: Center(child: Text("Voir commentaires (${_newsModel.comments})")),
            ),
          ),
          SizedBox(
            height: 30.0,
          )
        ],
      ),
    );
  }


}
