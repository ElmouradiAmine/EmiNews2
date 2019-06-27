import 'package:flutter/material.dart';
import 'package:emi_news/src/blocs/event_bloc_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emi_news/src/models/event_model.dart';
import 'package:emi_news/src/ui/widgets/event_card.dart';

class EventList extends StatefulWidget {
  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> with SingleTickerProviderStateMixin {
  EventBloc _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = EventBlocProvider.of(context);


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
          stream: _bloc.getAllEvents(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
            if (snapshot.hasData){
              List<DocumentSnapshot> docs = snapshot.data.documents;
              List<EventModel> newsList = _bloc.mapToList(docList: docs);
              if (newsList.isNotEmpty) {
                return _buildList(newsList);
              } else {
                return Text("There is no news.");
              }
            }
            return Icon(Icons.language);

          }),
    );
  }


  ListView _buildList(List<EventModel> eventList){
    return ListView.builder(
        itemCount:  eventList.length,
        itemBuilder: (context,index){
          return EventCard(
              eventList[index]
          );
        });

  }
}
