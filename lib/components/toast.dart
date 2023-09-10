import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomToast {
  static show(
    BuildContext context, {
    required String message,
    Widget? icon,
    ToastGravity? gravity,
    Color? backgroundColor,
    // Color? textColor,
    TextStyle? textStyle,
  }) {
    FToast fToast = FToast();
    fToast.init(context);
    Widget toast = Container(
      padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: backgroundColor ?? Colors.white,
      ),
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: textStyle ?? TextStyle(color: Colors.black),
      ),
    );
    fToast.showToast(
      child: toast,
      gravity: gravity ?? ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 3),
    );
  }
}
