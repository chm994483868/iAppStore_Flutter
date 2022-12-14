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

// [Dart编码：`extension` 这样用更高效](https://www.jianshu.com/p/2779792d3212)
extension ExtensionObject<T extends Object> on T {
  Box<T> get box => Box<T>(this);
}
