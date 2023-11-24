import 'package:get/get.dart';

import '../controllers/botttom_nav_bar_controller.dart';

class BottomNavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavBarCtr>(() => BottomNavBarCtr(true));
  }
}


// NotificationTabBinding(),
//         BookingsTabBinding(),
//         BookingsUserTabBinding(),