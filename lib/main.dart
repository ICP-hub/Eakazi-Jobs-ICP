import 'dart:io';

import 'package:eakazijobs/helpers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:sizer/sizer.dart';

import 'constants/theme/color_selection.dart';
import 'helpers/routes/app_pages.dart';
import 'helpers/theme/theme.dart';

// run on realdevise or simulator/emulato

void main() async {
  // await dotenv.load(fileName: "assets/.env");
  WidgetsFlutterBinding.ensureInitialized();
  // await Hive.initFlutter();

  runApp(
    // DevicePreview(
    //     enabled: false,
    //     builder: (context) {
    //       return
    Sizer(builder: (context, orientation, deviceType) {
      return GlobalLoaderOverlay(
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        useDefaultLoading: false,
        overlayWidget: const Center(
          child: SizedBox(
            height: 131,
            width: 131,
            // child: CircularProgressIndicator(
            //   backgroundColor: Colors.white,
            //   color: ColorsConst.primary,
            //   strokeWidth: 5,
            // ),
            child: SpinKitFadingCircle(
              color: ColorsConst.primary,
            ),
          ),
        ),
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: true,
          // locale: DevicePreview.locale(context),
          // builder: DevicePreview.appBuilder,
          //  routerDelegate: ,
          initialRoute: AppPages.initial,
          title: 'EA KAZI MOBILE',
          theme: ThemeData(
            colorScheme: colorSchemeData,
            primaryColor: colorSchemeData.primary,
            // accentColor: colorSchemeData.secondary,
            scaffoldBackgroundColor: colorSchemeData.background,
            backgroundColor: colorSchemeData.secondary,
            appBarTheme: AppBarTheme(
                color: colorSchemeData.background,
                systemOverlayStyle: lightTaskBar,
                elevation: 0.0,
                centerTitle: true,
                titleTextStyle: appBarTittleStyle),
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
              shape: RoundedRectangleBorder(borderRadius: miniBoxCornerRadius),
            ),
            // primarySwatch: colorSchemeData.secondary,
            textTheme: textThemeData,
            primaryTextTheme: textThemeData,
            // accentTextTheme: textThemeData,
          ),
          defaultTransition: Transition.cupertino,
          getPages: AppPages.routes,
          builder: EasyLoading.init(),
        ),
      );
      // });
    }),
  );
}

// Progect structure
// asssets
// icons
// images
// lib
// common
// routes
// ...
// constants
// ...
// helpers
// theme
// ...
// screen
// shared_widgets(global)
// screen group
// controller
// binding
// screens ....

// lets refactor the code base

// v 0.01
