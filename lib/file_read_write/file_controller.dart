import 'package:flutter/cupertino.dart';
import 'package:todo_app/file_read_write/file_manager.dart';
import 'package:todo_app/file_read_write/todo_model.dart';

class FileController extends ChangeNotifier {
  Todo? _todo;

  Todo? get todo => _todo;

  readTodo() async {
    _todo = Todo.fromJson(await FileManager().readJsonFile());
    notifyListeners();
  }

  writeTodo(List todoArray) async {
    _todo = await FileManager().writeJsonFile(todoArray);
    notifyListeners();
  }
}
