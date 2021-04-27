import 'dart:collection';

import 'package:flutter/material.dart';
import 'Task.dart';

class TaskData extends ChangeNotifier {
  //DO NOT USE task.add(Task(....) isn't work with provider
  //cause it don't listen (notifyListeners()), instead use
  // the method "addTask".
  List<Task> _tasks = [
    Task(taskTitle: 'hhee'),
  ];

  //No modificable List, only can get the value, no add or delete
  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  int get tasksCount {
    return _tasks.length;
  }

  int get tasksCompleted {
    int completeTasks = 0;
    for (var task in _tasks) {
      if (task.isDone) {
        completeTasks++;
      }
    }
    return completeTasks;
  }

  int get remainingTasks {
    int remainingTasks = 0;
    for (var task in _tasks) {
      if (!task.isDone) {
        remainingTasks++;
      }
    }
    return remainingTasks;
  }

  void addTask(String taskTitle) {
    final newTask = Task(taskTitle: taskTitle);
    _tasks.add(newTask);
    notifyListeners();
  }

  void toggleDone(int index) {
    _tasks[index].toggleDone();
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    //print('TaskDeleted');
    notifyListeners();
  }
}
