import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EmiNews',
      home: Scaffold(
        appBar: AppBar(
          title: Text('EmiNews'),
        ),
      ),
    );
  }
}
