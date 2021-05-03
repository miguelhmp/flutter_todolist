import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';
import 'package:todo_flutter/model/Task.dart';
import 'package:todo_flutter/utils/ReusableWidgets.dart';
import 'package:todo_flutter/utils/widgets/MyFAB.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/model/TaskData.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    if (arguments != null) print(arguments['icon']);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: arguments['bgColor'],
      floatingActionButton: MyFAB(
        typeOfFAB: 'simple',
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(LineIcons.arrowLeft),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
              bottom: 30,
              top: 15,
              left: 30,
              right: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: FaIcon(arguments['icon']),
                    color: arguments['bgColor'],
                    iconSize: 30,
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  arguments['title'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                Consumer<TaskData>(
                  builder: (context, taskData, child) {
                    List<Task> newTasks = [];
                    if (arguments['title'] != 'All') {
                      newTasks = taskData.specificTasks(arguments['title']);
                    } else {
                      newTasks = taskData.tasks;
                    }
                    return Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Tasks ${taskData.specificCount(newTasks)}',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Completed ${taskData.specificCompletedTasks(newTasks)}',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Remaining ${taskData.specificRemainingTasks(newTasks)}',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                top: 25,
                right: 25,
                bottom: 10,
                left: 25,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 10,
                    offset: Offset(0, -3), // Shadow position
                  ),
                ],
              ),
              child: TaskListBuilder(
                tasksFrom: arguments['title'],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
