import 'package:get/get.dart';

import '../controller/freelancer_course_details_ctrl.dart';

class FreeLanceCoursesDetails extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FLCoursesDetailsCtrl>(
            () => FLCoursesDetailsCtrl(tabLength: 3));
  }
}
