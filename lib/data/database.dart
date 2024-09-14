import 'package:hive/hive.dart';

class ToDoDatabse {
  List toDoList = [];

  final mybox = Hive.box('tasks');

//first time running the app
  void createInitialData() {
    List toDoList = [
      ["TASK 1", false],
      ["TASK 2", false],
    ];
  }

  void loadData() {
    toDoList = mybox.get("todolist");
  }

  void updateDataBase() {
    mybox.put("todolist", toDoList);
  }
}
