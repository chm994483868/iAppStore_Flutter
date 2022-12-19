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

  Widget _imageView(String? imageURL, double height, double width, double borderRadius) {
    return Visibility(
      visible: imageURL.toString().isNotEmpty,
      child: SizedBox(
        height: height,
        width: width,
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

  Widget _appDetailTextView(String key, String? value) {
    return Row(
      children: [
        Text(
          key,
          style: const TextStyle(color: Colors.black38, fontSize: 14),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          value ?? "",
          style: const TextStyle(color: Colors.black87, fontSize: 15, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Widget _appDetailHeaderView(AppDetailMResults model) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: [
              _imageView(model.artworkUrl512, 100, 100, 20),
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
            child: Column(
          children: [
            _appDetailTextView("价格", model.formattedPrice),
            _appDetailTextView("分级", model.contentAdvisoryRating),
            // _appdeta
          ],
        )),
      ],
    );
  }

  Widget _appDetailScreenShowView(AppDetailMResults model) {
    return const Text("456");
  }

  Widget _appDetailContentSectionView(AppDetailMResults model) {
    return const Text("789");
  }

  Widget _appDetailFooterView(AppDetailMResults model) {
    return const Text("000");
  }
}
