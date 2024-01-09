import 'package:eakazijobs/constants/assets/images_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../constants/assets/icon_constans.dart';
import '../../../../../constants/theme/color_selection.dart';
import '../../../../../helpers/routes/app_pages.dart';
import '../../../../../helpers/utils/utils.dart';
import '../../../../shared_widgets/svgs.dart';

class CurrentBalanceHomeWalletContainer extends StatelessWidget {
  const CurrentBalanceHomeWalletContainer({
    Key? key,
    required this.text,
    required this.subText,
  }) : super(key: key);
  final String text;
  final String subText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 98,
      width: 100.w,
      // alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 21, right: 10),
      // margin: EdgeInsets.only(right: 6),
      decoration: BoxDecoration(
        color: ColorsConst.profileContainer.withOpacity(0.6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: textTheme(context).bodyText1?.copyWith(
                // color: color,
                fontSize: 20),
          ),
          Text(
            subText,
            style: textTheme(context).bodyText2?.copyWith(
                color: ColorsConst.tittleColor, fontSize: 10, letterSpacing: 1),
          ),
        ],
      ),
    );
  }
}

class ExchangeContainer extends StatelessWidget {
  const ExchangeContainer({
    Key? key,
    required this.text,
    required this.subText,
  }) : super(key: key);
  final String text;
  final String subText;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.exchangeMarketRatePinPad);
      },
      child: Container(
        height: 98,
        width: 100.w,
        // alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 21, right: 10),
        // margin: EdgeInsets.only(right: 6),
        decoration: BoxDecoration(
          color: ColorsConst.profileContainer.withOpacity(0.6),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 6,
                  backgroundImage: AssetImage(ImageAssets.avatar2),
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  "Shamshudeen",
                  style: textTheme(context).bodyText2?.copyWith(
                      color: ColorsConst.texxtColorWallet, fontSize: 10),
                ),
                Spacer(),
                Text(
                  "578 Trades completed",
                  style: textTheme(context).bodyText2?.copyWith(
                      color: ColorsConst.texxtColorWalletLight, fontSize: 10),
                ),
              ],
            ),
            RichText(
              text: TextSpan(
                text: 'N100',
                style: textTheme(context).bodyText1?.copyWith(
                    // color: color,
                    fontSize: 20),
                children: [
                  TextSpan(
                    text: "  / NEAR",
                    style: textTheme(context).bodyText2?.copyWith(
                        color: ColorsConst.texxtColorWallet, fontSize: 10),
                  ),
                ],
              ),
            ),
            Text(
              "You will receive : 200 NGN",
              style: textTheme(context)
                  .bodyText2
                  ?.copyWith(color: ColorsConst.texxtColorWallet, fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}

class DepoWalletCont extends StatelessWidget {
  const DepoWalletCont({
    Key? key,
    required this.text,
    this.onTap,
    required this.icon,
  }) : super(key: key);

  final String text;
  final void Function()? onTap;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            // margin:
            // margin: const EdgeInsets.only(right: 37),
            height: 62.64,
            width: 65,
            decoration: const BoxDecoration(
              color: ColorsConst.containeravatarColor,
              shape: BoxShape.circle,
            ),
            child: Center(child: SvgIcon(icon)),
          ),
          const SizedBox(
            height: 9,
          ),
          Center(
            child: Text(
              text,
              style: textTheme(context)
                  .subtitle1
                  ?.copyWith(fontSize: 14, color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}

class WalletTileContainer extends StatelessWidget {
  const WalletTileContainer({
    Key? key,
    required this.text,
    required this.subText,
  }) : super(key: key);
  final String text;
  final String subText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 100.w,
      // alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 21, right: 10),
      // margin: EdgeInsets.only(right: 6),
      decoration: BoxDecoration(
        color: ColorsConst.white,
        boxShadow: [
          BoxShadow(
              color: ColorsConst.badgeColor.withOpacity(0.17),
              blurRadius: 2,
              offset: const Offset(0, 2))
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Material(
            shape: CircleBorder(),
            elevation: 2,
            child: CircleAvatar(
              radius: 27,
              backgroundColor: Colors.white,
              child: SvgIcon(IconsAssets.sideArrow),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: textTheme(context).bodyText1?.copyWith(
                    // color: color,
                    fontSize: 16),
              ),
              Text(
                subText,
                style: textTheme(context).bodyText2?.copyWith(
                    color: ColorsConst.tittleColor,
                    fontSize: 12,
                    letterSpacing: 1),
              ),
            ],
          ),
          const Spacer(),
          Text(
            "N 5,000",
            style: textTheme(context)
                .bodyText1
                ?.copyWith(color: ColorsConst.green, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
