import 'package:flutter/material.dart';
import 'src/app.dart';
import 'package:provider/provider.dart';
import 'src/resources/user_provider.dart';

void main() => runApp(ChangeNotifierProvider(
      builder: (_) => UserProvider.initialize(),
      child: MyApp(),
    ));
