import 'package:flutter/material.dart';
import 'package:modul2/app/data/Database/database_controller.dart';
import 'package:modul2/app/modules/home/Models/Todo_model.dart';

class TodoProvider extends ChangeNotifier{
  List<TodoModel> _todos = [];
  List<TodoModel> get todos => _todos;

  void addTodo(TodoModel todo) {
    _todos.add(todo) ;
    notifyListeners ();
  }
  void removeTodo( int index) {
    if (index >= 0 && index < _todos.length) {
      String removedTodoId = _todos[index].id; // Retrieve the id before removal
      _todos.removeAt(index);
      DatabaseController.instance.deleteTodo(removedTodoId); // Use the retrieved id
      notifyListeners();
    }
  }
  void updateTodo(int index,TodoModel todo){
    if (index >= 0 && index < _todos.length) {
      _todos[index] = todo;
      DatabaseController.instance.updateTodo(todo);
      notifyListeners();
    } else {
      print("Invalid index: $index");
    }
  }

  getTodo()async{
    _todos = await DatabaseController.instance.getTodos();
    notifyListeners();
  }

}