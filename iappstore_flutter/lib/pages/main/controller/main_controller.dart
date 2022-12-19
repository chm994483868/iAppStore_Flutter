import 'package:get/get.dart';

class MainController extends GetxController {
  var selectedIndex = 0;

  void onItemTapped(int index) {
    selectedIndex = index;

    /// Get.putAsyn 使用的时候要稍微注意，避免先 find 后 put
    // final prefs = Get.find<SharedPreferences>();
    // int? count = prefs.getInt('counter');
    // debugPrint(count as String?);

    update();
  }
}
