import 'package:flutter/material.dart';

import 'font_manager.dart';

class CustomText extends StatelessWidget {
  final String? title;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;
  final int? maxLines;
  final double? letterSpacing;
  final double? textHeight;
  final bool? underLine;
  final bool? lineThrough;
  final String? fontFamily;
  final TextAlign? align;
  final TextOverflow? textOverflow;
  const CustomText({
    Key? key,
    this.title,
    this.color,
    this.size,
    this.fontFamily,
    this.letterSpacing,
    this.fontWeight,
    this.textHeight,
    this.maxLines,
    this.underLine,
    this.lineThrough = false,
    this.align,
    this.textOverflow,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? '',
      textAlign: align ?? TextAlign.start,
      maxLines: maxLines,
      overflow: textOverflow ?? TextOverflow.ellipsis,
      textScaleFactor: 1.0,
      style: TextStyle(
        letterSpacing: letterSpacing ?? 0,
        height: textHeight ?? 1.3,
        fontFamily: fontFamily ?? FontConstants.fontFamily,
        decoration: underLine != null
            ? TextDecoration.underline
            : lineThrough!
                ? TextDecoration.lineThrough
                : TextDecoration.none,
        fontSize: size ?? 16,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color ?? Colors.black,
      ),
    );
  }
}
