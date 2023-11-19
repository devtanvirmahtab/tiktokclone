import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

var logger = Logger();

const mainPadding = 15.0;
double mainPaddingW = 20.0;
double mainPaddingH = 20.0;
const transitionDuration = 300;

const int loggerLineLength = 120;
const int loggerErrorMethodCount = 8;
const int loggerMethodCount = 2;

EdgeInsetsGeometry mainPaddingAll({scale = 1}) => EdgeInsets.symmetric(
  horizontal: mainPaddingW * scale,
  vertical: mainPaddingH * scale,
);

EdgeInsetsGeometry mainPaddingHorizontal = EdgeInsets.symmetric(
  horizontal: mainPaddingW,
);

EdgeInsetsGeometry mainPaddingVertical = EdgeInsets.symmetric(
  vertical: mainPaddingH,
);

SizedBox appHeight({double scale = 1}) => SizedBox(
  height: mainPaddingH * scale,
);

SizedBox fullAppHeight = SizedBox(height: mainPaddingH);

SizedBox appWidth({double scale =1}) => SizedBox(width: mainPaddingW * scale);

SizedBox appHeightWidth = SizedBox(
  width: mainPaddingW / 2,
  height: mainPaddingH / 2,
);

const boxRadius = 8.0;

errorShowToast(message) => Get.snackbar(
  "Wrong",
  "$message",
  backgroundColor: Colors.red,
  colorText: Colors.white,
);

successShowToast(message) => Get.snackbar(
  "Successfully",
  "$message",
  backgroundColor: Colors.green,
  colorText: Colors.white,
);
