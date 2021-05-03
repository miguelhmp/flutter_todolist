import 'dart:collection';

import 'package:flutter/material.dart';
import 'Task.dart';

class TaskData extends ChangeNotifier {
  //DO NOT USE task.add(Task(....) isn't work with provider
  //cause it don't listen (notifyListeners()), instead use
  // the method "addTask".
  List<Task> _tasks = [
    Task(taskTitle: 'Study1', from: 'Study'),
    Task(taskTitle: 'Study2', from: 'Study'),
    Task(taskTitle: 'Home1', from: 'Home'),
    Task(taskTitle: 'Work1', from: 'Work'),
    Task(taskTitle: 'GYM1', from: 'GYM'),
    Task(taskTitle: 'Shop1', from: 'Shop'),
    Task(taskTitle: 'Shop2', from: 'Shop'),
    Task(taskTitle: 'Shop3', from: 'Shop'),
    Task(taskTitle: 'Work2', from: 'Work'),
    Task(taskTitle: 'Study3', from: 'Study'),
  ];

  List<Task> newTasks = [];

  //No modificable List, only can get the value, no add or delete
  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  int get tasksCount {
    return _tasks.length;
  }

  int specificCount(List<Task> list) {
    return list.length;
  }

  int specificCompletedTasks(List<Task> list) {
    int completeTasks = 0;
    for (var task in list) {
      if (task.isDone) {
        completeTasks++;
      }
    }
    return completeTasks;
  }

  int specificRemainingTasks(List<Task> list) {
    int remainingTasks = 0;
    for (var task in list) {
      if (!task.isDone) {
        remainingTasks++;
      }
    }
    return remainingTasks;
  }

  List<Task> specificTasks(String category) {
    newTasks.clear();
    for (final task in _tasks) {
      if (task.from == category) {
        newTasks.add(task);
      }
    }
    return newTasks;
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

  void specifiToggleDone(int index) {
    newTasks[index].toggleDone();
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    //print('TaskDeleted');
    notifyListeners();
  }

  void specifiDeleteTask(var index) {
    _tasks.remove(index);
    //print('TaskDeleted');
    notifyListeners();
  }
}
