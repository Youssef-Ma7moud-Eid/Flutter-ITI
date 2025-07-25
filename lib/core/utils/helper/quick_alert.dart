import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

void showCustomAlert({
  required BuildContext context,
  String title = 'Alert',
  required String text,
  QuickAlertType type = QuickAlertType.info,
  String confirmBtnText = 'OK',
  VoidCallback? onConfirm,
}) {
  QuickAlert.show(
    context: context,
    type: type,
    title: title,
    text: text,
    confirmBtnText: confirmBtnText,
    onConfirmBtnTap: onConfirm ?? () => Navigator.of(context).pop(),
  );
}
