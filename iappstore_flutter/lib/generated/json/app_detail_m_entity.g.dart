import 'package:iappstore_flutter/generated/json/base/json_convert_content.dart';
import 'package:iappstore_flutter/models/app_detail_m_entity.dart';

AppDetailMEntity $AppDetailMEntityFromJson(Map<String, dynamic> json) {
	final AppDetailMEntity appDetailMEntity = AppDetailMEntity();
	final int? resultCount = jsonConvert.convert<int>(json['resultCount']);
	if (resultCount != null) {
		appDetailMEntity.resultCount = resultCount;
	}
	final List<AppDetailMResults>? results = jsonConvert.convertListNotNull<AppDetailMResults>(json['results']);
	if (results != null) {
		appDetailMEntity.results = results;
	}
	return appDetailMEntity;
}

Map<String, dynamic> $AppDetailMEntityToJson(AppDetailMEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['resultCount'] = entity.resultCount;
	data['results'] =  entity.results?.map((v) => v.toJson()).toList();
	return data;
}

AppDetailMResults $AppDetailMResultsFromJson(Map<String, dynamic> json) {
	final AppDetailMResults appDetailMResults = AppDetailMResults();
	final bool? isGameCenterEnabled = jsonConvert.convert<bool>(json['isGameCenterEnabled']);
	if (isGameCenterEnabled != null) {
		appDetailMResults.isGameCenterEnabled = isGameCenterEnabled;
	}
	final List<String>? features = jsonConvert.convertListNotNull<String>(json['features']);
	if (features != null) {
		appDetailMResults.features = features;
	}
	final List<String>? supportedDevices = jsonConvert.convertListNotNull<String>(json['supportedDevices']);
	if (supportedDevices != null) {
		appDetailMResults.supportedDevices = supportedDevices;
	}
	final List<dynamic>? advisories = jsonConvert.convertListNotNull<dynamic>(json['advisories']);
	if (advisories != null) {
		appDetailMResults.advisories = advisories;
	}
	final List<String>? screenshotUrls = jsonConvert.convertListNotNull<String>(json['screenshotUrls']);
	if (screenshotUrls != null) {
		appDetailMResults.screenshotUrls = screenshotUrls;
	}
	final List<String>? ipadScreenshotUrls = jsonConvert.convertListNotNull<String>(json['ipadScreenshotUrls']);
	if (ipadScreenshotUrls != null) {
		appDetailMResults.ipadScreenshotUrls = ipadScreenshotUrls;
	}
	final List<dynamic>? appletvScreenshotUrls = jsonConvert.convertListNotNull<dynamic>(json['appletvScreenshotUrls']);
	if (appletvScreenshotUrls != null) {
		appDetailMResults.appletvScreenshotUrls = appletvScreenshotUrls;
	}
	final String? artworkUrl60 = jsonConvert.convert<String>(json['artworkUrl60']);
	if (artworkUrl60 != null) {
		appDetailMResults.artworkUrl60 = artworkUrl60;
	}
	final String? artworkUrl512 = jsonConvert.convert<String>(json['artworkUrl512']);
	if (artworkUrl512 != null) {
		appDetailMResults.artworkUrl512 = artworkUrl512;
	}
	final String? artworkUrl100 = jsonConvert.convert<String>(json['artworkUrl100']);
	if (artworkUrl100 != null) {
		appDetailMResults.artworkUrl100 = artworkUrl100;
	}
	final String? artistViewUrl = jsonConvert.convert<String>(json['artistViewUrl']);
	if (artistViewUrl != null) {
		appDetailMResults.artistViewUrl = artistViewUrl;
	}
	final String? kind = jsonConvert.convert<String>(json['kind']);
	if (kind != null) {
		appDetailMResults.kind = kind;
	}
	final String? currency = jsonConvert.convert<String>(json['currency']);
	if (currency != null) {
		appDetailMResults.currency = currency;
	}
	final String? currentVersionReleaseDate = jsonConvert.convert<String>(json['currentVersionReleaseDate']);
	if (currentVersionReleaseDate != null) {
		appDetailMResults.currentVersionReleaseDate = currentVersionReleaseDate;
	}
	final int? artistId = jsonConvert.convert<int>(json['artistId']);
	if (artistId != null) {
		appDetailMResults.artistId = artistId;
	}
	final String? artistName = jsonConvert.convert<String>(json['artistName']);
	if (artistName != null) {
		appDetailMResults.artistName = artistName;
	}
	final List<String>? genres = jsonConvert.convertListNotNull<String>(json['genres']);
	if (genres != null) {
		appDetailMResults.genres = genres;
	}
	final double? price = jsonConvert.convert<double>(json['price']);
	if (price != null) {
		appDetailMResults.price = price;
	}
	final String? description = jsonConvert.convert<String>(json['description']);
	if (description != null) {
		appDetailMResults.description = description;
	}
	final String? releaseNotes = jsonConvert.convert<String>(json['releaseNotes']);
	if (releaseNotes != null) {
		appDetailMResults.releaseNotes = releaseNotes;
	}
	final String? releaseDate = jsonConvert.convert<String>(json['releaseDate']);
	if (releaseDate != null) {
		appDetailMResults.releaseDate = releaseDate;
	}
	final String? bundleId = jsonConvert.convert<String>(json['bundleId']);
	if (bundleId != null) {
		appDetailMResults.bundleId = bundleId;
	}
	final int? trackId = jsonConvert.convert<int>(json['trackId']);
	if (trackId != null) {
		appDetailMResults.trackId = trackId;
	}
	final String? trackName = jsonConvert.convert<String>(json['trackName']);
	if (trackName != null) {
		appDetailMResults.trackName = trackName;
	}
	final List<String>? genreIds = jsonConvert.convertListNotNull<String>(json['genreIds']);
	if (genreIds != null) {
		appDetailMResults.genreIds = genreIds;
	}
	final String? sellerName = jsonConvert.convert<String>(json['sellerName']);
	if (sellerName != null) {
		appDetailMResults.sellerName = sellerName;
	}
	final String? primaryGenreName = jsonConvert.convert<String>(json['primaryGenreName']);
	if (primaryGenreName != null) {
		appDetailMResults.primaryGenreName = primaryGenreName;
	}
	final int? primaryGenreId = jsonConvert.convert<int>(json['primaryGenreId']);
	if (primaryGenreId != null) {
		appDetailMResults.primaryGenreId = primaryGenreId;
	}
	final bool? isVppDeviceBasedLicensingEnabled = jsonConvert.convert<bool>(json['isVppDeviceBasedLicensingEnabled']);
	if (isVppDeviceBasedLicensingEnabled != null) {
		appDetailMResults.isVppDeviceBasedLicensingEnabled = isVppDeviceBasedLicensingEnabled;
	}
	final String? minimumOsVersion = jsonConvert.convert<String>(json['minimumOsVersion']);
	if (minimumOsVersion != null) {
		appDetailMResults.minimumOsVersion = minimumOsVersion;
	}
	final String? trackCensoredName = jsonConvert.convert<String>(json['trackCensoredName']);
	if (trackCensoredName != null) {
		appDetailMResults.trackCensoredName = trackCensoredName;
	}
	final List<String>? languageCodesISO2A = jsonConvert.convertListNotNull<String>(json['languageCodesISO2A']);
	if (languageCodesISO2A != null) {
		appDetailMResults.languageCodesISO2A = languageCodesISO2A;
	}
	final String? fileSizeBytes = jsonConvert.convert<String>(json['fileSizeBytes']);
	if (fileSizeBytes != null) {
		appDetailMResults.fileSizeBytes = fileSizeBytes;
	}
	final String? formattedPrice = jsonConvert.convert<String>(json['formattedPrice']);
	if (formattedPrice != null) {
		appDetailMResults.formattedPrice = formattedPrice;
	}
	final String? contentAdvisoryRating = jsonConvert.convert<String>(json['contentAdvisoryRating']);
	if (contentAdvisoryRating != null) {
		appDetailMResults.contentAdvisoryRating = contentAdvisoryRating;
	}
	final double? averageUserRatingForCurrentVersion = jsonConvert.convert<double>(json['averageUserRatingForCurrentVersion']);
	if (averageUserRatingForCurrentVersion != null) {
		appDetailMResults.averageUserRatingForCurrentVersion = averageUserRatingForCurrentVersion;
	}
	final int? userRatingCountForCurrentVersion = jsonConvert.convert<int>(json['userRatingCountForCurrentVersion']);
	if (userRatingCountForCurrentVersion != null) {
		appDetailMResults.userRatingCountForCurrentVersion = userRatingCountForCurrentVersion;
	}
	final double? averageUserRating = jsonConvert.convert<double>(json['averageUserRating']);
	if (averageUserRating != null) {
		appDetailMResults.averageUserRating = averageUserRating;
	}
	final String? trackViewUrl = jsonConvert.convert<String>(json['trackViewUrl']);
	if (trackViewUrl != null) {
		appDetailMResults.trackViewUrl = trackViewUrl;
	}
	final String? trackContentRating = jsonConvert.convert<String>(json['trackContentRating']);
	if (trackContentRating != null) {
		appDetailMResults.trackContentRating = trackContentRating;
	}
	final String? version = jsonConvert.convert<String>(json['version']);
	if (version != null) {
		appDetailMResults.version = version;
	}
	final String? wrapperType = jsonConvert.convert<String>(json['wrapperType']);
	if (wrapperType != null) {
		appDetailMResults.wrapperType = wrapperType;
	}
	final int? userRatingCount = jsonConvert.convert<int>(json['userRatingCount']);
	if (userRatingCount != null) {
		appDetailMResults.userRatingCount = userRatingCount;
	}
	return appDetailMResults;
}

Map<String, dynamic> $AppDetailMResultsToJson(AppDetailMResults entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['isGameCenterEnabled'] = entity.isGameCenterEnabled;
	data['features'] =  entity.features;
	data['supportedDevices'] =  entity.supportedDevices;
	data['advisories'] =  entity.advisories;
	data['screenshotUrls'] =  entity.screenshotUrls;
	data['ipadScreenshotUrls'] =  entity.ipadScreenshotUrls;
	data['appletvScreenshotUrls'] =  entity.appletvScreenshotUrls;
	data['artworkUrl60'] = entity.artworkUrl60;
	data['artworkUrl512'] = entity.artworkUrl512;
	data['artworkUrl100'] = entity.artworkUrl100;
	data['artistViewUrl'] = entity.artistViewUrl;
	data['kind'] = entity.kind;
	data['currency'] = entity.currency;
	data['currentVersionReleaseDate'] = entity.currentVersionReleaseDate;
	data['artistId'] = entity.artistId;
	data['artistName'] = entity.artistName;
	data['genres'] =  entity.genres;
	data['price'] = entity.price;
	data['description'] = entity.description;
	data['releaseNotes'] = entity.releaseNotes;
	data['releaseDate'] = entity.releaseDate;
	data['bundleId'] = entity.bundleId;
	data['trackId'] = entity.trackId;
	data['trackName'] = entity.trackName;
	data['genreIds'] =  entity.genreIds;
	data['sellerName'] = entity.sellerName;
	data['primaryGenreName'] = entity.primaryGenreName;
	data['primaryGenreId'] = entity.primaryGenreId;
	data['isVppDeviceBasedLicensingEnabled'] = entity.isVppDeviceBasedLicensingEnabled;
	data['minimumOsVersion'] = entity.minimumOsVersion;
	data['trackCensoredName'] = entity.trackCensoredName;
	data['languageCodesISO2A'] =  entity.languageCodesISO2A;
	data['fileSizeBytes'] = entity.fileSizeBytes;
	data['formattedPrice'] = entity.formattedPrice;
	data['contentAdvisoryRating'] = entity.contentAdvisoryRating;
	data['averageUserRatingForCurrentVersion'] = entity.averageUserRatingForCurrentVersion;
	data['userRatingCountForCurrentVersion'] = entity.userRatingCountForCurrentVersion;
	data['averageUserRating'] = entity.averageUserRating;
	data['trackViewUrl'] = entity.trackViewUrl;
	data['trackContentRating'] = entity.trackContentRating;
	data['version'] = entity.version;
	data['wrapperType'] = entity.wrapperType;
	data['userRatingCount'] = entity.userRatingCount;
	return data;
}