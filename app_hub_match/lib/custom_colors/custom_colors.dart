// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class CustomColors {
  final _colorGreen = const Color.fromARGB(255, 73, 195, 136);

  final Color _whiteColor = Colors.white;

  final Color _blackColor = Colors.black;

  Color getColorGreen() {
    return _colorGreen;
  }

  Color getColorWhite() {
    return _whiteColor;
  }

  Color getColorBlack() {
    return _blackColor;
  }
}
