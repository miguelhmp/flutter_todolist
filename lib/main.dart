import 'package:flutter/material.dart';
import 'package:todo_flutter/view/TaskScreen.dart';
import 'package:provider/provider.dart';
import 'model/TaskData.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Monserrat',
        ),
        initialRoute: '/',
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          '/': (context) => TaskScreen(),
          // When navigating to the "/second" route, build the SecondScreen widget.
          //'/second': (context) => SecondScreen(),
        },
      ),
    );
  }
}
