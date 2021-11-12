class Todo {
  String? title;
  String? cmt;
  String? id;

  Todo({this.title, this.cmt, this.id});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      title: json["title"],
      cmt: json["cmt"],
      id: json['id']
    );
  }
}
class ListTodo {
  List<Todo> listTodo;

  ListTodo({required this.listTodo});

  factory ListTodo.fromJson(List<dynamic> json){
    List<Todo> list = [];
    list =  json.map((e) => Todo.fromJson(e)).toList();
    return ListTodo(listTodo: list);
  }
}
