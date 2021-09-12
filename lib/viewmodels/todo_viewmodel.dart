import 'package:flutter/material.dart';
import 'package:se_todo_app/models/todo_item.dart';

class TodoViewModel extends ChangeNotifier {
  List<TodoItem> todos = [];

  void addItemToList(TodoItem item) {
    todos.add(item);
    notifyListeners();
  }

  void updateItem(TodoItem item) {
    final i = todos.indexWhere((t) => t.id == item.id);
    if (i != -1) todos[i] = item;
    notifyListeners();
  }

  void deleteItemById(int id) {
    todos.removeWhere((t) => t.id == id);
    notifyListeners();
  }

  void deleteAllItems() {
    todos.clear();
    notifyListeners();
  }
}
