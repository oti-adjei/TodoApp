import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:se_todo_app/viewmodels/todo_viewmodel.dart';
import 'package:se_todo_app/features/detail/detail_viewmodel.dart';
import 'package:se_todo_app/features/home/home_page.dart';
import 'package:se_todo_app/features/home/home_viewmodel.dart';
import 'package:se_todo_app/viewmodels/todo_viewmodel.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  final _todoViewModel = TodoViewModel();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => _todoViewModel,
        ),
        ChangeNotifierProxyProvider<TodoViewModel, HomeViewModel>(
          create: (_) => HomeViewModel(
            todoViewModel: _todoViewModel,
          ),
          update: (_, todo, __) => HomeViewModel(todoViewModel: todo),
        ),
        ChangeNotifierProxyProvider<TodoViewModel, DetailViewModel>(
          create: (_) => DetailViewModel(
            todoViewModel: _todoViewModel,
          ),
          update: (_, todo, __) => DetailViewModel(todoViewModel: todo),
        ),
      ],
      child: MaterialApp(
        title: 'SemaphoreCI Flutter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
