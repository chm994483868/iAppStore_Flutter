import 'package:get/get.dart';
import 'package:iappstore_flutter/base/base_request_controller.dart';
import 'package:iappstore_flutter/base/interface.dart';
import 'package:iappstore_flutter/entity/app_detail_m_entity.dart';
import 'package:iappstore_flutter/enum/response_status.dart';
import 'package:iappstore_flutter/pages/search/repository/search_repository.dart';
import 'package:iappstore_flutter/resource/constant.dart';

class SearchController extends BaseRequestController<SearchRepository, AppDetailMEntity> implements IClassName {
  static String? get className => (SearchController).toString();
  List<AppDetailMResults> get dataSource => response?.data?.results ?? [];

  final regionName = Constant.regionTypeLists.first.obs;
  final filterViewIsExpanded = false.obs;

  @override
  void onInit() async {
    super.onInit();

    status = ResponseStatus.successNoData;
  }

  void cancel() {
    response = null;
    status = ResponseStatus.successNoData;

    update();
  }

  void searchAppData(String keyword) async {
    if (keyword.isEmpty) {
      return;
    }

    status = ResponseStatus.loading;
    update();

    final regionId = Constant.regionTypeListIds[regionName.value] ?? "cn";
    response = await request.searchAppData(keyWord: keyword, regionId: regionId);

    status = ResponseStatus.successHasContent;

    update();
  }
}
