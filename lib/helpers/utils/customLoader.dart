import 'package:eakazijobs/helpers/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CustomLoader {
  void configLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.circle
      ..loadingStyle = EasyLoadingStyle.light
      ..indicatorSize = 45.0
      ..indicatorColor = colorSchemeData.primary
      ..radius = 10.0
      ..progressColor = colorSchemeData.primary
      ..backgroundColor = Colors.green
      ..indicatorColor = colorSchemeData.primary
      ..textColor = Colors.yellow
      ..maskType = EasyLoadingMaskType.custom
      ..maskColor = Colors.black.withOpacity(0.5)
      ..userInteractions = false
      ..dismissOnTap = false;
    // ..customAnimation = CustomAnimation();
  }

  showLoader(title) {
    configLoading();
    EasyLoading.show(status: '$title');
  }

  showSuccess(title) {
    configLoading();
    EasyLoading.showSuccess(title, dismissOnTap: true);
  }

  showError(title) {
    configLoading();
    EasyLoading.showError(title, dismissOnTap: true);
  }

  dismissLoader() {
    configLoading();
    EasyLoading.dismiss();
  }
}
