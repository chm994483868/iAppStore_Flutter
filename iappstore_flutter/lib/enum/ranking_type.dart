/// 针对不同的排行榜这里定义了不同的枚举值
// "热门免费榜": "topFreeApplications",
// "热门付费榜": "topPaidApplications",
// "畅销榜": "topGrossingApplications",
// "新上架榜": "newApplications",
// "新上架的免费榜": "newFreeApplications",
// "新上架的付费榜": "newPaidApplications",
// "热门免费 iPad 榜": "topFreeiPadApplications",
// "热门付费 iPad 榜": "topPaidiPadApplications",
// "畅销的 iPad 榜": "topGrossingiPadApplications",
enum RankingType {
  topFreeApplications("topFreeApplications"),
  topPaidApplications("topPaidApplications"),
  topGrossingApplications("topGrossingApplications"),
  newApplications("newApplications"),
  newFreeApplications("newFreeApplications"),
  newPaidApplications("newPaidApplications"),
  topFreeiPadApplications("topFreeiPadApplications"),
  topPaidiPadApplications("topPaidiPadApplications"),
  topGrossingiPadApplications("topGrossingiPadApplications");

  final String value;
  const RankingType(this.value);

  factory RankingType.c(String x) {
    const values = RankingType.values;
    return values.firstWhere((element) => element.value == x);
  }

  /// 根据传递的字符串参数获得对应的枚举值
  static RankingType convert(String desc) {
    final tt = RankingType.c(desc);
    return tt;
  }

  /// 这里直接取出枚举值绑定的字符串拼接在 URL 中
  String url(String categoryId, String regionId, int limit) {
    final type = value.toLowerCase();
    return "rss/$type/limit=$limit/genre=$categoryId/json?cc=$regionId";
  }
}
