import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stack_trace/stack_trace.dart';

class SearchTextFieldWidget extends StatelessWidget {
  final ValueChanged<String>? _onSubmitted;
  final VoidCallback? _onCancel;
  final String? _placeholder;
  final searchText = "".obs;

  SearchTextFieldWidget({super.key, ValueChanged<String>? onSubmitted, VoidCallback? onCancel, String? placeholder})
      : _onSubmitted = onSubmitted,
        _onCancel = onCancel,
        _placeholder = placeholder;

  @override
  Widget build(BuildContext context) {
    debugPrint('🐑🐑🐑 ${Trace.current().frames[0].member}');
    final textController = TextEditingController();
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: CupertinoTextField(
              controller: textController,
              placeholder: _placeholder ?? "游戏、App 等",
              cursorColor: Colors.blue,
              prefix: const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.search,
                  color: Colors.black26,
                ),
              ),
              clearButtonMode: OverlayVisibilityMode.editing,
              textInputAction: TextInputAction.search,
              decoration: const BoxDecoration(),
              onChanged: (value) {
                debugPrint("🐶🐶🐶 onChanged：$value");
                searchText.value = value;

                // 取消回调
                if (value.isEmpty && _onCancel != null) {
                  _onCancel!();
                }
              },
              onSubmitted: _onSubmitted,
            ),
          ),
        ),
        Obx(() {
          if (searchText.value.isNotEmpty) {
            return TextButton(
              onPressed: () {
                textController.clear();
                searchText.value = "";

                // 取消回调
                if (_onCancel != null) {
                  _onCancel!();
                }
              },
              child: const Text(
                "取消",
                style: TextStyle(fontSize: 17),
              ),
            );
          } else {
            return const SizedBox();
          }
        }),
      ],
    );
  }
}
