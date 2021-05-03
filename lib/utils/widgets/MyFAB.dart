import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:line_icons/line_icons.dart';
import 'package:todo_flutter/view/AddTaskScreen.dart';

import '../Constants.dart';

class MyFAB extends StatelessWidget {
  final String typeOfFAB;
  Widget myFAB;

  MyFAB({@required this.typeOfFAB});

  @override
  Widget build(BuildContext context) {
    if (typeOfFAB == 'multi') {
      myFAB = buildMultiFab(context);
    } else if (typeOfFAB == 'simple') {
      myFAB = buildSimpleFAB(context);
    }
    return myFAB;
  }
}

SpeedDial buildMultiFab(BuildContext context) {
  return SpeedDial(
    backgroundColor: kPrimaryColor,
    icon: LineIcons.plus,
    foregroundColor: Colors.white,
    overlayColor: Colors.black,
    overlayOpacity: .5,
    activeIcon: Icons.close,
    activeBackgroundColor: Colors.blue,
    tooltip: 'More actions',
    children: [
      SpeedDialChild(
        child: Icon(LineIcons.tag),
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.white,
        label: 'add new category',
        onTap: () {},
      ),
      SpeedDialChild(
        child: Icon(LineIcons.pen),
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.white,
        label: 'add new taks',
        onTap: () {
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            isScrollControlled: true,
            builder: (context) => AddTaskScreen(),
          );
        },
      ),
    ],
  );
}

FloatingActionButton buildSimpleFAB(BuildContext context) {
  return FloatingActionButton(
    backgroundColor: kPrimaryColor,
    child: Icon(
      LineIcons.plus,
      // size: 20,
    ),
    tooltip: 'add new task',
    onPressed: () {
      showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        builder: (context) => AddTaskScreen(),
      );
    },
  );
}
