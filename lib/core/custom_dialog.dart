import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomDialog {
  static void create(context) {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: Text('Animation done'),
          );
        });
  }
}