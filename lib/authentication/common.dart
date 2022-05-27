import 'package:flutter/material.dart';
class Common{

  void showToast(BuildContext context, String message) {

    final scaffold = ScaffoldMessenger.of(context);
      scaffold.showSnackBar(
        SnackBar(
          content: Text(message),
          action: null,
        ),
      );
  }

}