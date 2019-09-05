import 'package:flutter/material.dart';

class RouterHookDemo extends StatelessWidget {
  static final name = 'ROUTER_HOOK_DEMO';

  @override
  Widget build(BuildContext context) {
    int result = ModalRoute.of(context).settings.arguments;
    print(result);
    return Material(
      type: MaterialType.transparency,
      child: Container(
        color: Colors.white,
        child: Center(
          child: Text(
            result == 8 ? '成功' : '失败',
            style: Theme.of(context).textTheme.display1,
          ),
        ),
      ),
    );
  }
}
