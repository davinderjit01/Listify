import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/file_read_write/file_controller.dart';
import 'package:todo_app/home.dart';
import 'package:todo_app/style.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => FileController()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<FileController>().readTodo();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-Do App',
      routes: {
        '/': (context) => TodoHomePage(
            valueList: context.select((FileController controller) =>
                controller.todo != null ? controller.todo!.cardList : []))
      },
      theme: appTheme(),
    );
  }
}
