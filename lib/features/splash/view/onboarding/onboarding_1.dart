import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../../constants/assets/images_constants.dart';
import '../../../../constants/theme/color_selection.dart';
import '../../../../helpers/routes/app_pages.dart';
import '../../../../helpers/utils/utils.dart';
import '../shared_widgets/small_circle_onboarding.dart';

class OnBoardingOne extends StatelessWidget {
  const OnBoardingOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: ColorsConst.white,
      body: Column(
        children: [
          Image.asset(ImageAssets.secoundLogo),
          Image.asset(ImageAssets.onBoarding1),
          const SizedBox(
            height: 31,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 51),
            child: Column(
              children: [
                Text(
                  "Get trained and certified by Experts",
                  textAlign: TextAlign.center,
                  style: textTheme(context).headline1,
                ),
                Text(
                  "Complete courses , Get trained and certified by experts on the platform. ",
                  textAlign: TextAlign.center,
                  style: textTheme(context).bodyText2,
                ),
              ],
            ),
          ),
          const Spacer(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 52),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SmallCirclesOnBoarding(currentIndex: 1),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.onBoarding2);
                    },
                    child: CircleAvatar(
                      backgroundColor: ColorsConst.secoundary,
                      radius: 32,
                      child: Icon(
                        Icons.arrow_forward,
                        color: ColorsConst.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
