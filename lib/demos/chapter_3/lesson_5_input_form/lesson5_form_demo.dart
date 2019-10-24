import 'package:flutter/material.dart';

class FormDemo extends StatefulWidget{
  static final String name = 'FORM_DEMO';
  FormDemoState createState() => FormDemoState();
}

class FormDemoState extends State<FormDemo>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('表单示例'),
      ),
      body: Center(

      ),
    );
  }
}