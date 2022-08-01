import 'package:flutter/material.dart';
import 'package:todoapp_v3/model/Todo.dart';
import 'package:todoapp_v3/ui/components/todo_item.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Todo> _todos = <Todo>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8),
        children: _todos.map((Todo todo) {
          return TodoItem(todo: todo);
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _displayDialog();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> _displayDialog() async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Add new todo"),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: "Enter todo",
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _addTodoItem(_controller.text);
              },
              child: Text("Add"),
            ),
          ],
        );
      },
    );
  }

  void _addTodoItem(String title) {
    setState(() {
      _todos.add(Todo(title: title));
    });
    _controller.clear();
  }
}
