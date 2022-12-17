import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iappstore_flutter/base/getx_router_observer.dart';
import 'package:iappstore_flutter/pages/rank_home/binding/rank_home_binding.dart';
import 'package:iappstore_flutter/routes/routes.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetCupertinoApp(
      title: 'iAppStore',
      navigatorObservers: [GetXRouterObserver()],
      unknownRoute: Routes.unknownPage,
      initialRoute: Routes.rankHomePage,
      getPages: Routes.routePage,
      onGenerateRoute: (settings) {
        debugPrint(settings.name);
      },

      // 经过初始化的 binding
      initialBinding: RankHomeBinding(),
      // 使用 toast
      builder: EasyLoading.init(),
      theme: _getCupertinoCurrentTheme(),
    );
  }

  CupertinoThemeData _getCupertinoCurrentTheme() {
    return const CupertinoThemeData(
        barBackgroundColor: Colors.white, brightness: Brightness.light);
  }
}
