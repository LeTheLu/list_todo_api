import 'package:flutter/material.dart';
import 'package:list_todo_api/todo_page.dart';

import 'home_page.dart';
import 'models/model_todo.dart';

class RouteName {
  static const String home = "/";
  static const String page = "TodoPage";
}


class Routes{
  static Route<dynamic>? generate(RouteSettings settings){

    switch (settings.name){
      case "/": {
        return MaterialPageRoute(builder: (_) => const HomePage());
      }
      case "TodoPage": {
        Todo todo = settings.arguments as Todo;
        return MaterialPageRoute(builder: (_) => TodoPage(todo: todo,));
      }
    }
  }
}