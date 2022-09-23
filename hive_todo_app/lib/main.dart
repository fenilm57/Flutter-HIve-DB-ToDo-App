import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_todo_app/homepage.dart';
import 'package:hive_todo_app/provider/todo_task_methods.dart';
import 'package:provider/provider.dart';

void main() async {
  //init hive
  await Hive.initFlutter();
  //open box
  var box = await Hive.openBox("mybox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: TodoMethods(),
          ),
        ],
        child: const HomePage(),
      ),
    );
  }
}
