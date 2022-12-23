import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchTextFieldWidget extends StatelessWidget {
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onTap;
  final String? hintText;
  final EdgeInsetsGeometry? margin;
  final bool enabled;

  const SearchTextFieldWidget(
      {super.key, this.hintText, this.onSubmitted, this.onTap, this.margin, required this.enabled});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled == false ? onTap : null,
      child: Container(
        margin: margin ?? const EdgeInsets.all(0.0),
        width: MediaQuery.of(context).size.width,
        alignment: AlignmentDirectional.center,
        height: 40.0,
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: CupertinoTextField(
          enabled: enabled,
          onSubmitted: onSubmitted,
          onTap: onTap,
          cursorColor: Colors.blue,
          // decoration: BoxDecoration()

          // InputDecoration(
          //   contentPadding: const EdgeInsets.only(top: 5.0),
          //   border: InputBorder.none,
          //   hintText: hintText,
          //   hintStyle: const TextStyle(fontSize: 16, color: Colors.redAccent),
          //   prefixIcon: const Icon(
          //     Icons.search,
          //     size: 25,
          //     color: Colors.greenAccent,
          //   ),
          // ),

          // style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
