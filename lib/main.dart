import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_competitive_training/demos/chapter_2/lesson_1_counter/lesson_1_counter_demo.dart';
import 'package:flutter_competitive_training/demos/chapter_2/lesson_2_route/lesson_2_route_demo.dart';
import 'package:flutter_competitive_training/demos/chapter_2/lesson_2_route/lesson_2_router_hook.dart';
import 'package:flutter_competitive_training/demos/chapter_2/lesson_3_package_manager/lesson_3_package_demo.dart';
import 'package:flutter_competitive_training/demos/chapter_2/lesson_4_assets_management/lesson_4_assets_demo.dart';
import 'package:flutter_competitive_training/demos/chapter_2/lesson_5_debugger/lesson_5_debugger_demo.dart';
import 'package:flutter_competitive_training/demos/chapter_3/lesson_1_widget/lesson_1_widget_demo.dart';
import 'package:flutter_competitive_training/demos/chapter_3/lesson_2_state_management/lesson_2_state_management_demo.dart';
import 'package:flutter_competitive_training/demos/chapter_3/lesson_3_text_style/lesson_3_text_demo.dart';
import 'package:flutter_competitive_training/demos/chapter_3/lesson_4_button/lesson_4_button_demo.dart';
import 'package:flutter_competitive_training/demos/chapter_3/lesson_5_input_form/lesson_5_text_field_demo.dart';

import 'demos/chapter_3/lesson_5_input_form/lesson5_form_demo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      debugShowMaterialGrid: true,//显示网格，检查widget效果，例如对齐问题
//      showPerformanceOverlay: true,//显示处理器运行情况
      title: 'Flutter Competitive Training',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: _getRoutes(),
      onGenerateRoute: (setting) {//如果跳转page没有添加到routes中，跳转时会进入到这个方法；用于在路由跳转前进行判断，例如用户未登录则进入登录页面
        if (setting.name == RouterHookDemo.name) {
          return MaterialPageRoute(
            builder: (context) => RouterHookDemo(),
            settings: setting,
          );
        } else {
          return MaterialPageRoute(
              builder: (context) => MyHomePage(title: 'Flutter实战目录'));
        }
      },
    );
  }

  _getRoutes() {
    return {
      "/": (context) => MyHomePage(title: 'Flutter实战目录'),
      DemoCounter.name: (context) => DemoCounter(),
      RouteDemo.name: (context) => RouteDemo(),
      PackageManagementDemo.name: (context) => PackageManagementDemo(),
      AssetsDemo.name: (context) => AssetsDemo(),
      DebuggerDemo.name: (context) => DebuggerDemo(),
      FlutterWidgetDemo.name: (context) => FlutterWidgetDemo(),
      StateManagementDemo.name: (context) => StateManagementDemo(),
      TextDemo.name: (context) => TextDemo(),
      ButtonDemo.name: (context) => ButtonDemo(),
      TextFieldDemo.name: (context) => TextFieldDemo(),
      FormDemo.name: (context) => FormDemo(),
    };
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<MainPageItem> _mainPageList = [];

  void _setListData() {
    _mainPageList
      ..add(
        MainPageItem(
          index: "2.1",
          title: "计数器示例",
          navigatorName: DemoCounter.name,
          lessonRoute: () => Navigator.of(context)
              .pushNamed(DemoCounter.name, arguments: false),
        ),
      )
      ..add(
        MainPageItem(
          index: "2.2",
          title: "路由管理示例示例",
          navigatorName: RouteDemo.name,
          lessonRoute: () => Navigator.of(context).pushNamed(RouteDemo.name),
        ),
      )
      ..add(
        MainPageItem(
          index: "2.3",
          title: "包管理示例",
          navigatorName: PackageManagementDemo.name,
          lessonRoute: () =>
              Navigator.of(context).pushNamed(PackageManagementDemo.name),
        ),
      )
      ..add(
        MainPageItem(
          index: "2.4",
          title: "资源管理示例",
          navigatorName: AssetsDemo.name,
          lessonRoute: () => Navigator.of(context).pushNamed(AssetsDemo.name),
        ),
      )
      ..add(
        MainPageItem(
          index: "2.5",
          title: "调试示例",
          navigatorName: DebuggerDemo.name,
          lessonRoute: () => Navigator.of(context).pushNamed(DebuggerDemo.name),
        ),
      )
      ..add(
        MainPageItem(
          index: "3.1",
          title: "Widget详解",
          navigatorName: FlutterWidgetDemo.name,
          lessonRoute: () => Navigator.of(context).pushNamed(FlutterWidgetDemo.name),
        ),
      )
      ..add(
        MainPageItem(
          index: "3.2",
          title: "状态管理",
          navigatorName: StateManagementDemo.name,
          lessonRoute: () => Navigator.of(context).pushNamed(StateManagementDemo.name),
        ),
      )
      ..add(
        MainPageItem(
          index: "3.3",
          title: "文本示例",
          navigatorName: TextDemo.name,
          lessonRoute: () => Navigator.of(context).pushNamed(TextDemo.name),
        ),
      )
      ..add(
        MainPageItem(
          index: "3.4",
          title: "按钮示例",
          navigatorName: ButtonDemo.name,
          lessonRoute: () => Navigator.of(context).pushNamed(ButtonDemo.name),
        ),
      )
      ..add(
        MainPageItem(
          index: "3.5",
          title: "输入框及表单示例",
          navigatorName: TextFieldDemo.name,
          lessonRoute: () => Navigator.of(context).pushNamed(TextFieldDemo.name),
        ),
      );
  }

  @override
  void initState() {
    _setListData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: _mainPageList.length,
          itemExtent: 50,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(
                "${_mainPageList[index].index} --------- ${_mainPageList[index].title}",
              ),
              trailing: Icon(
                Icons.insert_link,
                color: Colors.black12,
              ),
              onTap: _mainPageList[index].lessonRoute,
            );
          },
        ),
      ),
    );
  }
}

typedef void LessonRoute();

class MainPageItem {
  final String index;
  final String title;
  final String navigatorName;
  final LessonRoute lessonRoute;

  MainPageItem({this.index, this.title, this.navigatorName, this.lessonRoute});
}
