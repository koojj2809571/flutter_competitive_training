import 'package:flutter/material.dart';

class ButtonDemo extends StatefulWidget{

  static final String name = "BUTTON_DEMO";

  ButtonDemoState createState() => ButtonDemoState();
}

class ButtonDemoState extends State<ButtonDemo>{

  bool _switchActive = false;
  bool _checkBoxActive = false;

  void _handleSwitch(bool active){
    setState(() {
      _switchActive = active;
    });
  }

  void _handleCheckBox(bool active){
    setState(() {
//      if(active == null){
//        _checkBoxActive = true;
//      }
//      if(active){
//        _checkBoxActive = false;
//      }
//      if(!active){
//        _switchActive = null;
//      }
      _checkBoxActive = active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('按钮示例'),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton.icon(
                onPressed: (){},
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                icon: Icon(Icons.settings),
                label: Text("设置"),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              RaisedButton.icon(
                onPressed: (){},
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                icon: Icon(Icons.settings),
                label: Text("设置"),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              OutlineButton.icon(
                onPressed: (){},
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                splashColor: Colors.grey,
                icon: Icon(Icons.settings),
                label: Text("设置"),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              Switch(
                value:  _switchActive,
                activeColor: Colors.pink,
                onChanged: _handleSwitch,
              ),
              Checkbox(
                tristate: true,
                value:  _checkBoxActive,
                checkColor: Colors.black,
                activeColor: _checkBoxActive == null ? Colors.grey : Colors.pink,
                onChanged: _handleCheckBox,
              ),
            ],
          ),
        ),
      ),
    );
  }
}