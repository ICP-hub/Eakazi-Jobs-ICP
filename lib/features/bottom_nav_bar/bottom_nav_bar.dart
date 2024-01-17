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
import 'package:eakazijobs/integrations.dart';

import '../../constants/assets/icon_constans.dart';
import '../../constants/theme/color_selection.dart';
import '../employers/employers_home/view/screen/employers_home_screen.dart';
import '../employers/employers_profile/view/screen/employer_profile.dart';
import '../freelancer/home/view/freelance_home_screen.dart';
import '../freelancer/profile/view/screen/fl_profile.dart';
import '../trainers/trainers_home/view/screen/trainers_home_screen.dart';
import '../trainers/trainers_profile/view/screen/trainer_profile.dart';
import '../wallet/home/view/screen/wallet_screen.dart';
import 'controllers/botttom_nav_bar_controller.dart';
import 'package:eakazijobs/features/authentication/login/view/screen/sign_in.dart';

class BottomSheetScreen extends StatefulWidget {
  static const tag = "BottomSheetScreen";

  const BottomSheetScreen({Key? key}) : super(key: key);

  @override
  State<BottomSheetScreen> createState() => _BottomSheetScreenState();
}

class _BottomSheetScreenState extends State<BottomSheetScreen>
    with WidgetsBindingObserver {
  var role;
  LocalStorage localStorage = LocalStorage();

  @override
  void initState() {
    super.initState();
    userValue();
// track if paused or resumed etc..
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  Future<String> userValue() async {
    var checkFullName =
    await newActor!.getFunc(FieldsMethod.getFullName)?.call([]);
    var checkRole = await newActor!.getFunc(FieldsMethod.getRole)?.call([]);

    print("Full Name : $checkFullName");
    print("Role : $checkRole");

    return checkRole.toString();
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
      builder: (context) =>
          BackdropFilter(
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

    return FutureBuilder<String>(
      future: userValue(),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        // Check if the snapshot has data
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          c.userData.value.userRole = snapshot.data ?? 'defaultRole';
        }

        if (!snapshot.hasData) {
          return Container();
        }

        return WillPopScope(
          onWillPop: _onWillPop,
          child: GetBuilder<BottomNavBarCtr>(
            autoRemove: false,
            builder: (controller) {
              List<Widget> _pages = <Widget>[
                c.userData.value.userRole == "ADMIN"
                    ? const FreeLancerHome()
                    : c.userData.value.userRole == "EMPLOYER"
                    ? const EmployersHomeScreen()
                    : const TrainerssHomeScreen(),
                const WalletHomeScreen(),
                const SizedBox(),
                c.userData.value.userRole == "ADMIN"
                    ? const FreeLanceProfile()
                    : c.userData.value.userRole == "EMPLOYER"
                    ? const EmployerProfileProfile()
                    : const TrannerProfileProfile(),
              ];
              return Scaffold(
                  appBar: AppBar(
                    toolbarHeight: 0.0,
                  ),
                  body: SafeArea(
                    child: _pages.elementAt(controller.tabindex),
                  ),
                  bottomNavigationBar: NavBAr(
                    currentIndex: controller.tabindex,
                    onTap: (index) async =>
                    await controller.changeTabIndex(index, context),
                  )
              );
            },
          ),
        );
      },
    );
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
