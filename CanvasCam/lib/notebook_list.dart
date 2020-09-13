import 'package:flutter/material.dart';
import 'package:CanvasCam/screens/notebook.dart';

class NotebookList extends StatelessWidget {
  final List<String> notebookLabels;

  NotebookList(this.notebookLabels);

  void selectNotebook(BuildContext context, int index) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return NotebookScreen(notebookLabels[index]);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return (notebookLabels.isEmpty)
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text('Click on the button to create a new notebook.'),
            ),
          )
        : ListView.builder(
            itemCount: notebookLabels.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () => selectNotebook(context, index),
                leading: Icon(Icons.bookmark_border),
                title: Text('${notebookLabels[index]}'),
              );
            },
          );
  }
}