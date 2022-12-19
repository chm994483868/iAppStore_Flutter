import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iappstore_flutter/my_app.dart';

void main() => run();

run() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}
