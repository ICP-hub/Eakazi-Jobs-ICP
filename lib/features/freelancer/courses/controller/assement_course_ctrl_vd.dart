import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../helpers/utils/log.dart';

class AssesmentVidCourseCtrl extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  AssesmentVidCourseCtrl({required this.tabLength});
  final int tabLength;
  late String userId;

  @override
  void onInit() async {
    tabController = TabController(length: tabLength, vsync: this);
    Log.d("NotificationTabCtrl", "the length $tabLength");
    // initialize tab controller
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }
}
