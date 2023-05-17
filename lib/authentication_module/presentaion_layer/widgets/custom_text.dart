import 'package:flutter/cupertino.dart';



class CustomText extends StatelessWidget {
 final String text;
 final int maxLines;
 final TextAlign textAlign;
 final Color? color;
 final double? size;
 final FontWeight? fontWeight;
  const CustomText({
    Key? key,
    required this.text,
     this.maxLines =1,
     this.textAlign = TextAlign.start,
     this.color,
     this.size,
     this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: size,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
