import 'package:flutter/cupertino.dart';
import 'package:hive_todo_app/database/database.dart';

class TodoMethods extends ChangeNotifier {
  TodoDatabase db = new TodoDatabase();

  void saveTask(String text) {
    db.todoList.add([text, false]);
    db.updateData();
    notifyListeners();
  }
}
