import 'package:iappstore_flutter/generated/json/base/json_convert_content.dart';
import 'package:iappstore_flutter/entity/app_rank_m_entity.dart';

AppRankMEntity $AppRankMEntityFromJson(Map<String, dynamic> json) {
	final AppRankMEntity appRankMEntity = AppRankMEntity();
	final AppRankMFeed? feed = jsonConvert.convert<AppRankMFeed>(json['feed']);
	if (feed != null) {
		appRankMEntity.feed = feed;
	}
	return appRankMEntity;
}

Map<String, dynamic> $AppRankMEntityToJson(AppRankMEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['feed'] = entity.feed?.toJson();
	return data;
}

AppRankMFeed $AppRankMFeedFromJson(Map<String, dynamic> json) {
	final AppRankMFeed appRankMFeed = AppRankMFeed();
	final AppRankMFeedAuthor? author = jsonConvert.convert<AppRankMFeedAuthor>(json['author']);
	if (author != null) {
		appRankMFeed.author = author;
	}
	final AppRankMFeedEntry? entry = jsonConvert.convert<AppRankMFeedEntry>(json['entry']);
	if (entry != null) {
		appRankMFeed.entry = entry;
	}
	final AppRankMFeedUpdated? updated = jsonConvert.convert<AppRankMFeedUpdated>(json['updated']);
	if (updated != null) {
		appRankMFeed.updated = updated;
	}
	final AppRankMFeedRights? rights = jsonConvert.convert<AppRankMFeedRights>(json['rights']);
	if (rights != null) {
		appRankMFeed.rights = rights;
	}
	final AppRankMFeedTitle? title = jsonConvert.convert<AppRankMFeedTitle>(json['title']);
	if (title != null) {
		appRankMFeed.title = title;
	}
	final AppRankMFeedIcon? icon = jsonConvert.convert<AppRankMFeedIcon>(json['icon']);
	if (icon != null) {
		appRankMFeed.icon = icon;
	}
	final List<AppRankMFeedLink>? link = jsonConvert.convertListNotNull<AppRankMFeedLink>(json['link']);
	if (link != null) {
		appRankMFeed.link = link;
	}
	final AppRankMFeedId? id = jsonConvert.convert<AppRankMFeedId>(json['id']);
	if (id != null) {
		appRankMFeed.id = id;
	}
	return appRankMFeed;
}

Map<String, dynamic> $AppRankMFeedToJson(AppRankMFeed entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['author'] = entity.author?.toJson();
	data['entry'] = entity.entry?.toJson();
	data['updated'] = entity.updated?.toJson();
	data['rights'] = entity.rights?.toJson();
	data['title'] = entity.title?.toJson();
	data['icon'] = entity.icon?.toJson();
	data['link'] =  entity.link?.map((v) => v.toJson()).toList();
	data['id'] = entity.id?.toJson();
	return data;
}

AppRankMFeedAuthor $AppRankMFeedAuthorFromJson(Map<String, dynamic> json) {
	final AppRankMFeedAuthor appRankMFeedAuthor = AppRankMFeedAuthor();
	final AppRankMFeedAuthorName? name = jsonConvert.convert<AppRankMFeedAuthorName>(json['name']);
	if (name != null) {
		appRankMFeedAuthor.name = name;
	}
	final AppRankMFeedAuthorUri? uri = jsonConvert.convert<AppRankMFeedAuthorUri>(json['uri']);
	if (uri != null) {
		appRankMFeedAuthor.uri = uri;
	}
	return appRankMFeedAuthor;
}

Map<String, dynamic> $AppRankMFeedAuthorToJson(AppRankMFeedAuthor entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['name'] = entity.name?.toJson();
	data['uri'] = entity.uri?.toJson();
	return data;
}

AppRankMFeedAuthorName $AppRankMFeedAuthorNameFromJson(Map<String, dynamic> json) {
	final AppRankMFeedAuthorName appRankMFeedAuthorName = AppRankMFeedAuthorName();
	final String? label = jsonConvert.convert<String>(json['label']);
	if (label != null) {
		appRankMFeedAuthorName.label = label;
	}
	return appRankMFeedAuthorName;
}

Map<String, dynamic> $AppRankMFeedAuthorNameToJson(AppRankMFeedAuthorName entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['label'] = entity.label;
	return data;
}

AppRankMFeedAuthorUri $AppRankMFeedAuthorUriFromJson(Map<String, dynamic> json) {
	final AppRankMFeedAuthorUri appRankMFeedAuthorUri = AppRankMFeedAuthorUri();
	final String? label = jsonConvert.convert<String>(json['label']);
	if (label != null) {
		appRankMFeedAuthorUri.label = label;
	}
	return appRankMFeedAuthorUri;
}

Map<String, dynamic> $AppRankMFeedAuthorUriToJson(AppRankMFeedAuthorUri entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['label'] = entity.label;
	return data;
}

AppRankMFeedEntry $AppRankMFeedEntryFromJson(Map<String, dynamic> json) {
	final AppRankMFeedEntry appRankMFeedEntry = AppRankMFeedEntry();
	final AppRankMFeedEntryImname? imname = jsonConvert.convert<AppRankMFeedEntryImname>(json['im:name']);
	if (imname != null) {
		appRankMFeedEntry.imname = imname;
	}
	final List<AppRankMFeedEntryImimage>? imimage = jsonConvert.convertListNotNull<AppRankMFeedEntryImimage>(json['im:image']);
	if (imimage != null) {
		appRankMFeedEntry.imimage = imimage;
	}
	final AppRankMFeedEntrySummary? summary = jsonConvert.convert<AppRankMFeedEntrySummary>(json['summary']);
	if (summary != null) {
		appRankMFeedEntry.summary = summary;
	}
	final AppRankMFeedEntryImprice? imprice = jsonConvert.convert<AppRankMFeedEntryImprice>(json['im:price']);
	if (imprice != null) {
		appRankMFeedEntry.imprice = imprice;
	}
	final AppRankMFeedEntryImcontentType? imcontentType = jsonConvert.convert<AppRankMFeedEntryImcontentType>(json['im:contentType']);
	if (imcontentType != null) {
		appRankMFeedEntry.imcontentType = imcontentType;
	}
	final AppRankMFeedEntryRights? rights = jsonConvert.convert<AppRankMFeedEntryRights>(json['rights']);
	if (rights != null) {
		appRankMFeedEntry.rights = rights;
	}
	final AppRankMFeedEntryTitle? title = jsonConvert.convert<AppRankMFeedEntryTitle>(json['title']);
	if (title != null) {
		appRankMFeedEntry.title = title;
	}
	final List<AppRankMFeedEntryLink>? link = jsonConvert.convertListNotNull<AppRankMFeedEntryLink>(json['link']);
	if (link != null) {
		appRankMFeedEntry.link = link;
	}
	final AppRankMFeedEntryId? id = jsonConvert.convert<AppRankMFeedEntryId>(json['id']);
	if (id != null) {
		appRankMFeedEntry.id = id;
	}
	final AppRankMFeedEntryImartist? imartist = jsonConvert.convert<AppRankMFeedEntryImartist>(json['im:artist']);
	if (imartist != null) {
		appRankMFeedEntry.imartist = imartist;
	}
	final AppRankMFeedEntryCategory? category = jsonConvert.convert<AppRankMFeedEntryCategory>(json['category']);
	if (category != null) {
		appRankMFeedEntry.category = category;
	}
	final AppRankMFeedEntryImreleaseDate? imreleaseDate = jsonConvert.convert<AppRankMFeedEntryImreleaseDate>(json['im:releaseDate']);
	if (imreleaseDate != null) {
		appRankMFeedEntry.imreleaseDate = imreleaseDate;
	}
	return appRankMFeedEntry;
}

Map<String, dynamic> $AppRankMFeedEntryToJson(AppRankMFeedEntry entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['im:name'] = entity.imname?.toJson();
	data['im:image'] =  entity.imimage?.map((v) => v.toJson()).toList();
	data['summary'] = entity.summary?.toJson();
	data['im:price'] = entity.imprice?.toJson();
	data['im:contentType'] = entity.imcontentType?.toJson();
	data['rights'] = entity.rights?.toJson();
	data['title'] = entity.title?.toJson();
	data['link'] =  entity.link?.map((v) => v.toJson()).toList();
	data['id'] = entity.id?.toJson();
	data['im:artist'] = entity.imartist?.toJson();
	data['category'] = entity.category?.toJson();
	data['im:releaseDate'] = entity.imreleaseDate?.toJson();
	return data;
}

AppRankMFeedEntryImname $AppRankMFeedEntryImnameFromJson(Map<String, dynamic> json) {
	final AppRankMFeedEntryImname appRankMFeedEntryImname = AppRankMFeedEntryImname();
	final String? label = jsonConvert.convert<String>(json['label']);
	if (label != null) {
		appRankMFeedEntryImname.label = label;
	}
	return appRankMFeedEntryImname;
}

Map<String, dynamic> $AppRankMFeedEntryImnameToJson(AppRankMFeedEntryImname entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['label'] = entity.label;
	return data;
}

AppRankMFeedEntryImimage $AppRankMFeedEntryImimageFromJson(Map<String, dynamic> json) {
	final AppRankMFeedEntryImimage appRankMFeedEntryImimage = AppRankMFeedEntryImimage();
	final String? label = jsonConvert.convert<String>(json['label']);
	if (label != null) {
		appRankMFeedEntryImimage.label = label;
	}
	final AppRankMFeedEntryImimageAttributes? attributes = jsonConvert.convert<AppRankMFeedEntryImimageAttributes>(json['attributes']);
	if (attributes != null) {
		appRankMFeedEntryImimage.attributes = attributes;
	}
	return appRankMFeedEntryImimage;
}

Map<String, dynamic> $AppRankMFeedEntryImimageToJson(AppRankMFeedEntryImimage entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['label'] = entity.label;
	data['attributes'] = entity.attributes?.toJson();
	return data;
}

AppRankMFeedEntryImimageAttributes $AppRankMFeedEntryImimageAttributesFromJson(Map<String, dynamic> json) {
	final AppRankMFeedEntryImimageAttributes appRankMFeedEntryImimageAttributes = AppRankMFeedEntryImimageAttributes();
	final String? height = jsonConvert.convert<String>(json['height']);
	if (height != null) {
		appRankMFeedEntryImimageAttributes.height = height;
	}
	return appRankMFeedEntryImimageAttributes;
}

Map<String, dynamic> $AppRankMFeedEntryImimageAttributesToJson(AppRankMFeedEntryImimageAttributes entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['height'] = entity.height;
	return data;
}

AppRankMFeedEntrySummary $AppRankMFeedEntrySummaryFromJson(Map<String, dynamic> json) {
	final AppRankMFeedEntrySummary appRankMFeedEntrySummary = AppRankMFeedEntrySummary();
	final String? label = jsonConvert.convert<String>(json['label']);
	if (label != null) {
		appRankMFeedEntrySummary.label = label;
	}
	return appRankMFeedEntrySummary;
}

Map<String, dynamic> $AppRankMFeedEntrySummaryToJson(AppRankMFeedEntrySummary entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['label'] = entity.label;
	return data;
}

AppRankMFeedEntryImprice $AppRankMFeedEntryImpriceFromJson(Map<String, dynamic> json) {
	final AppRankMFeedEntryImprice appRankMFeedEntryImprice = AppRankMFeedEntryImprice();
	final String? label = jsonConvert.convert<String>(json['label']);
	if (label != null) {
		appRankMFeedEntryImprice.label = label;
	}
	final AppRankMFeedEntryImpriceAttributes? attributes = jsonConvert.convert<AppRankMFeedEntryImpriceAttributes>(json['attributes']);
	if (attributes != null) {
		appRankMFeedEntryImprice.attributes = attributes;
	}
	return appRankMFeedEntryImprice;
}

Map<String, dynamic> $AppRankMFeedEntryImpriceToJson(AppRankMFeedEntryImprice entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['label'] = entity.label;
	data['attributes'] = entity.attributes?.toJson();
	return data;
}

AppRankMFeedEntryImpriceAttributes $AppRankMFeedEntryImpriceAttributesFromJson(Map<String, dynamic> json) {
	final AppRankMFeedEntryImpriceAttributes appRankMFeedEntryImpriceAttributes = AppRankMFeedEntryImpriceAttributes();
	final String? amount = jsonConvert.convert<String>(json['amount']);
	if (amount != null) {
		appRankMFeedEntryImpriceAttributes.amount = amount;
	}
	final String? currency = jsonConvert.convert<String>(json['currency']);
	if (currency != null) {
		appRankMFeedEntryImpriceAttributes.currency = currency;
	}
	return appRankMFeedEntryImpriceAttributes;
}

Map<String, dynamic> $AppRankMFeedEntryImpriceAttributesToJson(AppRankMFeedEntryImpriceAttributes entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['amount'] = entity.amount;
	data['currency'] = entity.currency;
	return data;
}

AppRankMFeedEntryImcontentType $AppRankMFeedEntryImcontentTypeFromJson(Map<String, dynamic> json) {
	final AppRankMFeedEntryImcontentType appRankMFeedEntryImcontentType = AppRankMFeedEntryImcontentType();
	final AppRankMFeedEntryImcontentTypeAttributes? attributes = jsonConvert.convert<AppRankMFeedEntryImcontentTypeAttributes>(json['attributes']);
	if (attributes != null) {
		appRankMFeedEntryImcontentType.attributes = attributes;
	}
	return appRankMFeedEntryImcontentType;
}

Map<String, dynamic> $AppRankMFeedEntryImcontentTypeToJson(AppRankMFeedEntryImcontentType entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['attributes'] = entity.attributes?.toJson();
	return data;
}

AppRankMFeedEntryImcontentTypeAttributes $AppRankMFeedEntryImcontentTypeAttributesFromJson(Map<String, dynamic> json) {
	final AppRankMFeedEntryImcontentTypeAttributes appRankMFeedEntryImcontentTypeAttributes = AppRankMFeedEntryImcontentTypeAttributes();
	final String? term = jsonConvert.convert<String>(json['term']);
	if (term != null) {
		appRankMFeedEntryImcontentTypeAttributes.term = term;
	}
	final String? label = jsonConvert.convert<String>(json['label']);
	if (label != null) {
		appRankMFeedEntryImcontentTypeAttributes.label = label;
	}
	return appRankMFeedEntryImcontentTypeAttributes;
}

Map<String, dynamic> $AppRankMFeedEntryImcontentTypeAttributesToJson(AppRankMFeedEntryImcontentTypeAttributes entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['term'] = entity.term;
	data['label'] = entity.label;
	return data;
}

AppRankMFeedEntryRights $AppRankMFeedEntryRightsFromJson(Map<String, dynamic> json) {
	final AppRankMFeedEntryRights appRankMFeedEntryRights = AppRankMFeedEntryRights();
	final String? label = jsonConvert.convert<String>(json['label']);
	if (label != null) {
		appRankMFeedEntryRights.label = label;
	}
	return appRankMFeedEntryRights;
}

Map<String, dynamic> $AppRankMFeedEntryRightsToJson(AppRankMFeedEntryRights entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['label'] = entity.label;
	return data;
}

AppRankMFeedEntryTitle $AppRankMFeedEntryTitleFromJson(Map<String, dynamic> json) {
	final AppRankMFeedEntryTitle appRankMFeedEntryTitle = AppRankMFeedEntryTitle();
	final String? label = jsonConvert.convert<String>(json['label']);
	if (label != null) {
		appRankMFeedEntryTitle.label = label;
	}
	return appRankMFeedEntryTitle;
}

Map<String, dynamic> $AppRankMFeedEntryTitleToJson(AppRankMFeedEntryTitle entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['label'] = entity.label;
	return data;
}

AppRankMFeedEntryLink $AppRankMFeedEntryLinkFromJson(Map<String, dynamic> json) {
	final AppRankMFeedEntryLink appRankMFeedEntryLink = AppRankMFeedEntryLink();
	final AppRankMFeedEntryLinkAttributes? attributes = jsonConvert.convert<AppRankMFeedEntryLinkAttributes>(json['attributes']);
	if (attributes != null) {
		appRankMFeedEntryLink.attributes = attributes;
	}
	final AppRankMFeedEntryLinkImduration? imduration = jsonConvert.convert<AppRankMFeedEntryLinkImduration>(json['im:duration']);
	if (imduration != null) {
		appRankMFeedEntryLink.imduration = imduration;
	}
	return appRankMFeedEntryLink;
}

Map<String, dynamic> $AppRankMFeedEntryLinkToJson(AppRankMFeedEntryLink entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['attributes'] = entity.attributes?.toJson();
	data['im:duration'] = entity.imduration?.toJson();
	return data;
}

AppRankMFeedEntryLinkAttributes $AppRankMFeedEntryLinkAttributesFromJson(Map<String, dynamic> json) {
	final AppRankMFeedEntryLinkAttributes appRankMFeedEntryLinkAttributes = AppRankMFeedEntryLinkAttributes();
	final String? rel = jsonConvert.convert<String>(json['rel']);
	if (rel != null) {
		appRankMFeedEntryLinkAttributes.rel = rel;
	}
	final String? type = jsonConvert.convert<String>(json['type']);
	if (type != null) {
		appRankMFeedEntryLinkAttributes.type = type;
	}
	final String? href = jsonConvert.convert<String>(json['href']);
	if (href != null) {
		appRankMFeedEntryLinkAttributes.href = href;
	}
	return appRankMFeedEntryLinkAttributes;
}

Map<String, dynamic> $AppRankMFeedEntryLinkAttributesToJson(AppRankMFeedEntryLinkAttributes entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['rel'] = entity.rel;
	data['type'] = entity.type;
	data['href'] = entity.href;
	return data;
}

AppRankMFeedEntryLinkImduration $AppRankMFeedEntryLinkImdurationFromJson(Map<String, dynamic> json) {
	final AppRankMFeedEntryLinkImduration appRankMFeedEntryLinkImduration = AppRankMFeedEntryLinkImduration();
	final String? label = jsonConvert.convert<String>(json['label']);
	if (label != null) {
		appRankMFeedEntryLinkImduration.label = label;
	}
	return appRankMFeedEntryLinkImduration;
}

Map<String, dynamic> $AppRankMFeedEntryLinkImdurationToJson(AppRankMFeedEntryLinkImduration entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['label'] = entity.label;
	return data;
}

AppRankMFeedEntryId $AppRankMFeedEntryIdFromJson(Map<String, dynamic> json) {
	final AppRankMFeedEntryId appRankMFeedEntryId = AppRankMFeedEntryId();
	final String? label = jsonConvert.convert<String>(json['label']);
	if (label != null) {
		appRankMFeedEntryId.label = label;
	}
	final AppRankMFeedEntryIdAttributes? attributes = jsonConvert.convert<AppRankMFeedEntryIdAttributes>(json['attributes']);
	if (attributes != null) {
		appRankMFeedEntryId.attributes = attributes;
	}
	return appRankMFeedEntryId;
}

Map<String, dynamic> $AppRankMFeedEntryIdToJson(AppRankMFeedEntryId entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['label'] = entity.label;
	data['attributes'] = entity.attributes?.toJson();
	return data;
}

AppRankMFeedEntryIdAttributes $AppRankMFeedEntryIdAttributesFromJson(Map<String, dynamic> json) {
	final AppRankMFeedEntryIdAttributes appRankMFeedEntryIdAttributes = AppRankMFeedEntryIdAttributes();
	final String? imid = jsonConvert.convert<String>(json['im:id']);
	if (imid != null) {
		appRankMFeedEntryIdAttributes.imid = imid;
	}
	final String? imbundleId = jsonConvert.convert<String>(json['im:bundleId']);
	if (imbundleId != null) {
		appRankMFeedEntryIdAttributes.imbundleId = imbundleId;
	}
	return appRankMFeedEntryIdAttributes;
}

Map<String, dynamic> $AppRankMFeedEntryIdAttributesToJson(AppRankMFeedEntryIdAttributes entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['im:id'] = entity.imid;
	data['im:bundleId'] = entity.imbundleId;
	return data;
}

AppRankMFeedEntryImartist $AppRankMFeedEntryImartistFromJson(Map<String, dynamic> json) {
	final AppRankMFeedEntryImartist appRankMFeedEntryImartist = AppRankMFeedEntryImartist();
	final String? label = jsonConvert.convert<String>(json['label']);
	if (label != null) {
		appRankMFeedEntryImartist.label = label;
	}
	final AppRankMFeedEntryImartistAttributes? attributes = jsonConvert.convert<AppRankMFeedEntryImartistAttributes>(json['attributes']);
	if (attributes != null) {
		appRankMFeedEntryImartist.attributes = attributes;
	}
	return appRankMFeedEntryImartist;
}

Map<String, dynamic> $AppRankMFeedEntryImartistToJson(AppRankMFeedEntryImartist entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['label'] = entity.label;
	data['attributes'] = entity.attributes?.toJson();
	return data;
}

AppRankMFeedEntryImartistAttributes $AppRankMFeedEntryImartistAttributesFromJson(Map<String, dynamic> json) {
	final AppRankMFeedEntryImartistAttributes appRankMFeedEntryImartistAttributes = AppRankMFeedEntryImartistAttributes();
	final String? href = jsonConvert.convert<String>(json['href']);
	if (href != null) {
		appRankMFeedEntryImartistAttributes.href = href;
	}
	return appRankMFeedEntryImartistAttributes;
}

Map<String, dynamic> $AppRankMFeedEntryImartistAttributesToJson(AppRankMFeedEntryImartistAttributes entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['href'] = entity.href;
	return data;
}

AppRankMFeedEntryCategory $AppRankMFeedEntryCategoryFromJson(Map<String, dynamic> json) {
	final AppRankMFeedEntryCategory appRankMFeedEntryCategory = AppRankMFeedEntryCategory();
	final AppRankMFeedEntryCategoryAttributes? attributes = jsonConvert.convert<AppRankMFeedEntryCategoryAttributes>(json['attributes']);
	if (attributes != null) {
		appRankMFeedEntryCategory.attributes = attributes;
	}
	return appRankMFeedEntryCategory;
}

Map<String, dynamic> $AppRankMFeedEntryCategoryToJson(AppRankMFeedEntryCategory entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['attributes'] = entity.attributes?.toJson();
	return data;
}

AppRankMFeedEntryCategoryAttributes $AppRankMFeedEntryCategoryAttributesFromJson(Map<String, dynamic> json) {
	final AppRankMFeedEntryCategoryAttributes appRankMFeedEntryCategoryAttributes = AppRankMFeedEntryCategoryAttributes();
	final String? imid = jsonConvert.convert<String>(json['im:id']);
	if (imid != null) {
		appRankMFeedEntryCategoryAttributes.imid = imid;
	}
	final String? term = jsonConvert.convert<String>(json['term']);
	if (term != null) {
		appRankMFeedEntryCategoryAttributes.term = term;
	}
	final String? scheme = jsonConvert.convert<String>(json['scheme']);
	if (scheme != null) {
		appRankMFeedEntryCategoryAttributes.scheme = scheme;
	}
	final String? label = jsonConvert.convert<String>(json['label']);
	if (label != null) {
		appRankMFeedEntryCategoryAttributes.label = label;
	}
	return appRankMFeedEntryCategoryAttributes;
}

Map<String, dynamic> $AppRankMFeedEntryCategoryAttributesToJson(AppRankMFeedEntryCategoryAttributes entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['im:id'] = entity.imid;
	data['term'] = entity.term;
	data['scheme'] = entity.scheme;
	data['label'] = entity.label;
	return data;
}

AppRankMFeedEntryImreleaseDate $AppRankMFeedEntryImreleaseDateFromJson(Map<String, dynamic> json) {
	final AppRankMFeedEntryImreleaseDate appRankMFeedEntryImreleaseDate = AppRankMFeedEntryImreleaseDate();
	final String? label = jsonConvert.convert<String>(json['label']);
	if (label != null) {
		appRankMFeedEntryImreleaseDate.label = label;
	}
	final AppRankMFeedEntryImreleaseDateAttributes? attributes = jsonConvert.convert<AppRankMFeedEntryImreleaseDateAttributes>(json['attributes']);
	if (attributes != null) {
		appRankMFeedEntryImreleaseDate.attributes = attributes;
	}
	return appRankMFeedEntryImreleaseDate;
}

Map<String, dynamic> $AppRankMFeedEntryImreleaseDateToJson(AppRankMFeedEntryImreleaseDate entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['label'] = entity.label;
	data['attributes'] = entity.attributes?.toJson();
	return data;
}

AppRankMFeedEntryImreleaseDateAttributes $AppRankMFeedEntryImreleaseDateAttributesFromJson(Map<String, dynamic> json) {
	final AppRankMFeedEntryImreleaseDateAttributes appRankMFeedEntryImreleaseDateAttributes = AppRankMFeedEntryImreleaseDateAttributes();
	final String? label = jsonConvert.convert<String>(json['label']);
	if (label != null) {
		appRankMFeedEntryImreleaseDateAttributes.label = label;
	}
	return appRankMFeedEntryImreleaseDateAttributes;
}

Map<String, dynamic> $AppRankMFeedEntryImreleaseDateAttributesToJson(AppRankMFeedEntryImreleaseDateAttributes entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['label'] = entity.label;
	return data;
}

AppRankMFeedUpdated $AppRankMFeedUpdatedFromJson(Map<String, dynamic> json) {
	final AppRankMFeedUpdated appRankMFeedUpdated = AppRankMFeedUpdated();
	final String? label = jsonConvert.convert<String>(json['label']);
	if (label != null) {
		appRankMFeedUpdated.label = label;
	}
	return appRankMFeedUpdated;
}

Map<String, dynamic> $AppRankMFeedUpdatedToJson(AppRankMFeedUpdated entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['label'] = entity.label;
	return data;
}

AppRankMFeedRights $AppRankMFeedRightsFromJson(Map<String, dynamic> json) {
	final AppRankMFeedRights appRankMFeedRights = AppRankMFeedRights();
	final String? label = jsonConvert.convert<String>(json['label']);
	if (label != null) {
		appRankMFeedRights.label = label;
	}
	return appRankMFeedRights;
}

Map<String, dynamic> $AppRankMFeedRightsToJson(AppRankMFeedRights entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['label'] = entity.label;
	return data;
}

AppRankMFeedTitle $AppRankMFeedTitleFromJson(Map<String, dynamic> json) {
	final AppRankMFeedTitle appRankMFeedTitle = AppRankMFeedTitle();
	final String? label = jsonConvert.convert<String>(json['label']);
	if (label != null) {
		appRankMFeedTitle.label = label;
	}
	return appRankMFeedTitle;
}

Map<String, dynamic> $AppRankMFeedTitleToJson(AppRankMFeedTitle entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['label'] = entity.label;
	return data;
}

AppRankMFeedIcon $AppRankMFeedIconFromJson(Map<String, dynamic> json) {
	final AppRankMFeedIcon appRankMFeedIcon = AppRankMFeedIcon();
	final String? label = jsonConvert.convert<String>(json['label']);
	if (label != null) {
		appRankMFeedIcon.label = label;
	}
	return appRankMFeedIcon;
}

Map<String, dynamic> $AppRankMFeedIconToJson(AppRankMFeedIcon entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['label'] = entity.label;
	return data;
}

AppRankMFeedLink $AppRankMFeedLinkFromJson(Map<String, dynamic> json) {
	final AppRankMFeedLink appRankMFeedLink = AppRankMFeedLink();
	final AppRankMFeedLinkAttributes? attributes = jsonConvert.convert<AppRankMFeedLinkAttributes>(json['attributes']);
	if (attributes != null) {
		appRankMFeedLink.attributes = attributes;
	}
	return appRankMFeedLink;
}

Map<String, dynamic> $AppRankMFeedLinkToJson(AppRankMFeedLink entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['attributes'] = entity.attributes?.toJson();
	return data;
}

AppRankMFeedLinkAttributes $AppRankMFeedLinkAttributesFromJson(Map<String, dynamic> json) {
	final AppRankMFeedLinkAttributes appRankMFeedLinkAttributes = AppRankMFeedLinkAttributes();
	final String? rel = jsonConvert.convert<String>(json['rel']);
	if (rel != null) {
		appRankMFeedLinkAttributes.rel = rel;
	}
	final String? type = jsonConvert.convert<String>(json['type']);
	if (type != null) {
		appRankMFeedLinkAttributes.type = type;
	}
	final String? href = jsonConvert.convert<String>(json['href']);
	if (href != null) {
		appRankMFeedLinkAttributes.href = href;
	}
	return appRankMFeedLinkAttributes;
}

Map<String, dynamic> $AppRankMFeedLinkAttributesToJson(AppRankMFeedLinkAttributes entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['rel'] = entity.rel;
	data['type'] = entity.type;
	data['href'] = entity.href;
	return data;
}

AppRankMFeedId $AppRankMFeedIdFromJson(Map<String, dynamic> json) {
	final AppRankMFeedId appRankMFeedId = AppRankMFeedId();
	final String? label = jsonConvert.convert<String>(json['label']);
	if (label != null) {
		appRankMFeedId.label = label;
	}
	return appRankMFeedId;
}

Map<String, dynamic> $AppRankMFeedIdToJson(AppRankMFeedId entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['label'] = entity.label;
	return data;
}