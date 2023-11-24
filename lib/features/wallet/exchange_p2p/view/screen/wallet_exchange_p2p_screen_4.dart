import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../home/view/widgets/wallet_home_container.dart';

class WalletExxchangeP2pScreen4 extends StatelessWidget {
  const WalletExxchangeP2pScreen4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exchange"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            ExchangeContainer(
              subText: "Shamshudeen",
              text: "N100",
            )
          ],
        ),
      ),
    );
  }
}
