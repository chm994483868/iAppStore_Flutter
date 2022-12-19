import 'package:get/get.dart';
import 'package:iappstore_flutter/pages/common/unknown_page.dart';
import 'package:iappstore_flutter/pages/detail/binding/detail_binding.dart';
import 'package:iappstore_flutter/pages/detail/view/detail_page.dart';
import 'package:iappstore_flutter/pages/main/bindings/main_binding.dart';
import 'package:iappstore_flutter/pages/main/view/main_page.dart';
import 'package:iappstore_flutter/pages/rank_home/binding/rank_home_binding.dart';
import 'package:iappstore_flutter/pages/rank_home/view/rank_home_page.dart';

abstract class Routes {
  Routes._();

  static const rankHomePage = "/rankHomePage";
  static const unknown = "/unknown";
  static const main = "/main";
  static const detailPage = "/detailPage";

  /// 页面合集
  static final routePage = [
    GetPage(name: rankHomePage, page: () => const RankHomePage(), binding: RankHomeBinding()),
    GetPage(
      name: main,
      page: () => const MainPage(),
      bindings: [MainBinding(), RankHomeBinding()],
    ),
    GetPage(
      name: detailPage,
      page: () => const DetailPage(),
      binding: DetailBinding(),
    ),
  ];

  static final unknownPage = GetPage(name: unknown, page: () => const UnknownPage());
}
