import 'package:easy_alert/easy_alert.dart';

AlertToast(context, text, {position = ToastPosition.center}) {
  Alert.toast(context, text, position: position);
}
