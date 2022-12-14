abstract class IRepository {
  void retry() {}
}

abstract class IClassName {
  static String? className;
}

abstract class IWebLoadInfo {
  int? id;
  int? originId;
  String? title;
  String? link;
}

String typeName(Type type) => type.toString();

class Box<T extends Object> {
  T value;

  Box(this.value);
}

extension Extension<T extends Object> on T {
  Box<T> get box => Box<T>(this);
}
