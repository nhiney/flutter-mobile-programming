import 'package:flutter/material.dart';
import 'package:flutter_tuan_6/database/db_helper.dart';
import 'package:flutter_tuan_6/models/todo_app/todo.dart';

class TodoProvider extends ChangeNotifier {
  List<Todo> _todos = [];
  bool _isLoading = false;

  List<Todo> get todos => _todos;
  bool get isLoading => _isLoading;

  TodoProvider() {
    loadTodos();
  }

  Future<void> loadTodos() async {
    _isLoading = true;
    notifyListeners();
    _todos = await DatabaseHelper().getTodos();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> addTodo(Todo todo) async {
    await DatabaseHelper().insertTodo(todo);
    await loadTodos();
  }

  Future<void> updateTodo(Todo todo) async {
    await DatabaseHelper().updateTodo(todo);
    await loadTodos();
  }

  Future<void> deleteTodo(int id) async {
    await DatabaseHelper().deleteTodo(id);
    await loadTodos();
  }

  Future<void> toggleTodoStatus(Todo todo) async {
    final updatedTodo = todo.copyWith(isCompleted: !todo.isCompleted);
    await updateTodo(updatedTodo);
  }
}
