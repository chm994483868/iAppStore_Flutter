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

  static RankingType convert(String desc) {
    final tt = RankingType.c(desc);
    return tt;
  }

  String url(String categoryId, String regionId, int limit) {
    final type = value.toLowerCase();
    return "rss/$type/limit=$limit/genre=$categoryId/json?cc=$regionId";
  }
}
