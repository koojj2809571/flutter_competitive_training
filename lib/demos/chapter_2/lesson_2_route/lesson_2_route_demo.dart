import 'package:flutter/material.dart';
import '../lesson_1_counter/lesson_1_counter_demo.dart';

import 'lesson_2_router_hook.dart';

class RouteDemo extends StatefulWidget {
  static final String name = "lesson2.2";

  RouteDemoState createState() => RouteDemoState();
}

class RouteDemoState extends State<RouteDemo> {
  int _result;

  @override
  void initState() {
    _result = -1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('路由管理示例')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '前往计数器获取点击次数',
              style: Theme.of(context).textTheme.display1,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(_result == -1 ? '还未获取到值' : '计数器一共被点击了$_result次'),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: FlatButton(
                onPressed: () {
                  if(_result != -1) {
                    Navigator.of(context).pushNamed(RouterHookDemo.name,arguments: _result);
                  }
                },
                child: Text('测试'),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var result = await Navigator.of(context).pushNamed(
            DemoCounter.name,
            arguments: true,
          );
          setState(() {
            _result = result == null ? -1 : result;
          });
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}
