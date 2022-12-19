import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iappstore_flutter/base/getx_router_observer.dart';
import 'package:iappstore_flutter/pages/main/bindings/main_binding.dart';
import 'package:iappstore_flutter/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetCupertinoApp(
      title: 'iAppStore',
      navigatorObservers: [GetXRouterObserver()],
      unknownRoute: Routes.unknownPage,
      // 通过使用 initialRoute 来保证绑定的操作
      initialRoute: Routes.main,
      getPages: Routes.routePage,
      onGenerateRoute: (settings) {
        debugPrint(settings.name);
        return null;
      },
      // 经过初始化的 binding
      initialBinding: MainBinding(),
      // 使用 toast
      builder: EasyLoading.init(),
      theme: _getCupertinoCurrentTheme(),
    );
  }

  CupertinoThemeData _getCupertinoCurrentTheme() {
    return const CupertinoThemeData(barBackgroundColor: Colors.white, brightness: Brightness.light);
  }
}
