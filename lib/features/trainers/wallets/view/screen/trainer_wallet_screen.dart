import 'package:eakazijobs/constants/assets/icon_constans.dart';
import 'package:eakazijobs/constants/theme/color_selection.dart';
import 'package:eakazijobs/features/shared_widgets/svgs.dart';
import 'package:eakazijobs/helpers/utils/utils.dart';
import 'package:flutter/material.dart';

import '../widgets/trainer_wallet_container_fl.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wallet"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            children: [
              const CurrentBalanceWalletContainer(
                subText: "Current balance",
                text: "N20,600",
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6),
                child: SizedBox(
                  height: 120,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      DepoWalletCont(
                        text: "Withdraw",
                      ),
                      SizedBox(
                        width: 37,
                      ),
                      DepoWalletCont(
                        text: "Deposit",
                      ),
                      SizedBox(
                        width: 37,
                      ),
                      DepoWalletCont(
                        text: "Exchange",
                      ),
                      SizedBox(
                        width: 37,
                      ),
                      DepoWalletCont(
                        text: "Invoice",
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ...List.generate(
                  6,
                  (index) => Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: WalletTileContainer(
                          subText: "Recieved",
                          text: "Employer 1",
                        ),
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
