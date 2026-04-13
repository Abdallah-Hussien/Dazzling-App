import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Spacing {
  Spacing._();
  static Widget vertical(double height) => SizedBox(height: height.h);
  static Widget horizontal(double width) => SizedBox(width: width.w);
}
