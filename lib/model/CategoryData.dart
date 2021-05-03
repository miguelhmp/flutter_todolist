import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo_flutter/utils/Constants.dart';
import 'package:todo_flutter/utils/widgets/buildCard.dart';

class CategoryData extends ChangeNotifier {
  List<BuildCard> _categories = [
    BuildCard(
      icon: FontAwesomeIcons.tasks,
      iconColor: kTaskDonelineThroughColor,
      title: 'All',
      tasks: '23 tasks',
      navUrl: '/ts_all',
      onPress: () {},
    ),
    BuildCard(
      icon: FontAwesomeIcons.briefcase,
      iconColor: Colors.deepOrangeAccent,
      title: 'Work',
      tasks: '9 tasks',
      navUrl: '/ts_work',
      onPress: () {},
    ),
    BuildCard(
      icon: FontAwesomeIcons.brain,
      iconColor: Colors.green,
      title: 'Study',
      tasks: '10 tasks',
      navUrl: '/ts_study',
      onPress: () {},
    ),
    BuildCard(
      icon: FontAwesomeIcons.home,
      iconColor: Colors.pink,
      title: 'Home',
      tasks: '10 tasks',
      navUrl: '/ts_home',
      onPress: () {},
    ),
    BuildCard(
      icon: FontAwesomeIcons.dumbbell,
      iconColor: Colors.red,
      title: 'GYM',
      tasks: '2 tasks',
      navUrl: '/ts_gym',
      onPress: () {},
    ),
    BuildCard(
      icon: FontAwesomeIcons.shoppingBasket,
      iconColor: Colors.yellow,
      title: 'Shop',
      tasks: '2 tasks',
      navUrl: '/ts_shop',
      onPress: () {},
    ),
  ];

  UnmodifiableListView<BuildCard> get categories =>
      UnmodifiableListView(_categories);

  int get categoriesLength {
    return _categories.length;
  }

  IconData get icon {
    return _categories[1].icon;
  }

  Color get bgColor {
    return _categories[1].iconColor;
  }

  String get title {
    return _categories[1].title;
  }
}
