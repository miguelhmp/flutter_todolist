class Task {
  final String taskTitle;
  final String from;
  bool isDone;

  Task({this.taskTitle, this.isDone = false, this.from});

  void toggleDone() {
    isDone = !isDone;
  }
}
