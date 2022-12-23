import 'package:get/get.dart';
import 'package:iappstore_flutter/pages/common/unknown_page.dart';
import 'package:iappstore_flutter/pages/detail/binding/detail_binding.dart';
import 'package:iappstore_flutter/pages/detail/view/detail_page.dart';
import 'package:iappstore_flutter/pages/main/bindings/main_binding.dart';
import 'package:iappstore_flutter/pages/main/view/main_page.dart';
import 'package:iappstore_flutter/pages/rank_home/binding/rank_home_binding.dart';
import 'package:iappstore_flutter/pages/rank_home/view/rank_home_page.dart';
import 'package:iappstore_flutter/pages/search/bindings/search_binding.dart';
import 'package:iappstore_flutter/pages/search/view/search_page.dart';
import 'package:iappstore_flutter/pages/setting/bindings/setting_binding.dart';
import 'package:iappstore_flutter/pages/setting/view/setting_page.dart';
import 'package:iappstore_flutter/pages/subscription/bindings/subscription_binding.dart';
import 'package:iappstore_flutter/pages/subscription/view/subscription_page.dart';

abstract class Routes {
  Routes._();

  static const rankHomePage = "/rankHomePage";
  static const unknown = "/unknown";
  static const main = "/main";
  static const detailPage = "/detailPage";
  static const searchPage = "/searchPage";
  static const subscriptionPage = "/subscriptionPage";
  static const settingPage = "/settingPage";

  /// 页面合集
  static final routePage = [
    GetPage(
      name: main,
      page: () => const MainPage(),
      bindings: [
        MainBinding(),
        RankHomeBinding(),
        SearchBinding(),
        SubscriptionBinding(),
        SettingBinding(),
      ],
    ),
    GetPage(
      name: rankHomePage,
      page: () => const RankHomePage(),
      binding: RankHomeBinding(),
    ),
    GetPage(
      name: detailPage,
      page: () => const DetailPage(),
      binding: DetailBinding(),
    ),
    GetPage(
      name: searchPage,
      page: () => const SearchPage(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: subscriptionPage,
      page: () => const SubscriptionPage(),
      binding: SubscriptionBinding(),
    ),
    GetPage(
      name: settingPage,
      page: () => const SettingPage(),
      binding: SettingBinding(),
    ),
  ];

  static final unknownPage = GetPage(name: unknown, page: () => const UnknownPage());
}
