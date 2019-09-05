import 'package:flutter/material.dart';

class DemoCounter extends StatefulWidget {
  static final String name = "lesson2.1";

  @override
  DemoCounterState createState() => DemoCounterState();
}

class DemoCounterState extends State<DemoCounter> {

  int _counter;
  bool _hasResult;

  @override
  void initState() {
    _counter = 0;
    _hasResult = false;
    super.initState();
  }

  void increase() {
    _counter++;
  }

  @override
  Widget build(BuildContext context) {
    _hasResult = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("计数器实例"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_hasResult ? '计数并返回结果' : '当前计数'),
              Text('(You have pushed the button this many times)'),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.display2,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: FlatButton(
                  onPressed: () {
                    if(_hasResult) {
                      Navigator.pop(context, _counter);
                    }else{
                      Navigator.pop(context);
                    }
                  },
                  child: Text('返回'),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(increase);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
