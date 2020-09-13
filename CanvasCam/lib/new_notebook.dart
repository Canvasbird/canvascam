import 'package:flutter/material.dart';

class NewNotebook extends StatefulWidget {
  final Function addNewNotebook;

  NewNotebook(this.addNewNotebook);

  @override
  _NewNotebookState createState() => _NewNotebookState();
}

class _NewNotebookState extends State<NewNotebook> {
  final titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Notebook title'),
                controller: titleController,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlineButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Cancel'),
                    ),
                    RaisedButton(
                      color: Colors.blue,
                      onPressed: () {
                        widget.addNewNotebook(titleController.text);
                        Navigator.of(context).pop();
                      },
                      child: Text('Create'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
