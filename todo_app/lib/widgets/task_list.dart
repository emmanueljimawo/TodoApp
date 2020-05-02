import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/widgets/task_tile.dart';
import 'package:todo_app/models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            onLongPress: () {
              Provider.of<TaskData>(context).taskDelete(taskData.tasks[index]);
            },
            child: TaskTile(
                taskTitle: taskData.tasks[index].name,
                isChecked: taskData.tasks[index].isDone,
                checkboxCallback: (value) {
                  Provider.of<TaskData>(context)
                      .checkbox(taskData.tasks[index]);
                }),
          );
        },
        itemCount: taskData.taskCount,
      );
    });
  }
}
