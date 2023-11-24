import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:eakazijobs/helpers/utils/utils.dart';
import 'package:eakazijobs/services/getStates.dart';
import 'package:eakazijobs/services/localStorage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/assets/icon_constans.dart';
import '../../constants/theme/color_selection.dart';
import '../employers/employers_home/view/screen/employers_home_screen.dart';
import '../freelancer/home/view/freelance_home_screen.dart';
import '../freelancer/profile/view/screen/fl_profile.dart';
import '../wallet/home/view/screen/wallet_screen.dart';
import 'controllers/botttom_nav_bar_controller.dart';

class BottomSheetScreen extends StatefulWidget {
  static const tag = "BottomSheetScreen";

  const BottomSheetScreen({Key? key}) : super(key: key);

  @override
  State<BottomSheetScreen> createState() => _BottomSheetScreenState();
}

class _BottomSheetScreenState extends State<BottomSheetScreen>
    with WidgetsBindingObserver {
  LocalStorage localStorage = LocalStorage();
  @override
  void initState() {
    super.initState();
// track if paused or resumed etc..
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  Future<bool> _onWillPop() async {
    // if (_selectedIndex != 0) {
    //   setState(() {
    //     _selectedIndex = 0;
    //   });
    //   return false;
    // }
    return (await showDialog(
          context: context,
          builder: (context) => BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
            child: AlertDialog(
              title: Text(
                'Exit App',
                style: textTheme(context).headline4,
              ),
              content: Text(
                'Do you want to exit EaKazi?',
                style: textTheme(context).subtitle2,
              ),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              actions: <Widget>[
                TextButton(
                  child: const Text(
                    'Yes',
                    style: TextStyle(color: Colors.green),
                  ),
                  onPressed: () async {
                    await localStorage.removeData(name: 'token');
                    SystemNavigator.pop();
                  },
                ),
                TextButton(
                  child: const Text(
                    'No',
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
              ],
            ),
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    Controller c = Get.put(Controller());
    // final controller = Get.find<BottomNavBarCtr>();

    // String? uId;
    // if (Get.arguments != null && Get.arguments is String) {
    //   us = Get.arguments;
    // }
    // vendor ??= User.empty();

    return WillPopScope(
        onWillPop: _onWillPop,
        child: GetBuilder<BottomNavBarCtr>(
            // init: BottomNavBarCtr(mounted),
            autoRemove: false,
            builder: (controller) {
              // print("ctrl showbadge  " + controller.showBadge.toString());
              List<Widget> _pages = <Widget>[
                c.userData.value.userRole == "trainee"
                    ? const FreeLancerHome()
                    : const EmployersHomeScreen(),
                const WalletHomeScreen(),
                const SizedBox(),
                const FreeLanceProfile(),
              ];
              return Scaffold(
                  appBar: AppBar(
                    toolbarHeight: 0.0,
                    // title: Text("Scaffold"),
                  ),
                  body: SafeArea(
                    child: _pages.elementAt(controller.tabindex),
                  ),
                  bottomNavigationBar: NavBAr(
                    currentIndex: controller.tabindex,
                    onTap: (index) async =>
                        await controller.changeTabIndex(index, context),
                  ));
            }));
  }
}

class NavBAr extends StatelessWidget {
  const NavBAr({
    Key? key,
    required this.currentIndex,
    this.onTap,
  }) : super(key: key);

  final int currentIndex;
  final void Function(int index)? onTap;

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<BottomNavBarCtr>();
    return BottomNavigationBar(
      // fixedColor: colorScheme(context).secondary,
      onTap: onTap,
      currentIndex: currentIndex,

      // showSelectedLabels: false,
      // showUnselectedLabels: false,
      unselectedItemColor: ColorsConst.blackThree,
      unselectedLabelStyle: GoogleFonts.inter(
        fontSize: 10,
        fontWeight: FontWeight.w600,
        height: 1.5,
      ),
      selectedLabelStyle: GoogleFonts.inter(
        fontSize: 10,
        fontWeight: FontWeight.w600,
        height: 1.5,
      ),
      type: BottomNavigationBarType.fixed,
      // backgroundColor: colorScheme(context).primary,
      items: [
        BottomNavigationBarItem(
          activeIcon: SvgPicture.asset(
            IconsAssets.homeActive,
            // color: activeColor,
            semanticsLabel: 'Home',
          ),
          label: "Home",
          icon: SvgPicture.asset(
            IconsAssets.home,
            // color: unActiveIcon,
            semanticsLabel: 'Home',
          ),
        ),
        BottomNavigationBarItem(
          label: "Wallet",
          activeIcon: SvgPicture.asset(
            IconsAssets.walletActive,
            // color: activeColor,
            semanticsLabel: 'Wallet',
          ),
          icon: SvgPicture.asset(
            IconsAssets.wallet,
            // color: unActiveIcon,
            semanticsLabel: 'search',
          ),
        ),
        BottomNavigationBarItem(
          activeIcon: SvgPicture.asset(
            IconsAssets.notificationActive,
            // color: activeColor,
            semanticsLabel: 'Alerts',
          ),
          label: "Alerts",
          icon: SvgPicture.asset(
            IconsAssets.notification,
            // color: unActiveIcon,
            semanticsLabel: 'Alerts',
          ),
        ),
        BottomNavigationBarItem(
          activeIcon: SvgPicture.asset(
            IconsAssets.profileActive,
            // color: activeColor,
            semanticsLabel: 'profile',
          ),
          label: "Profile",
          icon: SvgPicture.asset(
            IconsAssets.profile,
            // color: unActiveIcon,
            semanticsLabel: 'profile',
          ),
        ),
      ],
    );
  }
}
