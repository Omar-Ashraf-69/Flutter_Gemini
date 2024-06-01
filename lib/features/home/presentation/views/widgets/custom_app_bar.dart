import 'package:flutter/material.dart';
import 'package:gemini/core/utils/app_images.dart';

AppBar customAppBar() {
  return AppBar(
    clipBehavior: Clip.none,
    elevation: 0,
    surfaceTintColor: Colors.transparent,
    shadowColor: Colors.transparent,
    centerTitle: true,
    title: AspectRatio(
      aspectRatio: 40 / 4,
      child: Image.asset(
        Assets.appLogo,
      ),
    ),
  );
}
