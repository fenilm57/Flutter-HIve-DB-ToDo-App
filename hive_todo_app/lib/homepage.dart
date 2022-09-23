import 'package:flutter/material.dart';
import 'package:hive_todo_app/widgets/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List todoList = [
    ["Goto Gym", true],
    ["Eat Snacks", false],
  ];

  void checkBoxChange(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TO DO'),
        elevation: 0,
      ),
      backgroundColor: Colors.yellow[200],
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) => ToDoTile(
          name: todoList[index][0],
          checked: todoList[index][1],
          function: (value) => checkBoxChange(value, index),
        ),
      ),
    );
  }
}
