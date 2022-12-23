import 'package:iappstore_flutter/generated/json/base/json_field.dart';
import 'package:iappstore_flutter/generated/json/app_detail_m_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class AppDetailMEntity {
  int? resultCount;
  List<AppDetailMResults>? results;

  AppDetailMEntity();

  factory AppDetailMEntity.fromJson(Map<String, dynamic> json) => $AppDetailMEntityFromJson(json);

  Map<String, dynamic> toJson() => $AppDetailMEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AppDetailMResults {
  bool? isGameCenterEnabled;
  List<String>? features;
  List<String>? supportedDevices;
  List<dynamic>? advisories;
  List<String>? screenshotUrls;
  List<String>? ipadScreenshotUrls;
  List<dynamic>? appletvScreenshotUrls;
  String? artworkUrl60;
  String? artworkUrl512;
  String? artworkUrl100;
  String? artistViewUrl;
  String? kind;
  String? currency;
  String? currentVersionReleaseDate;
  int? artistId;
  String? artistName;
  List<String>? genres;
  double? price;
  String? description;
  String? releaseNotes;
  String? releaseDate;
  String? bundleId;
  int? trackId;
  String? trackName;
  List<String>? genreIds;
  String? sellerName;
  String? primaryGenreName;
  int? primaryGenreId;
  bool? isVppDeviceBasedLicensingEnabled;
  String? minimumOsVersion;
  String? trackCensoredName;
  List<String>? languageCodesISO2A;
  String? fileSizeBytes;
  String? formattedPrice;
  String? contentAdvisoryRating;
  double? averageUserRatingForCurrentVersion;
  int? userRatingCountForCurrentVersion;
  double? averageUserRating;
  String? trackViewUrl;
  String? trackContentRating;
  String? version;
  String? wrapperType;
  int? userRatingCount;

  AppDetailMResults();

  factory AppDetailMResults.fromJson(Map<String, dynamic> json) => $AppDetailMResultsFromJson(json);

  Map<String, dynamic> toJson() => $AppDetailMResultsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

  // 下面是自定义函数
  bool get isSupportiPhone => screenshotUrls?.isNotEmpty ?? false;
  bool get isSupportiPad => ipadScreenshotUrls?.isNotEmpty ?? false;

  String get fileSizeMB {
    final sizeBytes = int.parse(fileSizeBytes ?? "0");
    if (sizeBytes <= 0) {
      return "未知";
    } else {
      final sizeMB = sizeBytes / 1024.0 / 1024.0;
      if (sizeMB >= 1024.0) {
        final sizeGB = sizeMB / 1024.0;
        return "${sizeGB.toStringAsFixed(1)} GB";
      } else {
        return "${sizeMB.toStringAsFixed(1)} MB";
      }
    }
  }

  String get averageRating => averageUserRating?.toStringAsFixed(1) ?? "0";
}
