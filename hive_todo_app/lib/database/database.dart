import 'package:hive/hive.dart';

class TodoDatabase {
  List todoList = [];
  final _mybox = Hive.box('mybox');

  void createInitialData() {
    todoList = [
      ["Make Tea", false]
    ];
  }

  void loadData() {
    todoList = _mybox.get("TODOLIST");
  }

  void updateData() {
    _mybox.put("TODOLIST", todoList);
  }
}
