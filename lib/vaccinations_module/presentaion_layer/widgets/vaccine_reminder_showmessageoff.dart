// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import '../../../core/utils/app_strings.dart';

Future showMessageOffComponent(context) async {
  return await showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      content: Container(
        height: 110.0,
        child: Column(
          children: const [
            Text(
              AppStrings.textMessageOff,
              textAlign: TextAlign.end,
            )
          ],
        ),
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              icon: const Text(
                AppStrings.iKnow,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
