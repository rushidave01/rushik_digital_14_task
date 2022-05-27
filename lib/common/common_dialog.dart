import 'package:flutter/material.dart';

class CommonDialog {
  final BuildContext context;
  String title = "";
  String message = "";
  Function? onTap;

  CommonDialog(
      {required this.context,
      required this.title,
      required this.message,
      this.onTap});

  showAlert() {
    showDialog(
      context: context,
      builder: (ctxt) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
              onPressed: () {
                if (onTap != null) {
                  onTap!();
                }
                Navigator.pop(context);
              },
              child: const Text("Ok"))
        ],
      ),
    );
  }
}
