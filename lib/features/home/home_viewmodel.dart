import 'package:flutter/material.dart';
import 'package:se_todo_app/models/todo_item.dart';
import 'package:se_todo_app/viewmodels/todo_viewmodel.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({
    this.todoViewModel,
  });

  final TodoViewModel? todoViewModel;

  List<TodoItem> get todos => todoViewModel != null ? todoViewModel!.todos : [];
}
