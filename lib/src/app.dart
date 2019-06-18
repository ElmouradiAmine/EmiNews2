import 'package:flutter/material.dart';
import 'package:emi_news/src/resources/repository.dart';
import 'package:emi_news/src/blocs/news_bloc_provider.dart';
import 'package:emi_news/src/ui/home_page.dart';

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
    return NewsBlocProvider(
      child: MaterialApp(
        theme: ThemeData(
          // to be defined here
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("EmiNews"),
          ),
          body: HomePage(),
        ),

      ),

    );
  }
}
