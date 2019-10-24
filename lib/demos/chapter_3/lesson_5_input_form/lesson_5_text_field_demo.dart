import 'package:flutter/material.dart';
import 'package:flutter_competitive_training/demos/chapter_3/lesson_5_input_form/lesson5_form_demo.dart';

class TextFieldDemo extends StatefulWidget {
  static final String name = "INPUT_FORM_DEMO";

  TextFieldDemoState createState() => TextFieldDemoState();
}

class TextFieldDemoState extends State<TextFieldDemo> {
  FocusNode nameNode = FocusNode();
  FocusNode passwordNode = FocusNode();
  FocusScopeNode focusScopeNode;
  bool hasNameFocus;
  bool hasPasswordFocus;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    nameNode.addListener(() {
      hasNameFocus = nameNode.hasFocus;
    });
    passwordNode.addListener(() {
      hasPasswordFocus = passwordNode.hasFocus;
    });

    _nameController.addListener(() {
      print('用户名输入监听：${_nameController.text}');
    });
    _passwordController.addListener(() {
      print('密码输入监听：${_passwordController.text}');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('输入框及表单示例'),
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          hintColor: Colors.yellowAccent,
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: TextStyle(color: Colors.blue),
            hintStyle: TextStyle(color: Colors.pink,fontSize: 14),
          ),
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              TextField(
                focusNode: nameNode,
                onEditingComplete: () => {print(_nameController.text)},
                controller: _nameController,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: '用户名',
                  hintText: '输入用户名或邮箱',
                  prefixIcon: Icon(Icons.person),
                  border: InputBorder.none,
                ),
              ),
              TextField(
                focusNode: passwordNode,
                onEditingComplete: () => print(_passwordController.text),
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: '密码',
                  hintText: '输入密码',
                  prefixIcon: Icon(Icons.lock),
                  border: InputBorder.none,
                ),
                obscureText: true,
              ),
              Builder(builder: (ctx) {
                return Column(
                  children: <Widget>[
                    RaisedButton(
                      child: Text('移动焦点'),
                      onPressed: () {
                        if (focusScopeNode == null) {
                          focusScopeNode = FocusScope.of(context);
                        }
                        focusScopeNode.requestFocus(
                            hasNameFocus ? passwordNode : nameNode);
                      },
                    ),
                    RaisedButton(
                      child: Text('隐藏键盘'),
                      onPressed: () {
                        nameNode.unfocus();
                        passwordNode.unfocus();
                      },
                    ),
                    RaisedButton(
                      child: Text('前往Form示例'),
                      onPressed: (){
                        Navigator.of(context).pushNamed(FormDemo.name);
                      },
                    )
                  ],
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
