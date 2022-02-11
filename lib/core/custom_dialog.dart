import 'package:flutter/material.dart';

class CustomDialog {
  static void create(context) {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(content: Text('Animation done'));
        });
  }
}