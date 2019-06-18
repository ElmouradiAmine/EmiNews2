import 'package:flutter/material.dart';
import 'news_bloc.dart';
export 'news_bloc.dart';

class NewsBlocProvider extends InheritedWidget{
  final bloc = NewsBloc();

  NewsBlocProvider({Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static NewsBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(NewsBlocProvider) as NewsBlocProvider).bloc;
  }
}