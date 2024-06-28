import 'package:flutter/material.dart';
import 'package:flutter_todo_app/utils/my_button.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({
    super.key, 
    required this.controller,
    required this.onSave,
    required this.onCancel});

  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.teal.shade300,
      content: SizedBox(
        height: 150,
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 20, bottom: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Add Task Here'
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyButton(text: 'Save', onPressed: onSave),
                  MyButton(text: 'Cancel', onPressed: onCancel)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}