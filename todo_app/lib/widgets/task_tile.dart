import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;
  TaskTile({this.isChecked, this.taskTitle, this.checkboxCallback});

  // void checkboxCallback(value) {
//    setState(() {
//      this.isChecked = value;
//    });
  // }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightGreen,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
    );
  }
}
