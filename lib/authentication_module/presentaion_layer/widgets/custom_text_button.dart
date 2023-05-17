import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final int maxLines;
  final TextAlign textAlign;
  final Color color;
  final double size;
  final FontWeight fontWeight;
  final VoidCallback onPressed;
  const CustomTextButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.maxLines = 1,
    this.textAlign = TextAlign.start,
    required this.color,
    required this.size,
    required this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed:onPressed,
      child: CustomText(
        text: text,
        color:color,
        size: size,
        fontWeight: fontWeight,
      ),
    );
  }
}
