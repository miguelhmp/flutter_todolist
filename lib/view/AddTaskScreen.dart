import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:todo_flutter/model/TaskData.dart';
import 'package:todo_flutter/utils/Constants.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/utils/widgets/newTaskExtraField.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController textEditingController = new TextEditingController();
  String newTaskTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      width: double.maxFinite,
      height: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'New Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: TextField(
                            autofocus: true,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            decoration: InputDecoration(
                              labelText: 'What are you planning?',
                              // hintText: 'What are you planning?',
                            ),
                            controller: textEditingController,
                            onChanged: (value) {
                              newTaskTitle = value;
                              // textEditingController.text = newTaskTitle;
                              // print('nwv: $newTaskTitle');
                            },
                            maxLines: 5,
                          ),
                        ),
                        NewTaskExtraField(
                          icon: LineIcons.bell,
                          title: 'Set date',
                        ),
                        NewTaskExtraField(
                          icon: LineIcons.stickyNote,
                          title: 'Add note',
                        ),
                        NewTaskExtraField(
                          icon: LineIcons.tag,
                          title: 'Category',
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            color: kPrimaryColor,
                            child: TextButton(
                              child: Text(
                                'Create new task'.toUpperCase(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                if (newTaskTitle != null) {
                                  if (newTaskTitle.trim().length > 0) {
                                    Provider.of<TaskData>(context,
                                            listen: false)
                                        .addTask(newTaskTitle);
                                    // Navigator.pop(context);
                                    Navigator.pop(context);
                                  }
                                }
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
