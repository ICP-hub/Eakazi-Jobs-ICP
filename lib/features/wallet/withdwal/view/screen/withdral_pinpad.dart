import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import 'package:loader_overlay/loader_overlay.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../constants/theme/color_selection.dart';
import '../../../../../helpers/routes/app_pages.dart';
import '../../../../../helpers/utils/utils.dart';
import '../../../../shared_widgets/buttons.dart';

class WithdrawlPinPad extends StatefulWidget {
  const WithdrawlPinPad({Key? key}) : super(key: key);

  @override
  State<WithdrawlPinPad> createState() => _WithdrawlPinPadState();
}

class _WithdrawlPinPadState extends State<WithdrawlPinPad> {
  TextEditingController textEditingController = TextEditingController();
  String currentText = "";
  // ..text = "123456";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isComplete = false.obs;
    final code = "".obs;
    // final Map<String, String>? arg = Get.arguments;
    // final userName = arg == null ? "" : arg["userName"];
    // final otp = arg == null ? "" : arg["otp"];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Withdraw"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 30,
            left: 33,
            right: 33,
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Spacer(),
              // Image.asset(ImageAssets.appLogo),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Text(
                  "Enter 4-Digit Pin",
                  style: textTheme(context).headline3,
                ),
              ),

              Text(
                "We live",
                textAlign: TextAlign.center,
                style: textTheme(context)
                    .subtitle2!
                    .copyWith(color: ColorsConst.black.withOpacity(0.4)),
              ),
              const SizedBox(
                height: 78,
              ),
              SingleChildScrollView(
                child: PinCodeTextField(
                  enablePinAutofill: true,
                  textStyle:
                      textTheme(context).headline4?.copyWith(fontSize: 28),
                  length: 4,
                  obscureText: false,

                  animationType: AnimationType.fade,
                  cursorColor: colorScheme(context).primary,

                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderWidth: 1,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,

                    inactiveFillColor: colorScheme(context).background,
                    activeFillColor: colorScheme(context).background,
                    errorBorderColor: colorScheme(context).error,

                    // activeColor: ColorsConst.blackThree,
                    inactiveColor: ColorsConst.dropDownBorderColor,
                    activeColor: colorScheme(context).primary,
                    fieldOuterPadding: const EdgeInsets.only(
                      right: 10,
                      left: 20,
                    ),
                    fieldWidth: 50,
                    selectedFillColor: colorScheme(context).background,
                    selectedColor: ColorsConst.primary,

                    // activeFillColor: ColorsConst.blackSix,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  // backgroundColor: Colors.blue.shade50,
                  enableActiveFill: true,
                  // errorAnimationController: errorController,
                  controller: textEditingController,
                  onCompleted: (v) async {
                    isComplete.value = true;
                    code.value = v;
                    Get.toNamed(Routes.successful);
                    // print("Completed");
                    // context.loaderOverlay.show();
                    // await Future.delayed(const Duration(seconds: 3),
                    //     () {
                    //   context.loaderOverlay.hide();
                    //   showDialog(
                    //     context: context,
                    //     builder: (BuildContext context) {
                    //       return const SuccessDialogue();
                    //     },
                    //   );
                    // });
                  },
                  onChanged: (value) {},
                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                  appContext: context,
                ),
              ),
              Text(
                "Didn’t get an code? Resend",
                style: textTheme(context)
                    .headline4
                    ?.copyWith(fontSize: 14, color: Colors.white),
              ),
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: Obx(
                  () => AuthBtn(
                    text: "Verify",
                    isComplete: isComplete.value,
                    onPressed: () async {
                      // try {
                      //   context.loaderOverlay.show();
                      //   final data =
                      //       await Auth.loginVerify(userName!, code.value);

                      //   context.loaderOverlay.hide();
                      //   if (data != null) {
                      //     Get.toNamed(Routes.bottomNavBar, arguments: data);
                      //   }
                      // } catch (e) {
                      //   print(e);
                      // }

                      // if (isComplete.value) {
                      //   context.loaderOverlay.show();
                      //   await Future.delayed(const Duration(seconds: 3), () {
                      //     context.loaderOverlay.hide();
                      //     Get.toNamed(Routes.bottomNavBar);
                      //   });
                      // }
                    },
                    color: ColorsConst.primary2,
                  ),
                ),
              ),
              // Padding(
            ],
          ),
        ),
      ),
    );
  }
}
