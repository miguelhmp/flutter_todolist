import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/model/Task.dart';
import 'package:todo_flutter/model/TaskData.dart';

class TaskListBuilder extends StatelessWidget {
  final String tasksFrom;
  List<Task> newTasks = [];

  TaskListBuilder({this.tasksFrom});
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        if (tasksFrom != 'All') {
          newTasks = taskData.specificTasks(tasksFrom);
        } else {
          newTasks = taskData.tasks;
        }
        return ListView.builder(
          itemBuilder: (context, index) {
            if (index < newTasks.length) {
              final task = newTasks[index];
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
                    tasksFrom == 'All'
                        ? taskData.toggleDone(index)
                        : taskData.specifiToggleDone(index);
                    print('clicked! $index');
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
                  tasksFrom == 'All'
                      ? taskData.deleteTask(index)
                      : taskData.specifiDeleteTask(task);
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              );
            } else {
              return null;
            }
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
