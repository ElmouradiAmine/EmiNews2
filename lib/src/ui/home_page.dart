import 'package:flutter/material.dart';
import 'package:emi_news/src/ui/widgets/news_list.dart';
import 'package:emi_news/src/ui/widgets/event_list.dart';
import 'package:emi_news/src/ui/widgets/drawer.dart';


class HomePage extends StatefulWidget {

  HomePage();
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabIndex);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabIndex);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabIndex() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.more_vert),
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
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 21
              ),
            ),
          ],
        ),
        elevation: 5.0,
        bottom: TabBar(
          indicatorColor: Colors.white,
          indicatorWeight: 3,
          controller: _tabController,
          tabs: <Tab>[
            Tab(child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.whatshot,color: Colors.red,),
                SizedBox(width: 10,),
                Text('Actualités',style: TextStyle(
                  fontSize: 18,

              ),)
              ],
            ),),
            Tab(child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.event_note,color: Colors.green,),
                SizedBox(width: 10,),
                Text('Evénements',style: TextStyle(
                  fontSize: 18

                ),)
              ],
            ),),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          NewsList(),
          EventList(),
        ],
      ),
    );
  }
}
