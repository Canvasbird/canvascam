import 'package:flutter/material.dart';
import 'package:CanvasCam/new_notebook.dart';
import 'package:CanvasCam/notebook_list.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<String> notebookLabels = [];

  void _createNewNotebook(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return NewNotebook(addNewNotebook);
      },
    );
  }

  void addNewNotebook(String notebookName) {
    if(notebookName.length != 0) {
      setState(() {
        notebookLabels.add(notebookName);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CanvasCam'),
      ),
      body: Center(
        child: NotebookList(notebookLabels),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.book),
        onPressed: () {
          _createNewNotebook(context);
        },
      ),
    );
  }
}
