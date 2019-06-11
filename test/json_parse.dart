import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:note_book/jsonData/data.dart';
import 'package:note_book/jsonData/DataString.dart';

void main() {
  group('jsonparse test', () {
    test('decodeString test', () {
      TestData data1 = TestData.fromJson(json.decode(DataString.mockdata));
      //直接右键，或者control + command + R，运行本测试文件
      //如果expect中两个参数的结果是相同的的就算测试通过
      //如果不相同就错误

      expect(data1.url,
          'http://www.getdropbox.com/u/2/screencast.html'); //结果All Tests Passed

//      expect(data1.url, '错误的数据'); //报错
    });
  });
}
