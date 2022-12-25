import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iappstore_flutter/entity/app_detail_m_entity.dart';

class SearchCell extends StatelessWidget {
  final AppDetailMResults _model;
  final int _index;
  final ValueChanged<AppDetailMResults> _cellTapCallback;

  const SearchCell(
      {super.key,
      required AppDetailMResults model,
      required int index,
      required ValueChanged<AppDetailMResults> callback})
      : _model = model,
        _index = index,
        _cellTapCallback = callback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _cellTapCallback(_model);
      },
      child: _getRow(),
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
      visible: _model.artworkUrl100.toString().isNotEmpty,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 17),
        child: SizedBox(
          height: 75,
          width: 75,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CachedNetworkImage(
              fit: BoxFit.fitHeight,
              imageUrl: _model.artworkUrl100.toString(),
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
              _model.trackName.toString(),
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
              _model.description.toString().replaceAll("\n", ""),
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
                  (_model.genres ?? []).join(","),
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                ),
                Visibility(
                  visible: (_model.price ?? 0) != 0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      (_model.formattedPrice ?? ""),
                      style: const TextStyle(fontSize: 13, color: Colors.pink),
                    ),
                  ),
                ),
              ],
            ),
            // App 开发者
            Text(
              _model.artistName ?? "",
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
