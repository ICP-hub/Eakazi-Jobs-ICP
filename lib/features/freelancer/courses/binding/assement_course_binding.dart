import 'package:get/get.dart';

import '../controller/assement_course_ctrl_vd.dart';

class FreeLanceAssementCourseVd extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AssesmentVidCourseCtrl>(
        () => AssesmentVidCourseCtrl(tabLength: 2));
  }
}
