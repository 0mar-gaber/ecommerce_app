import 'package:flutter/material.dart';

class DialogUtil {
  static showMessageDialog({required BuildContext context, required String message, VoidCallback? onOkPressed}) {
    showDialog(
      context: context,
      builder: (context) {
        return Material(
          color: Colors.transparent,
          child: Center(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
              margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.04),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Text(message),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  TextButton(
                    onPressed: onOkPressed ?? () {},
                    child: const Text("OK", style: TextStyle(color: Color.fromRGBO(53, 152, 219, 1.0))),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
