import 'package:flutter/cupertino.dart';



class CustomText extends StatelessWidget {
 final String text;
 final int maxLines;
 final TextAlign textAlign;
 final Color color;
 final double size;
 final FontWeight fontWeight;
  const CustomText({
    Key? key,
    required this.text,
     this.maxLines =1,
     this.textAlign = TextAlign.start,
    required this.color,
    required this.size,
    required this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: 'IBM Plex Sans Arabic',
        color: color,
        fontWeight: fontWeight,
        fontSize: size,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
