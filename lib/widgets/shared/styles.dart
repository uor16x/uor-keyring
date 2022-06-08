import 'package:flutter/material.dart';

class Styles {
  static final BoxDecoration boxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(5),
    border: Border.all(
      color: Colors.white54,
    ),
  );

  static SizedBox emptySpace([double height = 5]) => SizedBox(height: height);
}
