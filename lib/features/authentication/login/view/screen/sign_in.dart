import 'package:eakazijobs/helpers/utils/customLoader.dart';
import 'package:eakazijobs/models/signinModel.dart';

import 'package:eakazijobs/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../constants/assets/images_constants.dart';
import '../../../../../constants/theme/color_selection.dart';
import '../../../../../helpers/routes/app_pages.dart';
import '../../../../../helpers/utils/utils.dart';
import '../../../../shared_widgets/buttons.dart';
import '../../../../shared_widgets/input_text.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  SigninModel signinModel = SigninModel();
  AuthService authService = AuthService();
  CustomLoader customLoader = CustomLoader();

  @override
  submit(context) async {
    try {
      if (!_formKey.currentState!.validate()) {
        return;
      }

      _formKey.currentState!.save();
      customLoader.showLoader('Login you in...');

      final result = await authService.signIn(signinModel);
      print('result $result');
      customLoader.dismissLoader();

      Get.toNamed(Routes.home);
      // if (signupModel.role == 'freelancer') {
      //   Get.toNamed(Routes.freeLancerHome);
      // }

      // Get.to((CompleteRegistration()));
      // Navigator.pushNamed(context, CompleteRegistrationRoute);

      // Get.to(Tabs());
    } catch (e) {
      customLoader.showError(e);
    }
  }

  validateFields(c) {
    print('validating fields');
    if (!_formKey.currentState!.validate()) {
      c.updateValidateStatus(false);
      return;
    } else {
      c.updateValidateStatus(true);
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    SignInValidateInputController c = Get.put(SignInValidateInputController());
    return Obx(() => Scaffold(
          // appBar: App,

          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 50.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(ImageAssets.backGroundImage),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: SafeArea(
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: const Icon(
                              Icons.arrow_back,
                              color: ColorsConst.white,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "Sign in",
                            style: textTheme(context).headline2,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              "Welcome back to EA Kazi complete courses , Get trained and certified by experts on the platform",
                              style: textTheme(context).subtitle2,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Form(
                      key: _formKey,
                      onChanged: () {
                        validateFields(c);
                      },
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            InputTextNormal(
                                // controller: signUpCtrl.usernameController,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                // validator: signUpCtrl.usernameValidator,
                                hintText: "Email address",
                                textInputAction: TextInputAction.next,
                                onSave: (String? value) {
                                  signinModel.email = value;
                                },
                                validator: (String? value) {
                                  if (value == '') {
                                    return '';
                                  }
                                },
                                keyboardType: TextInputType.emailAddress),
                            const SizedBox(
                              height: 24,
                            ),
                            InputPasswordText(
                                // controller: signUpCtrl.passwordController,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                // validator: signUpCtrl.passwordValidtor,
                                hintText: "Password",
                                textInputAction: TextInputAction.next,
                                onSave: (String? value) {
                                  signinModel.password = value;
                                },
                                validator: (String? value) {
                                  if (value == '' || value!.length < 6) {
                                    return 'Password must be minimum of 6 characters';
                                  }
                                },
                                keyboardType: TextInputType.visiblePassword),
                            // Align(
                            //   alignment: Alignment.topRight,
                            //   child: Text(
                            //     "Forgot your password?",
                            //     style: textTheme(context).subtitle1?.copyWith(
                            //         color: colorScheme(context).secondary.withOpacity(0.5)),
                            //   ),
                            // ),

                            const SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                "Forgot your password?",
                                style: textTheme(context).subtitle1?.copyWith(
                                    color: colorScheme(context)
                                        .secondary
                                        .withOpacity(0.5)),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, right: 16),
                                  child: AuthBtn(
                                    isComplete: c.isValidated.value == true
                                        ? true
                                        : false,
                                    onPressed: () {
                                      submit(context);
                                      // Get.toNamed(Routes.freeLancerHome);
                                      // Loader<void>(context)
                                      //     .simpleLoader(() => signUpCtrl.signUp());
                                    },
                                    text: "Sign In",
                                  ),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(Routes.signup);
                                  },
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'Dont have an account',
                                      style: textTheme(context)
                                          .subtitle1
                                          ?.copyWith(
                                              color: Colors.black
                                                  .withOpacity(0.3)),
                                      children: [
                                        TextSpan(
                                          text: "  Signup",
                                          style: textTheme(context)
                                              .subtitle1
                                              ?.copyWith(
                                                  color: colorScheme(context)
                                                      .primary),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )),
                // const Spacer(),
              ],
            ),
          ),
        ));
  }
}

class SignInValidateInputController extends GetxController {
  RxBool isValidated = false.obs;

  void updateValidateStatus(state) => isValidated.value = state;
}
