import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/provider/task_provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:
          Provider.of<TaskDataProvider>(context, listen: false).fetchTasks(),
      builder: (context, snapshot) => snapshot.connectionState ==
              ConnectionState.done
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.lightGreen.withOpacity(0.5),
              ),
            )
          : Consumer<TaskDataProvider>(builder: (context, taskData, child) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onLongPress: () {
                      //taskData.taskDelete(taskData.tasks[index]);
                      taskData.delete(taskData.tasks[index].id);
                    },
                    child: Container(
                      margin: EdgeInsets.all(8.0),
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          border: Border.all(color: Colors.amber)
//                          border: Border(
//                            bottom: BorderSide(color: Colors.amber),
//                            top: BorderSide(color: Colors.amber),
//                            left: BorderSide(color: Colors.amber),
//                            right: BorderSide(color: Colors.amber),
//                          ),
                          ),
                      child: ListTile(
                        title: Text(
                          taskData.tasks[index].name,
                          style: TextStyle(
                              fontSize: 22,
                              color: taskData.tasks[index].isDone == false
                                  ? Colors.black45
                                  : Colors.lightGreen,
                              decoration: taskData.tasks[index].isDone == true
                                  ? TextDecoration.lineThrough
                                  : null),
                        ),
                        trailing: Checkbox(
                            value: taskData.tasks[index].isDone,
                            onChanged: (value) {
                              Provider.of<TaskDataProvider>(context,
                                      listen: false)
                                  .checkbox(Task(
                                id: taskData.tasks[index].id,
                                name: taskData.tasks[index].name,
                                isDone: value,
                              ));
                            }),
                      ),
                    ),
                  );
                },
                itemCount: taskData.taskCount,
              );
            }),
    );
  }
}
