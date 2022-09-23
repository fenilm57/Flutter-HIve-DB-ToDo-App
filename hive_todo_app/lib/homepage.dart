import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_todo_app/database/database.dart';
import 'package:hive_todo_app/widgets/dialogbox.dart';
import 'package:hive_todo_app/widgets/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _mybox = Hive.box('mybox');

  TextEditingController _controller = TextEditingController();
  TodoDatabase db = TodoDatabase();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (_mybox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
  }

  void checkBoxChange(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateData();
  }

  void saveTask() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      _controller.clear();
    });
    db.updateData();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TO DO'),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return DialogBox(
                  controller: _controller,
                  save: saveTask,
                  cancel: () => Navigator.pop(context),
                );
              });
        },
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.yellow[200],
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) => ToDoTile(
          name: db.todoList[index][0],
          checked: db.todoList[index][1],
          function: (value) => checkBoxChange(value, index),
          deleteTask: (context) {
            setState(() {
              db.todoList.removeAt(index);
            });
            db.updateData();
          },
        ),
      ),
    );
  }
}
