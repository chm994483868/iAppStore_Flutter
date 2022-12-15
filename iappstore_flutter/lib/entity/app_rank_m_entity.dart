import 'package:iappstore_flutter/generated/json/base/json_field.dart';
import 'package:iappstore_flutter/generated/json/app_rank_m_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class AppRankMEntity {
  AppRankMFeed? feed;

  AppRankMEntity();

  factory AppRankMEntity.fromJson(Map<String, dynamic> json) => $AppRankMEntityFromJson(json);

  Map<String, dynamic> toJson() => $AppRankMEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AppRankMFeed {
  AppRankMFeedAuthor? author;
  List<AppRankMFeedEntry>? entry;
  AppRankMFeedUpdated? updated;
  AppRankMFeedRights? rights;
  AppRankMFeedTitle? title;
  AppRankMFeedIcon? icon;
  List<AppRankMFeedLink>? link;
  AppRankMFeedId? id;

  AppRankMFeed();

  factory AppRankMFeed.fromJson(Map<String, dynamic> json) => $AppRankMFeedFromJson(json);

  Map<String, dynamic> toJson() => $AppRankMFeedToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AppRankMFeedAuthor {
  AppRankMFeedAuthorName? name;
  AppRankMFeedAuthorUri? uri;

  AppRankMFeedAuthor();

  factory AppRankMFeedAuthor.fromJson(Map<String, dynamic> json) => $AppRankMFeedAuthorFromJson(json);

  Map<String, dynamic> toJson() => $AppRankMFeedAuthorToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AppRankMFeedAuthorName {
  String? label;

  AppRankMFeedAuthorName();

  factory AppRankMFeedAuthorName.fromJson(Map<String, dynamic> json) => $AppRankMFeedAuthorNameFromJson(json);

  Map<String, dynamic> toJson() => $AppRankMFeedAuthorNameToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AppRankMFeedAuthorUri {
  String? label;

  AppRankMFeedAuthorUri();

  factory AppRankMFeedAuthorUri.fromJson(Map<String, dynamic> json) => $AppRankMFeedAuthorUriFromJson(json);

  Map<String, dynamic> toJson() => $AppRankMFeedAuthorUriToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AppRankMFeedEntry {
  @JSONField(name: "im:name")
  AppRankMFeedEntryImname? imname;
  @JSONField(name: "im:image")
  List<AppRankMFeedEntryImimage>? imimage;
  AppRankMFeedEntrySummary? summary;
  @JSONField(name: "im:price")
  AppRankMFeedEntryImprice? imprice;
  @JSONField(name: "im:contentType")
  AppRankMFeedEntryImcontentType? imcontentType;
  AppRankMFeedEntryRights? rights;
  AppRankMFeedEntryTitle? title;
  List<AppRankMFeedEntryLink>? link;
  AppRankMFeedEntryId? id;
  @JSONField(name: "im:artist")
  AppRankMFeedEntryImartist? imartist;
  AppRankMFeedEntryCategory? category;
  @JSONField(name: "im:releaseDate")
  AppRankMFeedEntryImreleaseDate? imreleaseDate;

  AppRankMFeedEntry();

  factory AppRankMFeedEntry.fromJson(Map<String, dynamic> json) => $AppRankMFeedEntryFromJson(json);

  Map<String, dynamic> toJson() => $AppRankMFeedEntryToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AppRankMFeedEntryImname {
  String? label;

  AppRankMFeedEntryImname();

  factory AppRankMFeedEntryImname.fromJson(Map<String, dynamic> json) => $AppRankMFeedEntryImnameFromJson(json);

  Map<String, dynamic> toJson() => $AppRankMFeedEntryImnameToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AppRankMFeedEntryImimage {
  String? label;
  AppRankMFeedEntryImimageAttributes? attributes;

  AppRankMFeedEntryImimage();

  factory AppRankMFeedEntryImimage.fromJson(Map<String, dynamic> json) => $AppRankMFeedEntryImimageFromJson(json);

  Map<String, dynamic> toJson() => $AppRankMFeedEntryImimageToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AppRankMFeedEntryImimageAttributes {
  String? height;

  AppRankMFeedEntryImimageAttributes();

  factory AppRankMFeedEntryImimageAttributes.fromJson(Map<String, dynamic> json) =>
      $AppRankMFeedEntryImimageAttributesFromJson(json);

  Map<String, dynamic> toJson() => $AppRankMFeedEntryImimageAttributesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AppRankMFeedEntrySummary {
  String? label;

  AppRankMFeedEntrySummary();

  factory AppRankMFeedEntrySummary.fromJson(Map<String, dynamic> json) => $AppRankMFeedEntrySummaryFromJson(json);

  Map<String, dynamic> toJson() => $AppRankMFeedEntrySummaryToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AppRankMFeedEntryImprice {
  String? label;
  AppRankMFeedEntryImpriceAttributes? attributes;

  AppRankMFeedEntryImprice();

  factory AppRankMFeedEntryImprice.fromJson(Map<String, dynamic> json) => $AppRankMFeedEntryImpriceFromJson(json);

  Map<String, dynamic> toJson() => $AppRankMFeedEntryImpriceToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AppRankMFeedEntryImpriceAttributes {
  String? amount;
  String? currency;

  AppRankMFeedEntryImpriceAttributes();

  factory AppRankMFeedEntryImpriceAttributes.fromJson(Map<String, dynamic> json) =>
      $AppRankMFeedEntryImpriceAttributesFromJson(json);

  Map<String, dynamic> toJson() => $AppRankMFeedEntryImpriceAttributesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AppRankMFeedEntryImcontentType {
  AppRankMFeedEntryImcontentTypeAttributes? attributes;

  AppRankMFeedEntryImcontentType();

  factory AppRankMFeedEntryImcontentType.fromJson(Map<String, dynamic> json) =>
      $AppRankMFeedEntryImcontentTypeFromJson(json);

  Map<String, dynamic> toJson() => $AppRankMFeedEntryImcontentTypeToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AppRankMFeedEntryImcontentTypeAttributes {
  String? term;
  String? label;

  AppRankMFeedEntryImcontentTypeAttributes();

  factory AppRankMFeedEntryImcontentTypeAttributes.fromJson(Map<String, dynamic> json) =>
      $AppRankMFeedEntryImcontentTypeAttributesFromJson(json);

  Map<String, dynamic> toJson() => $AppRankMFeedEntryImcontentTypeAttributesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AppRankMFeedEntryRights {
  String? label;

  AppRankMFeedEntryRights();

  factory AppRankMFeedEntryRights.fromJson(Map<String, dynamic> json) => $AppRankMFeedEntryRightsFromJson(json);

  Map<String, dynamic> toJson() => $AppRankMFeedEntryRightsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AppRankMFeedEntryTitle {
  String? label;

  AppRankMFeedEntryTitle();

  factory AppRankMFeedEntryTitle.fromJson(Map<String, dynamic> json) => $AppRankMFeedEntryTitleFromJson(json);

  Map<String, dynamic> toJson() => $AppRankMFeedEntryTitleToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AppRankMFeedEntryLink {
  AppRankMFeedEntryLinkAttributes? attributes;
  @JSONField(name: "im:duration")
  AppRankMFeedEntryLinkImduration? imduration;

  AppRankMFeedEntryLink();

  factory AppRankMFeedEntryLink.fromJson(Map<String, dynamic> json) => $AppRankMFeedEntryLinkFromJson(json);

  Map<String, dynamic> toJson() => $AppRankMFeedEntryLinkToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AppRankMFeedEntryLinkAttributes {
  String? rel;
  String? type;
  String? href;

  AppRankMFeedEntryLinkAttributes();

  factory AppRankMFeedEntryLinkAttributes.fromJson(Map<String, dynamic> json) =>
      $AppRankMFeedEntryLinkAttributesFromJson(json);

  Map<String, dynamic> toJson() => $AppRankMFeedEntryLinkAttributesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AppRankMFeedEntryLinkImduration {
  String? label;

  AppRankMFeedEntryLinkImduration();

  factory AppRankMFeedEntryLinkImduration.fromJson(Map<String, dynamic> json) =>
      $AppRankMFeedEntryLinkImdurationFromJson(json);

  Map<String, dynamic> toJson() => $AppRankMFeedEntryLinkImdurationToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AppRankMFeedEntryId {
  String? label;
  AppRankMFeedEntryIdAttributes? attributes;

  AppRankMFeedEntryId();

  factory AppRankMFeedEntryId.fromJson(Map<String, dynamic> json) => $AppRankMFeedEntryIdFromJson(json);

  Map<String, dynamic> toJson() => $AppRankMFeedEntryIdToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AppRankMFeedEntryIdAttributes {
  @JSONField(name: "im:id")
  String? imid;
  @JSONField(name: "im:bundleId")
  String? imbundleId;

  AppRankMFeedEntryIdAttributes();

  factory AppRankMFeedEntryIdAttributes.fromJson(Map<String, dynamic> json) =>
      $AppRankMFeedEntryIdAttributesFromJson(json);

  Map<String, dynamic> toJson() => $AppRankMFeedEntryIdAttributesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AppRankMFeedEntryImartist {
  String? label;
  AppRankMFeedEntryImartistAttributes? attributes;

  AppRankMFeedEntryImartist();

  factory AppRankMFeedEntryImartist.fromJson(Map<String, dynamic> json) => $AppRankMFeedEntryImartistFromJson(json);

  Map<String, dynamic> toJson() => $AppRankMFeedEntryImartistToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AppRankMFeedEntryImartistAttributes {
  String? href;

  AppRankMFeedEntryImartistAttributes();

  factory AppRankMFeedEntryImartistAttributes.fromJson(Map<String, dynamic> json) =>
      $AppRankMFeedEntryImartistAttributesFromJson(json);

  Map<String, dynamic> toJson() => $AppRankMFeedEntryImartistAttributesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AppRankMFeedEntryCategory {
  AppRankMFeedEntryCategoryAttributes? attributes;

  AppRankMFeedEntryCategory();

  factory AppRankMFeedEntryCategory.fromJson(Map<String, dynamic> json) => $AppRankMFeedEntryCategoryFromJson(json);

  Map<String, dynamic> toJson() => $AppRankMFeedEntryCategoryToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AppRankMFeedEntryCategoryAttributes {
  @JSONField(name: "im:id")
  String? imid;
  String? term;
  String? scheme;
  String? label;

  AppRankMFeedEntryCategoryAttributes();

  factory AppRankMFeedEntryCategoryAttributes.fromJson(Map<String, dynamic> json) =>
      $AppRankMFeedEntryCategoryAttributesFromJson(json);

  Map<String, dynamic> toJson() => $AppRankMFeedEntryCategoryAttributesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AppRankMFeedEntryImreleaseDate {
  String? label;
  AppRankMFeedEntryImreleaseDateAttributes? attributes;

  AppRankMFeedEntryImreleaseDate();

  factory AppRankMFeedEntryImreleaseDate.fromJson(Map<String, dynamic> json) =>
      $AppRankMFeedEntryImreleaseDateFromJson(json);

  Map<String, dynamic> toJson() => $AppRankMFeedEntryImreleaseDateToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AppRankMFeedEntryImreleaseDateAttributes {
  String? label;

  AppRankMFeedEntryImreleaseDateAttributes();

  factory AppRankMFeedEntryImreleaseDateAttributes.fromJson(Map<String, dynamic> json) =>
      $AppRankMFeedEntryImreleaseDateAttributesFromJson(json);

  Map<String, dynamic> toJson() => $AppRankMFeedEntryImreleaseDateAttributesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AppRankMFeedUpdated {
  String? label;

  AppRankMFeedUpdated();

  factory AppRankMFeedUpdated.fromJson(Map<String, dynamic> json) => $AppRankMFeedUpdatedFromJson(json);

  Map<String, dynamic> toJson() => $AppRankMFeedUpdatedToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AppRankMFeedRights {
  String? label;

  AppRankMFeedRights();

  factory AppRankMFeedRights.fromJson(Map<String, dynamic> json) => $AppRankMFeedRightsFromJson(json);

  Map<String, dynamic> toJson() => $AppRankMFeedRightsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AppRankMFeedTitle {
  String? label;

  AppRankMFeedTitle();

  factory AppRankMFeedTitle.fromJson(Map<String, dynamic> json) => $AppRankMFeedTitleFromJson(json);

  Map<String, dynamic> toJson() => $AppRankMFeedTitleToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AppRankMFeedIcon {
  String? label;

  AppRankMFeedIcon();

  factory AppRankMFeedIcon.fromJson(Map<String, dynamic> json) => $AppRankMFeedIconFromJson(json);

  Map<String, dynamic> toJson() => $AppRankMFeedIconToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AppRankMFeedLink {
  AppRankMFeedLinkAttributes? attributes;

  AppRankMFeedLink();

  factory AppRankMFeedLink.fromJson(Map<String, dynamic> json) => $AppRankMFeedLinkFromJson(json);

  Map<String, dynamic> toJson() => $AppRankMFeedLinkToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AppRankMFeedLinkAttributes {
  String? rel;
  String? type;
  String? href;

  AppRankMFeedLinkAttributes();

  factory AppRankMFeedLinkAttributes.fromJson(Map<String, dynamic> json) => $AppRankMFeedLinkAttributesFromJson(json);

  Map<String, dynamic> toJson() => $AppRankMFeedLinkAttributesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AppRankMFeedId {
  String? label;

  AppRankMFeedId();

  factory AppRankMFeedId.fromJson(Map<String, dynamic> json) => $AppRankMFeedIdFromJson(json);

  Map<String, dynamic> toJson() => $AppRankMFeedIdToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
