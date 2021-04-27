import 'package:flutter/material.dart';
import 'package:todo_flutter/utils/Constants.dart';
import 'package:todo_flutter/utils/ReusableWidgets.dart';
import 'package:todo_flutter/view/AddTaskScreen.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/model/TaskData.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 30,
        ),
        tooltip: 'Add new task',
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            // isScrollControlled: true,
            builder: (context) => AddTaskScreen(),
          );
        },
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                bottom: 50,
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
                      icon: Icon(Icons.menu),
                      color: kPrimaryColor,
                      iconSize: 30,
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Todo List',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Tasks ${Provider.of<TaskData>(context).tasksCount}',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Completed ${Provider.of<TaskData>(context).tasksCompleted}',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Remaining ${Provider.of<TaskData>(context).remainingTasks}',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ],
                  )
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
                child: TaskListBuilder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
