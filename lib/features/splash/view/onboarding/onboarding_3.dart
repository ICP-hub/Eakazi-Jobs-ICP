import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../../constants/assets/images_constants.dart';
import '../../../../constants/theme/color_selection.dart';
import '../../../../helpers/routes/app_pages.dart';
import '../../../../helpers/utils/utils.dart';
import '../shared_widgets/small_circle_onboarding.dart';

class OnBoardingThree extends StatelessWidget {
  const OnBoardingThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: ColorsConst.white,
      body: Column(
        children: [
          Image.asset(ImageAssets.secoundLogo),
          Image.asset(ImageAssets.onBoarding3),
          const SizedBox(
            height: 31,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 51),
            child: Column(
              children: [
                Text(
                  "Get paid in your local currency",
                  textAlign: TextAlign.center,
                  style: textTheme(context).headline1,
                ),
                SizedBox(
                  height: 21,
                ),
                Text(
                  "Freelanceres and trainers get paid and can make withdrawals to their local currencies..",
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
                  const SmallCirclesOnBoarding(currentIndex: 3),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.login);
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
