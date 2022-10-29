import 'package:flutter/material.dart';

class SnackBarError extends StatelessWidget {
  String message;

  SnackBarError({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      backgroundColor: Colors.redAccent,
      content: Text(message),
    );
  }
}
