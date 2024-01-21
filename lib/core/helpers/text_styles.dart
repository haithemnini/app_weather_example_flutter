import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A class that provides static methods to build [TextStyle] objects.
class TextStyles {
  static TextStyle fontStyles({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) =>
      TextStyle(
        fontSize: fontSize ?? 24.sp,
        fontWeight: fontWeight ?? FontWeight.w700,
        color: color ?? Colors.white,
      );
}
