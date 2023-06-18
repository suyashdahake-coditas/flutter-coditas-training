import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class ScreenUtils {

  static final double screenHeight =
      WidgetsBinding.instance.window.physicalSize.height /
          WidgetsBinding.instance.window.devicePixelRatio;
  static final double screenWidth =
      WidgetsBinding.instance.window.physicalSize.width /
          WidgetsBinding.instance.window.devicePixelRatio;
}
