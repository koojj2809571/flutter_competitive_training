import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:english_words/english_words.dart';

class PackageManagementDemo extends StatelessWidget {
  static final String name = "PACKAGE_MANAGEMENT";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('包管理示例'),
      ),
      body: Container(
        child: Center(
          child: Text('点击下方悬浮按钮，弹出随机提示字符'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Fluttertoast.showToast(msg: WordPair.random().toString());
        },
        child: Icon(Icons.add_comment),
      ),
    );
  }
}
