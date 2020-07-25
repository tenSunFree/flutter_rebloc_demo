import 'package:flutter/material.dart';

import '../home/home_view.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: HomeScreen('Flutter Demo Home Page'));
}
