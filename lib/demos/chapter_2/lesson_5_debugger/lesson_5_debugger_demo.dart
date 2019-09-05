import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:flutter/rendering.dart';

class DebuggerDemo extends StatefulWidget {
  static final String name = "DEBUGGER_DEMO";

  DebuggerDemoState createState() => DebuggerDemoState();
}

class DebuggerDemoState extends State<DebuggerDemo> {
  int i = 30;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('调试示例')),
      body: Container(
        child: Text('调试调试调试调试调试调试调试'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPaintSizeEnabled = !debugPaintSizeEnabled;
        },
        child: Icon(Icons.transform),
      ),
    );
  }
}
