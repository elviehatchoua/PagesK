import 'package:finology/Constance/helpers.dart';
import 'package:flutter/material.dart';



class NotificationDialog extends StatelessWidget {
  const NotificationDialog({super.key});

  static void showCustomDialog({
    required BuildContext context,
    required String title,
    required String content,
    required bool isSuccess,
    required bool isRedirect,
    bool? isPop = false,
    bool? isPopPop = false,
    bool replace = false,
    Widget? page,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: isSuccess ? const Icon(Icons.check) : const Icon(Icons.warning),
          iconColor: isSuccess ? Colors.green : Colors.orange,
          title: Text(title),
          content: Text(content),
          titleTextStyle: const TextStyle(fontSize: 15),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                pop(context);
                if (isPop!) {
                  pop(context);
                } else if (isPopPop!) {
                  pop(context);
                  pop(context);
                }
                if (isRedirect) {
                  push(context, page!, replace: replace);
                }
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
