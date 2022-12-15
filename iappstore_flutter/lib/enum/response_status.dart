/// 定义网络请求成功的枚举 SuccessStatus，有数据和无数据两种状态
enum SuccessStatus {
  hasContent(2),
  empty(3);

  final int value;
  const SuccessStatus(this.value);

  @override
  String toString() => 'The $name value is $value';
}

/// 定义网络请求响应状态的枚举：正在加载/失败/成功并且有数据/成功但是没有数据
enum ResponseStatus {
  loading(0),
  fail(1),
  successHasContent(2),
  successNoData(3);

  final int value;
  const ResponseStatus(this.value);

  @override
  String toString() => 'The $name value is $value';
}

/// 这里可以参考原作者文章：
/// [Dart：枚举支持成员属性，并不好用](https://juejin.cn/post/7175060243330646075)
enum Water {
  frozen(0),
  lukewarm(40),
  boiling(100);

  final int temperature;
  const Water(this.temperature);

  @override
  String toString() => 'The $name value is $temperature';
}

/// 有关枚举里面加泛型
enum Season<T extends Object> {
  spring("好"),
  summer(true),
  autumn(100),
  winter([]);

  final T value;
  const Season(this.value);
}

final season = Season.spring.value;
