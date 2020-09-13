import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:edge_detection/edge_detection.dart';

class NotebookScreen extends StatefulWidget {
  final String notebookLabel;

  @override
  _NotebookScreenState createState() => _NotebookScreenState();

  NotebookScreen(this.notebookLabel);
}

class _NotebookScreenState extends State<NotebookScreen> {
  List<String> _pagePaths = [];

  Future<void> openCVCamera() async {
    String pagePath;

    try {
      pagePath = await EdgeDetection.detectEdge;
    } on PlatformException {
      pagePath = null;
    }

    if (!mounted) return;

    setState(() => {
          if (pagePath != null) {_pagePaths.add(pagePath)}
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.notebookLabel),
      ),
      body: _pagePaths.length > 0
          ? GridView.count(
              crossAxisCount: 2,
              children: _pagePaths.map((pagePath) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Image.file(File(pagePath))),
                );
              }).toList(),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text('Click on the button to add a new page.'),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openCVCamera();
        },
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}
