import 'package:flutter/material.dart';
import 'package:emi_news/src/blocs/news_bloc.dart';
import 'package:emi_news/src/blocs/news_bloc_provider.dart';
import 'package:emi_news/src/ui/widgets/news_list.dart';
import 'package:emi_news/src/ui/widgets/drawer.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EmiNews'),
      ),
      drawer: MyDrawer(),
      body: Container(
        alignment: Alignment(0, 0),
        child: NewsList(),
      ),
    );
  }
}
