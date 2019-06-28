import 'package:flutter/material.dart';
import 'package:emi_news/src/resources/repository.dart';
import 'package:emi_news/src/blocs/news_bloc_provider.dart';
import 'package:emi_news/src/blocs/event_bloc_provider.dart';
import 'package:emi_news/src/ui/home_page.dart';
import 'package:emi_news/src/ui/pages/login_page.dart';
import 'package:emi_news/src/blocs/login_bloc_provider.dart';

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Repository repository = Repository();

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return LoginBlocProvider(
      child: NewsBlocProvider(

        child: EventBlocProvider(child:MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            //TODO: Define a theme
          ),
          home: HomePage(),
        ),
      ),
      ));
  }
}
