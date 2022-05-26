import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:todo_app/file_read_write/todo_model.dart';

class FileManager {
  static FileManager? _instance;

  FileManager._internal() {
    _instance = this;
  }

  factory FileManager() => _instance ?? FileManager._internal();

  //define directory path
  Future<String> get _directoryPath async {
    Directory? directory = await getExternalStorageDirectory();
    return directory!.path;
  }

  //define path for file
  Future<File> get _jsonFile async {
    final path = await _directoryPath;
    return File('$path/todo.json');
  }

  //read json file
  Future<Map<String, dynamic>> readJsonFile() async {
    //default value if file does not exist
    String fileContent = "Todo content";

    File file = await _jsonFile;
    if (await file.exists()) {
      try {
        fileContent = await file.readAsString();
      } catch (e) {
        print(e);
      }
    }
    return json.decode(fileContent);
  }

  Future<Todo> writeJsonFile(List todoArray) async {
    final Todo todo = Todo(todoArray);
    File file = await _jsonFile;
    await file.writeAsString(json.encode(todo));
    return todo;
  }
}
