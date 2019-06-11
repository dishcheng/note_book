import 'package:shared_preferences/shared_preferences.dart';

saveToken(token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token);
}

getToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return await prefs.getString('token');
}

//avatar,true_name两个字段可能返回null，在下面会被转义成字符串'null'
saveUserProfile(avatar, recommend_no, int phone, money, String true_name,
    bool is_leader, check_status) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('userAvatar', avatar);

  await prefs.setString('userRecommendNo', recommend_no.toString());

  await prefs.setString('userPhone', phone.toString());

  await prefs.setString('userMoney', money.toString());

  await prefs.setString('userTrueName', true_name.toString());

  await prefs.setBool('isLeader', is_leader);
}

getSavedUserProfile() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var userAvatar = await prefs.getString('userAvatar');
  var userRecommendNo = await prefs.getString('userRecommendNo');
  var userPhone = await prefs.getString('userPhone');
  var userMoney = await prefs.getString('userMoney');
  var userTrueName = await prefs.getString('userTrueName');
  var isLeader = await prefs.getBool('isLeader');
  var check_status = await prefs.getString('check_status');
  var check_status_name = await prefs.getString('check_status_name');
  Map<String, dynamic> res = {
    'avatar': userAvatar,
    'recommend_no': userRecommendNo,
    'phone': userPhone,
    'money': userMoney,
    'true_name': userTrueName,
    'is_leader': isLeader,
    'check_status': check_status,
    'check_status_name': check_status_name,
  };
  return res;
}

saveUserTrueName(String real_name) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('userTrueName', real_name.toString());
}

saveUserPhone(String phone) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('userPhone', phone.toString());
}

saveUserAvatar(String avatar) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('userAvatar', avatar);
}

//退出登录
handleLogout() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();
}
