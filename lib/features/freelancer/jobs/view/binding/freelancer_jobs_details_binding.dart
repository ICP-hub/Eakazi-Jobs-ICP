import 'package:get/get.dart';

import '../controller/freelancer_jobs_details_ctrl.dart';

class FreeLanJobsDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FLJobsDetailsCtrl>(() => FLJobsDetailsCtrl(tabLength: 3));
  }
}
