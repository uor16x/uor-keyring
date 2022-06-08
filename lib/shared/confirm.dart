import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';

Future<bool> confirmAction({
  required BuildContext context,
  required String title,
  required String content,
  required String textOK,
  required String textCancel,
}) async {
  return await confirm(
    context,
    title: Text(title),
    content: Text(content),
    textOK: Text(textOK),
    textCancel: Text(textCancel),
  );
}
