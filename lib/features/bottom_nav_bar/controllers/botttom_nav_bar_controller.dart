import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BottomNavBarCtr extends GetxController {
  final bool mounted;
  var tabindex = 0;

  BottomNavBarCtr(this.mounted);

  Future<void> changeTabIndex(int index, BuildContext context) async {
    tabindex = index;

    update();
  }
}

const _tag = "Bottom Nav Controler";
