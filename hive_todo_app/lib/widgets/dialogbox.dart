import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final controller;
  final VoidCallback save;
  final VoidCallback cancel;
  DialogBox({
    Key? key,
    required this.save,
    required this.cancel,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Task',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MaterialButton(
                  onPressed: save,
                  child: Text('Save'),
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(
                  width: 8,
                ),
                MaterialButton(
                    onPressed: cancel,
                    child: Text('Cancel'),
                    color: Theme.of(context).primaryColor)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
