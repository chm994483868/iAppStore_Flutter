/// HTTP 状态码枚举：状态码的数值然后对应一个枚举 name 的字符串，该字符串表示请求响应的简单描述
enum HttpStatus {
  continue_(100),
  switchingProtocols(101),
  processing(102),
  earlyHints(103),
  ok(200),
  created(201),
  accepted(202),
  nonAuthoritativeInformation(203),
  noContent(204),
  resetContent(205),
  partialContent(206),
  multiStatus(207),
  alreadyReported(208),
  imUsed(226),
  multipleChoices(300),
  movedPermanently(301),
  found(302),
  movedTemporarily(302), // Common alias for found.
  seeOther(303),
  notModified(304),
  useProxy(305),
  switchProxy(306),
  temporaryRedirect(307),
  permanentRedirect(308),
  badRequest(400),
  unauthorized(401),
  paymentRequired(402),
  forbidden(403),
  notFound(404),
  methodNotAllowed(405),
  notAcceptable(406),
  proxyAuthenticationRequired(407),
  requestTimeout(408),
  conflict(409),
  gone(410),
  lengthRequired(411),
  preconditionFailed(412),
  requestEntityTooLarge(413),
  requestUriTooLong(414),
  unsupportedMediaType(415),
  requestedRangeNotSatisfiable(416),
  expectationFailed(417),
  imATeapot(418),
  misdirectedRequest(421),
  unprocessableEntity(422),
  locked(423),
  failedDependency(424),
  tooEarly(425),
  upgradeRequired(426),
  preconditionRequired(428),
  tooManyRequests(429),
  requestHeaderFieldsTooLarge(431),
  connectionClosedWithoutResponse(444),
  unavailableForLegalReasons(451),
  clientClosedRequest(499),
  internalServerError(500),
  notImplemented(501),
  badGateway(502),
  serviceUnavailable(503),
  gatewayTimeout(504),
  httpVersionNotSupported(505),
  variantAlsoNegotiates(506),
  insufficientStorage(507),
  loopDetected(508),
  notExtended(510),
  networkAuthenticationRequired(511),
  networkConnectTimeoutError(599),
  connectionError(null);

  final int? code;
  const HttpStatus(this.code);

  //bool get connectionError => code == null;

  bool between(int begin, int end) {
    return code != null && code! >= begin && code! <= end;
  }

  // 一组 get 函数分别表示：是否需要验证/是否被拒绝/是否 404/是否服务器错误/是否请求 OK/是否请求不 OK
  bool get isUnauthorized => code == 401;
  bool get isForbidden => code == 403;
  bool get isNotFound => code == 404;
  bool get isServerError => between(500, 599);
  bool get isOk => between(200, 299);
  bool get hasError => !isOk;

  // 在 HttpStatus 枚举中添加一个静态变量 map：以 code 为 key，以 枚举值为 value
  static Map<int?, HttpStatus> get mappingTable {
    Map<int?, HttpStatus> map = {};
    HttpStatus.values.map((e) => map[e.code] = e);
    return map;
  }
}
