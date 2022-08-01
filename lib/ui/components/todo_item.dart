import 'package:flutter/material.dart';
import 'package:todoapp_v3/model/Todo.dart';
class TodoItem extends StatelessWidget {
  const TodoItem({Key? key, required this.todo}) : super(key: key);
  final Todo todo;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo.title),
    );
  }
}
