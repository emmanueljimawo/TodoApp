import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/screens/tasks_screen.dart';
import 'package:todo_app/provider/task_provider.dart';
import 'package:todo_app/widgets/task_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskDataProvider>(
      create: (BuildContext context) {
        return TaskDataProvider();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          cursorColor: Colors.amber,
          inputDecorationTheme: InputDecorationTheme(),
          accentColor: Colors.lightGreen,
        ),
        home: TasksScreen(),
      ),
    );
  }
}
