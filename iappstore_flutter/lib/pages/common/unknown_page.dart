import 'package:flutter/cupertino.dart';

class UnknownPage extends StatelessWidget {
  const UnknownPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("未知页面"),
      ),
      child: Center(
        child: Text(
          "未知页面",
          style: TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}
