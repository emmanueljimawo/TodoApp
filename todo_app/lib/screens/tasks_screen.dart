import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Container(
        padding: EdgeInsets.only(
          left: 30.0,
          top: 60.0,
          right: 30.0,
          bottom: 30.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 30.0,
              child: Icon(
                Icons.list,
                color: Colors.lightBlueAccent,
                size: 30.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'TodoApp',
              style: TextStyle(
                color: Colors.white,
                fontSize: 50.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              '12 Tasks',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
            Container(
              height: 300,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
