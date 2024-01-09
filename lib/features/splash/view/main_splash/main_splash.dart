import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../constants/assets/images_constants.dart';
import '../../../../constants/theme/color_selection.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final splashCtrl = Get.find<SplashCtrl>();
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
