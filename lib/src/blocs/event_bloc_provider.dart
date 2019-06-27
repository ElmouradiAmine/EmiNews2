import 'package:flutter/material.dart';
import 'event_bloc.dart';
export 'event_bloc.dart';

class EventBlocProvider extends InheritedWidget{
  final bloc = EventBloc();

  EventBlocProvider({Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static EventBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(EventBlocProvider) as EventBlocProvider).bloc;
  }
}