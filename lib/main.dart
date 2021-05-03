import 'package:flutter/material.dart';
import 'package:todo_flutter/model/CategoryData.dart';
import 'package:todo_flutter/view/AddTaskScreen.dart';
import 'package:todo_flutter/view/MenuScreenView.dart';
import 'package:todo_flutter/view/TaskScreen.dart';
import 'package:provider/provider.dart';
import 'model/TaskData.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CategoryData(),
        ),
        ChangeNotifierProvider(create: (context) => TaskData()),
        Provider(create: (context) => AddTaskScreen()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Monserrat',
      ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => MenuScreenView(),
        '/ts_all': (context) => TaskScreen(),
        '/ts_work': (context) => TaskScreen(),
        '/ts_home': (context) => TaskScreen(),
        '/ts_study': (context) => TaskScreen(),
        '/ts_gym': (context) => TaskScreen(),
        '/ts_shop': (context) => TaskScreen(),
      },
    );
  }
}
