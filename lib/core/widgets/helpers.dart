import 'package:flutter/material.dart';

void customSnackBar(
  BuildContext context, {
  required String content,
  required Color color,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
      backgroundColor: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(8),
      ),
      margin: EdgeInsets.all(12),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
