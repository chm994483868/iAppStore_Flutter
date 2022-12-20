import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iappstore_flutter/entity/app_rank_m_entity.dart';
import 'package:iappstore_flutter/resource/constant.dart';

class RankCell extends StatelessWidget {
  final AppRankMFeedEntry _model;
  final int _index;
  final ValueChanged<AppRankMFeedEntry> _cellTapCallback;

  const RankCell(
      {super.key,
      required AppRankMFeedEntry model,
      required int index,
      required ValueChanged<AppRankMFeedEntry> callback})
      : _model = model,
        _index = index,
        _cellTapCallback = callback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _cellTapCallback(_model);
      },
      child:
          // Expanded(
          //   flex: 1,
          //   child:
          _getRow(),
      // ),
    );
  }

  Widget _getRow() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _imageView(),
            _serialNumber(),
            _contentView(),
          ],
        ),
        const Divider(),
      ],
    );
  }

  Widget _imageView() {
    return Visibility(
      visible: _model.imimage.toString().isNotEmpty,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 17),
        child: SizedBox(
          height: 75,
          width: 75,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CachedNetworkImage(
              fit: BoxFit.fitHeight,
              imageUrl: _model.imimage?.last.label.toString() ?? Constant.appImagePlaceholder,
              placeholder: (context, url) => Image.asset("assets/images/placeholder.png"),
            ),
          ),
        ),
      ),
    );
  }

  Widget _serialNumber() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text(
        (_index + 1).toString(),
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _contentView() {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App 名字
            Text(
              _model.imname?.label.toString() ?? "",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0094FF),
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 5,
            ),
            // App 描述
            Text(
              _model.summary?.label.toString() ?? "".replaceAll("会议", "狗狗"),
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black45,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 10,
            ),
            // App 所属类型和价格
            Row(
              children: [
                Text(
                  _model.category?.attributes?.label ?? "",
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                ),
                Visibility(
                  visible: (_model.imprice?.attributes?.amount ?? "0.00") != "0.00",
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      (_model.imprice?.attributes?.currency ?? "") +
                          (_model.imprice?.attributes?.amount ?? ""),
                      style: const TextStyle(fontSize: 13, color: Colors.pink),
                    ),
                  ),
                ),
              ],
            ),
            // App 开发者
            Text(
              _model.imartist?.label ?? "",
              style: const TextStyle(fontSize: 13, color: Colors.black45),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
