import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/provider/task_provider.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String name;
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightGreen,
              ),
            ),
            TextField(
              style: TextStyle(
                fontSize: 24,
                color: Colors.black45,
              ),
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.amber,
                ),
              )),
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                name = value;
              },
            ),
            FlatButton(
              color: Colors.lightGreen,
              child: Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Provider.of<TaskDataProvider>(context, listen: false)
                    .addTask(Task(name: name));
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
