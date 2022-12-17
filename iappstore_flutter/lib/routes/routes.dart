import 'package:get/get.dart';
import 'package:iappstore_flutter/pages/common/unknown_page.dart';
import 'package:iappstore_flutter/pages/rank_home/binding/rank_home_binding.dart';
import 'package:iappstore_flutter/pages/rank_home/view/rank_home_page.dart';

abstract class Routes {
  Routes._();

  static const rankHomePage = "/rankHomePage";
  static const unknown = "/unknown";

  ///页面合集
  static final routePage = [
    GetPage(
        name: rankHomePage,
        page: () => const RankHomePage(),
        binding: RankHomeBinding()),
  ];

  static final unknownPage =
      GetPage(name: unknown, page: () => const UnknownPage());
}
