import 'package:flutter/material.dart';

class ToastUtils {
  static void showToast(BuildContext context,String? message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      width: 120,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      behavior: SnackBarBehavior.floating,
      content: Text(message ?? "刷新成功",textAlign: TextAlign.center,),
      ));
  }
}
