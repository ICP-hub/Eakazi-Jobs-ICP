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

class WalletWithDrawalScreen extends StatelessWidget {
  const WalletWithDrawalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Withdraw"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CurrentBalanceHomeWalletContainer(
              subText: "Total balance",
              text: "N20,600",
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
                      Get.toNamed(Routes.withdrwal2);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
