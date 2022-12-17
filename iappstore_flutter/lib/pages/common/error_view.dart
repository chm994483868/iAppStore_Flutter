import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ErrorView extends StatelessWidget {
  /// 重试按钮的回调事件
  VoidCallback? retryAction;

  ErrorView({super.key, this.retryAction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '哎呀,出错了...',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 44,
            ),
            SizedBox(
              height: 44,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).primaryColor),
                  ),
                  onPressed: () {
                    if (retryAction != null) {
                      retryAction!();
                    }
                  },
                  child: const Text(
                    "重试",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
