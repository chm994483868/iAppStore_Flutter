import 'package:flutter/cupertino.dart';

class LoadingView extends StatelessWidget {
  final String? _message;

  const LoadingView({super.key, String? message}) : _message = message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CupertinoActivityIndicator(radius: 10),
            const SizedBox(
              height: 5.0,
            ),
            Text(
              _message ?? '正在加载...',
              style: const TextStyle(fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}
