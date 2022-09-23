import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final String name;
  final bool checked;
  Function(bool?)? function;
  ToDoTile({
    Key? key,
    required this.name,
    required this.checked,
    this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
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
    );
  }
}
