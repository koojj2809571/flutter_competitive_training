import 'package:flutter/material.dart';
import 'dart:convert';

class AssetsDemo extends StatefulWidget {
  static final String name = "ASSETS_DEMO";

  AssetsDemoState createState() => AssetsDemoState();
}

class AssetsDemoState extends State<AssetsDemo> {
  bool _isShowPic = true;

  List _personList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('资源管理示例')),
      body: Container(
        child: _isShowPic
            ? Center(
                child: Image.asset('assets/image/welcome.png'),
              )
            : ListView.builder(
                itemCount: _personList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text('${_personList[index]['name']}'),
                        Text('${_personList[index]['age']}'),
                        Text('${_personList[index]['height']}'),
                        Text('${_personList[index]['gender']}'),
                      ],
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if(_isShowPic){
            await DefaultAssetBundle.of(context).loadString('assets/person.json').then((data){
                  setState(() {
                    _isShowPic = false;
                    _personList = json.decode(data.toString());
                  });
            });
          }else {
            setState(() {
              _personList = [];
              _isShowPic = true;
            });
          }
        },
        child: Icon(Icons.autorenew),
      ),
    );
  }
}

class Person {
  final String name;
  final int age;
  final int height;
  final String gender;

  Person(this.name, this.age, this.height, this.gender);
}
