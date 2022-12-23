import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iappstore_flutter/entity/app_detail_m_entity.dart';
import 'package:iappstore_flutter/pages/detail/view/rank_sort_view.dart';
import 'package:iappstore_flutter/resource/constant.dart';

class DetailCell extends StatelessWidget {
  final AppDetailMResults? _model;

  DetailCell({super.key, required AppDetailMResults? model}) : _model = model;

  final isShow = true.obs;
  final extendiPadShot = false.obs;
  final isShowFullDescription = false.obs;

  @override
  Widget build(BuildContext context) {
    // if (_model == null) {
    //   return const Text("loading");
    // } else {
    //   return _getRow(_model!);
    // }

    return RankSortView();
  }

  Widget _getRow(AppDetailMResults model) {
    return Column(
      children: [
        _appDetailHeaderView(model),
        _appDetailScreenShowView(model),
        _appDetailContentSectionView(model),
        _appDetailFooterView(model),
      ],
    );
  }

  Widget _imageView(String? imageURL, double height, double borderRadius) {
    return Visibility(
      visible: imageURL.toString().isNotEmpty,
      child: SizedBox(
        height: height,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: CachedNetworkImage(
            fit: BoxFit.fitHeight,
            imageUrl: imageURL.toString(),
            placeholder: (context, url) => Image.asset("assets/images/placeholder.png"),
          ),
        ),
      ),
    );
  }

  Widget _appDetailTextView(String key, String? value, int lines) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Text(
            key,
            style: const TextStyle(color: Colors.black38, fontSize: 14),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              value ?? "",
              style: const TextStyle(color: Colors.black87, fontSize: 15, fontWeight: FontWeight.bold),
              maxLines: lines,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _appDetailHeaderView(AppDetailMResults model) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              _imageView(model.artworkUrl512, 100, 20),
              const SizedBox(
                height: 15,
              ),
              Text(
                "v${model.version ?? ""}",
                style: const TextStyle(color: Colors.black, fontSize: 18),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                model.averageUserRating?.toStringAsFixed(1) ?? "",
                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const Text(
                "满分 5 分",
                style: TextStyle(fontSize: 14, color: Colors.black45),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            children: [
              _appDetailTextView("价格", model.formattedPrice, 1),
              _appDetailTextView("分级", model.contentAdvisoryRating, 1),
              _appDetailTextView("分类", (model.genres ?? []).join(','), 1),
              _appDetailTextView("App ID", (model.trackId ?? 0).toString(), 1),
              _appDetailTextView("包名", model.bundleId, 1),
              _appDetailTextView("开发者", model.artistName, 2),
              _appDetailTextView("上架时间", model.releaseDate?.replaceFirst("T", " ").replaceFirst("Z", ""), 1),
            ],
          ),
        ),
      ],
    );
  }

  Widget _appDetailScreenShotView(List<String>? urls, double height) {
    return SizedBox(
      height: height,
      child: CustomScrollView(
        scrollDirection: Axis.horizontal,
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final url = urls![index];
                return Padding(padding: const EdgeInsets.symmetric(horizontal: 8), child: _imageView(url, 350, 11));
              },
              childCount: urls?.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _appDetailScreenShotDeviceView(IconData iconData, String deviceName) {
    return Row(
      children: [
        const SizedBox(
          width: 8,
        ),
        Icon(
          iconData,
          color: Colors.black45,
          size: 15,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          deviceName,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black45),
        ),
      ],
    );
  }

  Widget _bothAppDetailScreenShotDeviceView(
      IconData iconDataIphone, String deviceNameIphone, IconData iconDataiPad, String deviceNameiPad) {
    return GestureDetector(
      onTap: () {
        final current = extendiPadShot.value;
        extendiPadShot.value = !current;
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 8,
          ),
          Icon(
            iconDataIphone,
            color: Colors.black45,
            size: 15,
          ),
          Icon(
            iconDataiPad,
            color: Colors.black45,
            size: 15,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            "$deviceNameIphone 和 $deviceNameiPad",
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black45),
          ),
          const Expanded(child: Text("")),
          const Icon(
            Icons.expand_more,
            color: Colors.black45,
            size: 25,
          ),
          const SizedBox(
            width: 5,
          ),
        ],
      ),
    );
  }

  Widget _appDetailScreenShowView(AppDetailMResults model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 8, top: 8, bottom: 8),
          child: Text(
            "预览",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Visibility(
          visible: model.isSupportiPhone,
          child: Column(
            children: [
              _appDetailScreenShotView(model.screenshotUrls, 350),
              const SizedBox(
                height: 8,
              ),
              Obx(() {
                if (model.isSupportiPad && extendiPadShot.value == false) {
                  return _bothAppDetailScreenShotDeviceView(Icons.phone_iphone, "iPhone", Icons.tablet, "iPad");
                } else {
                  return _appDetailScreenShotDeviceView(Icons.phone_iphone, "iPhone");
                }
              }),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Obx(
          () => Visibility(
            visible: extendiPadShot.value || (!model.isSupportiPhone && model.isSupportiPad),
            child: Column(
              children: [
                _appDetailScreenShotView(model.ipadScreenshotUrls, 200),
                const SizedBox(
                  height: 8,
                ),
                _appDetailScreenShotDeviceView(Icons.tablet, "iPad"),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }

  Widget _appDetailContentSectionView(AppDetailMResults model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Obx(() {
                return Text(
                  model.description ?? "",
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                  ),
                  maxLines: isShowFullDescription.value ? null : 3,
                );
              }),
            ),
            Obx(() {
              return Visibility(
                visible: !isShowFullDescription.value,
                child: TextButton(
                  onPressed: () {
                    final current = isShowFullDescription.value;
                    isShowFullDescription.value = !current;
                  },
                  child: Container(
                    width: 35,
                    height: 20,
                    color: Colors.white,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(0),
                    child: const Text(
                      "更多",
                      style: TextStyle(color: Colors.blue, fontSize: 13),
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
        GestureDetector(
          onTap: () {
            debugPrint("打开 safari");
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 20, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.artistName ?? "",
                      style: const TextStyle(color: Colors.blue, fontSize: 14, fontWeight: FontWeight.normal),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "开发者",
                      style: TextStyle(color: Colors.black38, fontSize: 13),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.navigate_next,
                color: Colors.black38,
                size: 25,
              ),
            ],
          ),
        ),
        const Divider(),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            "新功能",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "版本 ${model.version ?? ""}",
                style: const TextStyle(fontSize: 12, color: Colors.black54),
              ),
              Text(
                (model.currentVersionReleaseDate ?? "").replaceFirst("T", " ").replaceFirst("Z", ""),
                style: const TextStyle(fontSize: 12, color: Colors.black54),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            model.releaseNotes ?? "",
            style: const TextStyle(fontSize: 12, color: Colors.black87),
          ),
        ),
        const Divider(),
      ],
    );
  }

  Widget _appDetailFooterCellView(String key, String? value, {String? extendText}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              key,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black54),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                child: Text(
                  value ?? "",
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Visibility(
              // ignore: prefer_is_empty
              visible: extendText != null && extendText.length > 0,
              child: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.expand_more,
                  color: Colors.black45,
                  size: 25,
                ),
              ),
            )
          ],
        ),
        const Divider(),
      ],
    );
  }

  Widget _appDetailFooterView(AppDetailMResults model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "信息",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child: FooterCellView(name: "评分", description: model.averageRating),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child: FooterCellView(name: "评论", description: "${model.userRatingCount}条"),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child: FooterCellView(name: "占用大小", description: model.fileSizeMB),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child: FooterCellView(name: "最低系统支持", description: model.minimumOsVersion),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child: FooterCellView(name: "类别", description: model.genres?.join(",")),
        ),
        // 可扩展显示
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child: FooterCellView(name: "供应商", description: model.sellerName, extendText: model.artistName),
        ),
        // 可扩展显示
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child: FooterCellView(
              name: "兼容性",
              description: "${model.supportedDevices?.length ?? 0}种",
              extendText: model.supportedDevices?.join("\n")),
        ),
        // 可扩展显示
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child: FooterCellView(
              name: "支持语言",
              description: "${model.languageCodesISO2A?.length ?? 0}种",
              extendText: model.languageCodesISO2A?.join("、")),
        ),
        // 可扩展显示
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child: FooterCellView(
              name: "年龄分级", description: model.contentAdvisoryRating, extendText: model.advisories?.join("\n")),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child: FooterCellView(
              name: "更新时间", description: model.currentVersionReleaseDate?.replaceFirst("T", " ").replaceFirst("Z", "")),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child: FooterCellView(
              name: "上架时间", description: model.releaseDate?.replaceFirst("T", " ").replaceFirst("Z", "")),
        ),
      ],
    );
  }
}

class FooterCellView extends StatelessWidget {
  final String name;
  final String? description;
  final String? extendText;

  final isShowExtendText = false.obs;

  FooterCellView({super.key, required this.name, this.description, this.extendText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black54),
            ),
            Obx(() {
              if (isShowExtendText.value == false &&
                  description != null &&
                  // ignore: prefer_is_empty
                  description!.length > 0) {
                return Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      description ?? "",
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                );
              } else {
                return const SizedBox();
              }
            }),
            Obx(() {
              // ignore: prefer_is_empty
              if (isShowExtendText.value == false && extendText != null && extendText!.length > 0) {
                return GestureDetector(
                  onTap: () {
                    final current = isShowExtendText.value;
                    isShowExtendText.value = !current;
                  },
                  child: const Icon(
                    Icons.expand_more,
                    color: Colors.black45,
                    size: 25,
                  ),
                );
              } else {
                return const SizedBox();
              }
            }),
          ],
        ),
        Obx(() {
          // ignore: prefer_is_empty
          if (isShowExtendText.value == true && extendText != null && extendText!.length > 0) {
            return Text(extendText ?? "");
          } else {
            return const SizedBox();
          }
        }),
        const Divider(),
      ],
    );
  }
}
