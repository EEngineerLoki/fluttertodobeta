import 'package:flutter/material.dart';
import 'package:flutter_todo_app/utils/dialog_box.dart';
import 'package:flutter_todo_app/utils/todo_tile.dart';

class MyHomepage extends StatefulWidget {
  const MyHomepage({super.key});

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {

  List todoList = [
    ['Make Tutorial', false],
    ['Do Dinner', false]
  ];

  void checkBoxChange(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  void createNewTask() {
    showDialog(
      context: context, 
      builder: (context) {
        return const DialogBox();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        shadowColor: Colors.black,
        backgroundColor: Colors.teal.shade900,
        title: const Text('To Do App', 
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 22
        ),),
        centerTitle: true,
      ),
      backgroundColor: Colors.teal.shade200,
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) => 
        TodoTile(
          taskName: todoList[index][0], 
          taskCompleted: todoList[index][1], 
          onChanged: (value) => checkBoxChange(value, index)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
    );
  }
}