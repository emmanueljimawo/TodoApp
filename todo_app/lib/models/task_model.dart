import 'package:recase/recase.dart';

class Task {
  int id;
  String name;
  bool isDone;
  Task({this.id, this.name, this.isDone = false});

  factory Task.fromDatabaseJson(Map<String, dynamic> data) => Task(
        id: data['id'],
        name: data['name'],
        isDone: data['isDone'] == 1 ? true : false,
      );

  Map<String, dynamic> toDatabaseJson() => {
        "id": this.id,
        "name": ReCase(this.name).sentenceCase,
        "isDone": this.isDone == true ? 1 : 0,
      };
}
