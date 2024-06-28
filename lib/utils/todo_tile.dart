import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({super.key, 
  required this.taskName, 
  required this.taskCompleted, 
  required this.onChanged});

  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 28, left: 20, right: 20),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [BoxShadow(
            color: Colors.black87,
            offset: Offset(1, 3),
            blurRadius: 10,
            spreadRadius: 0
          )]
        ),
        child: Row(
          children: [
            Checkbox(
              value: taskCompleted, 
              onChanged: onChanged),
            Text(
              taskName, 
              style: TextStyle(
                decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none
              ),)
          ],
        ),
      )
    );
  }
}