import 'package:flutter/material.dart';
import 'package:flutter_todo_app/data/database.dart';
import 'package:flutter_todo_app/utils/dialog_box.dart';
import 'package:flutter_todo_app/utils/todo_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MyHomepage extends StatefulWidget {
  const MyHomepage({super.key});

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {

  final _mybox = Hive.box('mybox');

  ToDoDatabase db = ToDoDatabase();

  final _controller = TextEditingController();

  @override
  void initState() {

    if (_mybox.get('TODOLIST') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  void checkBoxChange(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateDataBase();
  }

  void saveNewTask() {
    setState(() {
      db.todoList.add([ _controller.text, false ]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void createNewTask() {
    showDialog(
      context: context, 
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      });
      db.updateDataBase();
  }

  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDataBase();
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
      body: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: ListView.builder(
          itemCount: db.todoList.length,
          itemBuilder: (context, index) => 
          TodoTile(
            taskName: db.todoList[index][0], 
            taskCompleted: db.todoList[index][1], 
            onChanged: (value) => checkBoxChange(value, index),
            deleteFunction: (context) => deleteTask(index)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
    );
  }
}