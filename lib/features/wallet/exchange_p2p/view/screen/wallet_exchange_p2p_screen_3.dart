import 'package:eakazijobs/constants/assets/icon_constans.dart';
import 'package:eakazijobs/constants/theme/color_selection.dart';
import 'package:eakazijobs/features/shared_widgets/svgs.dart';
import 'package:eakazijobs/helpers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../helpers/routes/app_pages.dart';
import '../../../../shared_widgets/buttons.dart';
import '../../../../shared_widgets/input_text.dart';
import '../../../../shared_widgets/options_drop_down.dart';
import '../../../home/view/widgets/wallet_home_container.dart';

class WalletexchangeP2ThirdScreen extends StatelessWidget {
  const WalletexchangeP2ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exchange"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: CurrentBalanceHomeWalletContainer(
                    subText: "NEAR balance",
                    text: "2.6 NEAR",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: SvgIcon(IconsAssets.exchange),
                ),
                Expanded(
                  child: CurrentBalanceHomeWalletContainer(
                    subText: "NGN balance",
                    text: "2.6 NGN",
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Token amount",
              style: textTheme(context)
                  .overline
                  ?.copyWith(color: ColorsConst.black),
            ),
            const SizedBox(
              height: 3,
            ),
            const InputTextNormal3(
                // controller: signUpCtrl.usernameController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                // validator: signUpCtrl.usernameValidator,
                hintText: "Enter Token amount",
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name),
            SizedBox(
              height: 21,
            ),
            Spacer(),
            SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 17, vertical: 30),
                child: AuthBtn(
                    text: "Next",
                    // color: ColorsConst.,
                    color: ColorsConst.primary2,
                    isComplete: true,
                    onPressed: () {
                      Get.toNamed(Routes.exxchnageP2p2);
                      // Get.toNamed(Routes.freelancercoursesassesment);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
