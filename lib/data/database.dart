import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {

  final _mybox = Hive.box('mybox');

  List todoList = [];

  void createInitialData() {
    todoList = [
      ['Make Tutorial', false],
      ['Do Exercise', false]
    ];
  }

  void loadData() {
    todoList = _mybox.get('TODOLIST');
  }

  void updateDataBase() {
    _mybox.put('TODOLIST', todoList);
  }

}