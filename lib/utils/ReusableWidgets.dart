import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/model/TaskData.dart';

class TaskListBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return Dismissible(
              key: UniqueKey(),
              background: Container(
                padding: EdgeInsets.all(15),
                color: Colors.red,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.delete,
                      size: 30,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              child: TaskBuilder(
                taskTitle: task.taskTitle,
                isChecked: task.isDone,
                checkBoxCallBack: (checkBoxState) {
                  taskData.toggleDone(index);
                },
              ),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                final snackBar = SnackBar(
                  backgroundColor: Colors.redAccent,
                  content: Row(
                    children: [
                      Text(
                        'Task ${task.taskTitle} Deleted',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
                taskData.deleteTask(index);
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            );
          },
          itemCount: taskData.tasksCount,
        );
      },
    );
  }
}

class TaskBuilder extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkBoxCallBack;
  //final Function longPress;

  TaskBuilder({this.taskTitle, this.isChecked, this.checkBoxCallBack});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      value: isChecked,
      onChanged: checkBoxCallBack,
    );
  }
}
