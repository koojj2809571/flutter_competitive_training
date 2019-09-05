import 'package:flutter/material.dart';

class StateManagementDemo extends StatefulWidget {
  static final String name = "STATE_MANAGEMENT_DEMO";

  _StateManagementDemoState createState() => _StateManagementDemoState();
}

class _StateManagementDemoState extends State<StateManagementDemo> {
  bool _active = false;
  bool _boxBActive = false;
  bool _boxCActive = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  void _handleBoxBTap(bool newActive) {
    setState(() {
      _boxBActive = newActive;
    });
  }

  void _handleCoxBTap(bool newActive) {
    setState(() {
      _boxCActive = newActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('状态管理')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: _handleTap,
              child: Container(
                child: Center(
                  child: Text(
                    _active ? 'Active' : 'Inactive',
                    style: new TextStyle(fontSize: 32.0, color: Colors.white),
                  ),
                ),
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                    color: _active ? Colors.lightGreen[700] : Colors.grey[600]),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: TapBoxB(
                active: _boxBActive,
                onChanged: _handleBoxBTap,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: TapBoxC(
                active: _boxCActive,
                onChanged: _handleCoxBTap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TapBoxB extends StatelessWidget {
  TapBoxB({Key key, this.active, this.onChanged}) : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

class TapBoxC extends StatefulWidget {
  final bool active;
  final ValueChanged<bool> onChanged;

  TapBoxC({Key key, this.active, this.onChanged}) : super(key: key);

  TapBoxCState createState() => TapBoxCState();
}

class TapBoxCState extends State<TapBoxC> {
  bool _height = false;

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _height = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _height = false;
    });
  }

  void _handelTapCancel() {
    setState(() {
      _height = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handelTapCancel,
      child: Container(
        child: Center(
          child: Text(
            widget.active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _height
              ? Border.all(
                  color: Colors.teal[700],
                  width: 10,
                )
              : null,
        ),
      ),
    );
  }
}
