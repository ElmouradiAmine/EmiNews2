import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:emi_news/src/ui/widgets/news_details.dart';
import 'package:emi_news/src/models/event_model.dart';

class EventCard extends StatelessWidget {
  final EventModel _eventModel;
  final String imgUrl =
      "https://www.emi.ac.ma/images/stories/baniere12112012/SNC102700.jpg";

  EventCard(this._eventModel);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3.0,horizontal: 4.0),
      child: GestureDetector(
        onTap: (){
          pushToEventDetails(context);
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
                      Text(_eventModel.title,style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),),
                      Text(_eventModel.description,style: TextStyle(
                          color: Colors.white
                      ),),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void pushToEventDetails(context){
    //TODO: PUSH TO THE EVENT DETAILS

  }
}
