import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iappstore_flutter/entity/app_detail_m_entity.dart';
import 'package:iappstore_flutter/resource/constant.dart';

class DetailCell extends StatelessWidget {
  final AppDetailMResults? _model;

  const DetailCell({super.key, required AppDetailMResults? model}) : _model = model;

  @override
  Widget build(BuildContext context) {
    if (_model == null) {
      return const Text("loading");
    } else {
      return _getRow(_model!);
    }
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
              _appDetailTextView("上架时间", model.releaseDate, 1),
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
            )),
        _appDetailScreenShotView(model.screenshotUrls, 350),
        const SizedBox(
          height: 8,
        ),
        _appDetailScreenShotDeviceView(Icons.phone_iphone, "iPhone"),
        const SizedBox(
          height: 8,
        ),
        _appDetailScreenShotView(model.ipadScreenshotUrls, 200),
        const SizedBox(
          height: 8,
        ),
        _appDetailScreenShotDeviceView(Icons.padding, "iPad"),
        const SizedBox(
          height: 8,
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            model.description ?? "",
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Row(
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
            ),
          ],
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
                model.currentVersionReleaseDate ?? "",
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

  Widget _appDetailFooterCellView(String key, String? value) {
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
              child: Text(
                value ?? "",
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black),
                textDirection: TextDirection.rtl,
              ),
            ),
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
          child: _appDetailFooterCellView("评分", model.averageUserRating.toString()),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child: _appDetailFooterCellView("评论", "${model.userRatingCount}条"),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child: _appDetailFooterCellView("占用大小", model.fileSizeBytes),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child: _appDetailFooterCellView("最低系统支持", model.minimumOsVersion),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child: _appDetailFooterCellView("类别", model.genres?.join(",")),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child: _appDetailFooterCellView("供应商", model.sellerName),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child: _appDetailFooterCellView("兼容性", model.supportedDevices?.join(",")),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child: _appDetailFooterCellView("支持语言", model.languageCodesISO2A?.join(",")),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child: _appDetailFooterCellView("年龄分级", model.contentAdvisoryRating),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child: _appDetailFooterCellView("更新时间", model.currentVersionReleaseDate),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child: _appDetailFooterCellView("上架时间", model.releaseDate),
        ),
      ],
    );
  }
}
