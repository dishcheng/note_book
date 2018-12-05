import 'package:json_annotation/json_annotation.dart';

//https://juejin.im/post/5b5f00e7e51d45190571172f
//1、在最上方加上import json_annotation，且下方class前加上@JsonSerializable()
//2、执行项目根目录下执行 flutter packages pub run build_runner build，会生成data.g.dart
//3、在下面加上part 'data.g.dart';
part 'data.g.dart';

@JsonSerializable()
class TestData {
  final String by;
  final int descendants;
  final int id;
  final List<int> kids;
  final int score;
  final int time;
  final String title;
  final String type;
  final String url;

  TestData(
      {this.by,
      this.descendants,
      this.id,
      this.kids,
      this.score,
      this.time,
      this.title,
      this.type,
      this.url});

  //4、提供一个工厂构造方法Data.fromJson，该方法实际调用生成文件的_$TestDataFromJson方法。
  //反序列化
  factory TestData.fromJson(Map<String, dynamic> json) =>
      _$TestDataFromJson(json);

  //5、提供一个toJson()序列化对象的方法，实际调用生成文件的_$TestDataToJson(this)方法，您可以随时使用此方法将dart对象转化成map。
  //序列化
  Map<String, dynamic> toJson() => _$TestDataToJson(this);

//6、查看test/json_parse.dart文件

//7、attention，这个文件的结构数据只要修改过就要执行一次flutter packages pub run build_runner build
}
