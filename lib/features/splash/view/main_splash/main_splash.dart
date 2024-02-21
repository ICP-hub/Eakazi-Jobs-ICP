import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../helpers/routes/app_pages.dart';

import '../../../../constants/assets/images_constants.dart';
import '../../../../constants/theme/color_selection.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final splashCtrl = Get.find<SplashCtrl>();
    Future.delayed(Duration(seconds: 2), () {
      Get.toNamed(Routes.onBoardng1);// Replace with your next screen
    });
    return Scaffold(
      backgroundColor: ColorsConst.backgroundColor2,
      body: Center(child: Image.asset(ImageAssets.mainLogo)),
    );
  }
}

// Container(
//   decoration: BoxDecoration(
//       color: Colors.white,
//       gradient: LinearGradient(
//           begin: FractionalOffset.topCenter,
//           end: FractionalOffset.bottomCenter,
//           colors: [
//             ColorConst.white.withOpacity(0.4 ),
//             ColorConst.opacticWhite.withOpacity(0.1),
//           ],
//           stops: [
//             0.0,
//             1.0
//           ])),
// )
