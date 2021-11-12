import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:list_todo_api/models/model_todo.dart';

class NetWork{
  static var url = Uri.parse('https://618c9e22ded7fb0017bb9644.mockapi.io/api/list-todo');

  static Future<ListTodo> getData() async {
    var listData = await http.get(url);
    var listJson = jsonDecode(listData.body);
    ListTodo list = ListTodo.fromJson(listJson);
    return list;
  }
  static Future<http.Response> deleteTodo({required String id}) async {
    final http.Response response = await http.delete(
      Uri.parse('https://618c9e22ded7fb0017bb9644.mockapi.io/api/list-todo/$id'),
    );
    return response;
  }
  static Future<http.Response> newTodo({required String title, required String cmt}) async {
    final http.Response response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title,
        'cmt': cmt
      }),
    );
    return response;
  }

  static Future<http.Response> updateTodo({String? id, String? title,String? cmt}) async {
    final http.Response response = await http.put(
      Uri.parse('https://618c9e22ded7fb0017bb9644.mockapi.io/api/list-todo/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title ?? "",
        'cmt' : cmt ?? ""
      }),
    );
    return response;
  }
}