import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenUtilInitializer {
  static void init(BuildContext context) {
    // Get the screen width and height using MediaQuery
    final Size screenSize = MediaQuery.of(context).size;

    // Use the screen width and height to set the design size
    ScreenUtil.init(
      context,
      designSize: screenSize,
      // Set design size to match screen size
    );
  }
}
