import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String name;
  final bool checked;
  Function(bool?)? function;
  Function(BuildContext)? deleteTask;

  ToDoTile({
    Key? key,
    required this.name,
    required this.checked,
    this.function,
    this.deleteTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteTask,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.yellow,
          ),
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Row(
              children: [
                Checkbox(value: checked, onChanged: function),
                Text(
                  name,
                  style: TextStyle(
                    decoration: checked
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
