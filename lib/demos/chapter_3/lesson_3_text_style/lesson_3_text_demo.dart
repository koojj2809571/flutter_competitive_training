import 'package:flutter/material.dart';

class TextDemo extends StatefulWidget {
  static final String name = "TEXT_DEMO";

  @override
  _TextDemoState createState() {
    return _TextDemoState();
  }
}

class _TextDemoState extends State<TextDemo> {
  final String testString = '文本示例';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(testString)),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              testString,
              textAlign: TextAlign.left,
            ),
            Text(
              testString * 10,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              testString,
              textScaleFactor: 1.5,
              textAlign: TextAlign.center,
            ),
            Text(
              testString,
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  height: 1.2,
                  fontFamily: 'Courier',
                  background: Paint()..color = Colors.yellow,
                  decoration: TextDecoration.combine([
                    TextDecoration.lineThrough,
                    TextDecoration.underline,
                    TextDecoration.overline
                  ]),
                  decorationStyle: TextDecorationStyle.double),
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: 'Home:'),
                  TextSpan(
                    text: 'https://www.flutter.club',
                    style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.solid),
                  ),
                ],
              ),
            ),
            DefaultTextStyle(
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
              ),
              textAlign: TextAlign.start,
              child: Column(
                children: <Widget>[
                  Text(testString),
                  Text(testString),
                  Text(
                    testString,
                    style: TextStyle(
                      inherit: false,
                      color: Colors.black
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
