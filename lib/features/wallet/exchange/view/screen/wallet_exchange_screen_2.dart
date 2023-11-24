import 'package:eakazijobs/constants/assets/icon_constans.dart';
import 'package:eakazijobs/constants/theme/color_selection.dart';
import 'package:eakazijobs/features/shared_widgets/svgs.dart';
import 'package:eakazijobs/helpers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../helpers/routes/app_pages.dart';
import '../../../../shared_widgets/buttons.dart';
import '../../../../shared_widgets/options_drop_down.dart';
import '../../../home/view/widgets/wallet_home_container.dart';

class WalletexchangeSecoundScreen extends StatelessWidget {
  const WalletexchangeSecoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final valueObs = "Market rate".obs;
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
              "Select Asset",
              style: textTheme(context).subtitle2,
            ),
            SizedBox(
              height: 3,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: WalletsDropDown(
                hint: "Select Intrest",
                services: const ["Programmer", "Team lead", "Trainer"],
                onSaved: (value) {
                  print("object");
                  // ctrl.bussinesCategory.value = value!;
                },

                // validator: (value) {
                //   if (ctrl.catalogues!.isEmpty) {
                //     return "service is null";
                //   } else {
                //     return null;
                //   }
                // },
                // validator:,
              ),
            ),
            SizedBox(
              height: 21,
            ),
            Text(
              "Exchange Method",
              style: textTheme(context).subtitle2,
            ),
            SizedBox(
              height: 3,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: WalletsDropDown(
                hint: "Market rate",
                services: const [
                  "Market rate",
                  "P2P",
                ],
                onSaved: (value) {
                  print("object $value");
                  // ctrl.bussinesCategory.value = value!;
                },
                newValue: (value) {
                  valueObs.value = value!;
                  print("new value si " + value.toString());
                },

                // validator: (value) {
                //   if (ctrl.catalogues!.isEmpty) {
                //     return "service is null";
                //   } else {
                //     return null;
                //   }
                // },
                // validator:,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                "1 NEAR = 100 NGN",
                style: textTheme(context)
                    .subtitle2
                    ?.copyWith(fontSize: 13, letterSpacing: 1),
              ),
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
                      if (valueObs.value == "Market rate") {
                        Get.toNamed(Routes.exchangeMarketRatePinPad);
                      } else {
                        Get.toNamed(Routes.exchangeP2p);
                      }
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
