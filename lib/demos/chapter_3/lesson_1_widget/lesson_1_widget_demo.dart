import 'package:flutter/material.dart';

class FlutterWidgetDemo extends StatefulWidget {
  static final name = 'FLUTTER_WIDGET_DEMO';

  FlutterWidgetDemoState createState() => FlutterWidgetDemoState();
}

class FlutterWidgetDemoState extends State<FlutterWidgetDemo> {

  int _value;

  @override
  void initState() {
    super.initState();
    _value = -1;
    print('initState');
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(title: Text('Widget详解')),
      body: Container(
        child: Center(
          child: Builder(builder: (context) {
            return _value == -1 ? _getTitle(context) : _getValue();
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _value++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }


  @override
  void didUpdateWidget(FlutterWidgetDemo oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }


  @override
  void deactivate() {
    super.deactivate();
    print('deactivate');
  }


  @override
  void dispose() {
    super.dispose();
    print('dispose');
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

  Widget _getTitle(BuildContext context) {
    Scaffold scaffold = context.ancestorWidgetOfExactType(Scaffold);
    return (scaffold.appBar as AppBar).title;
  }

  Widget _getValue(){
    return Text('$_value');
  }
}
