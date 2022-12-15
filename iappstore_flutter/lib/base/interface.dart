/// IRepository 抽象类仅添加一个 retry 重试函数
abstract class IRepository {
  void retry() {}
}

/// IClassName 抽象类仅添加一个 className 静态属性
abstract class IClassName {
  static String? className;
}

/// IWebLoadInfo 抽象类添加四个可空属性，当有类继承 IWebLoadInfo 时，会在这 4 个属性前添加 @override 重载标识
abstract class IWebLoadInfo {
  int? id;
  int? originId;
  String? title;
  String? link;
}

/// typeName 全局函数，封装 Type 的 toString 函数，便于获取 Type 的字符串描述
String typeName(Type type) => type.toString();

/// 定义一个泛型类，其中 T 必须是 Object 或者 Object 的子类
class Box<T extends Object> {
  T value;

  Box(this.value);
}

/// [Dart编码：`extension` 这样用更高效](https://www.jianshu.com/p/2779792d3212)
/// 延展所有 Object 的子类，给它们添加一个 box 的 get 函数，返回一个 Box<T> 对象，即把一个类实例包装在 Box<T> 对象中
extension ExtensionObject<T extends Object> on T {
  Box<T> get box => Box<T>(this);
}
