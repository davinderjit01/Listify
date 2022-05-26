import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:todo_app/file_read_write/file_controller.dart';
import 'package:todo_app/style.dart';

class TodoHomePage extends StatefulWidget {
  List valueList;

  TodoHomePage({Key? key, required this.valueList}) : super(key: key);

  @override
  _TodoHomePageState createState() => _TodoHomePageState();
}

class _TodoHomePageState extends State<TodoHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
        body: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: _body(context, widget.valueList),
        ),
        floatingActionButton: _floatingActionButton(context, widget.valueList));
  }

  PreferredSize _appBar() {
    final ThemeData theme = Theme.of(context);
    return PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          centerTitle: true,
          title: Text('Write it down...',
              style: theme.textTheme.headline5!
                  .copyWith(color: theme.colorScheme.secondary)),
        ));
  }

  Widget _floatingActionButton(BuildContext context, List valueList) {
    final ThemeData theme = Theme.of(context);
    TextEditingController _titleController = TextEditingController();
    TextEditingController _descController = TextEditingController();
    String title = "";
    String description = "";
    return FloatingActionButton(
      backgroundColor: theme.colorScheme.primary,
      child: Icon(Icons.add, color: theme.colorScheme.secondary),
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Column(
            children: [
              const Text('Enter Note'),
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Enter Title',
                ),
                onChanged: (text) {
                  setState(() {
                    title = text;
                  });
                },
              ),
            ],
          ),
          content: TextField(
            controller: _descController,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: const InputDecoration(
              labelText: 'Enter Description',
            ),
            onChanged: (text) {
              setState(() {
                description = text;
              });
            },
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  if (_titleController.text.length > 0 &&
                      _descController.text.length > 0) {
                    valueList.add({
                      "title": _titleController.text,
                      "description": _descController.text
                    });
                    _titleController.clear();
                    _descController.clear();
                  }
                });
                context.read<FileController>().writeTodo(valueList);
                Navigator.pop(context, 'Add');
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _body(BuildContext context, List valueList) {
    return SingleChildScrollView(
        child: Column(
      children: valueList.map((value) {
        return Card(
          elevation: 4,
          child: ListTile(
            title: Text(value['title']),
            subtitle: Text(value['description']),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {
                setState(() {
                  valueList.removeWhere((i) => (i['title'] == value['title'] &&
                      i['description'] == value['description']));
                });
                context.read<FileController>().writeTodo(valueList);
              },
            ),
          ),
        );
      }).toList(),
    ));
  }
}
