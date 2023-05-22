import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<void> showPostFight(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Post-Battle'),
        content: const SingleChildScrollView(
          child: Text('This is the post battle screen. WIP'),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Go back'),
            onPressed: () {
              context.pop();
            },
          ),
        ],
      );
    },
  );
}
