import 'package:eakazijobs/helpers/utils/customLoader.dart';
import 'package:eakazijobs/models/signupModel.dart';
import 'package:eakazijobs/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../../constants/assets/images_constants.dart';
import '../../../../../constants/theme/color_selection.dart';
import '../../../../../helpers/routes/app_pages.dart';
import '../../../../../helpers/utils/utils.dart';
import '../../../../shared_widgets/buttons.dart';
import '../../../../shared_widgets/input_text.dart';
import '../../../../shared_widgets/options_drop_down.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  SignupModel signupModel = SignupModel();
  AuthService authService = AuthService();
  CustomLoader customLoader = CustomLoader();

  @override
  submit(context) async {
    try {
      if (!_formKey.currentState!.validate()) {
        return;
      }

      _formKey.currentState!.save();
      customLoader.showLoader('Creating your account...');

      final result = await authService.signUp(signupModel);
      print('result $result');
      customLoader.showSuccess('Account created! Proceed to login');
      Get.toNamed(Routes.login);
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
    // Get.find<Controller>()
    ValidateInputController c = Get.put(ValidateInputController());
    return Obx(() => Scaffold(
          // appBar: App,

          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 35.h,
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
                            child: Icon(
                              Icons.arrow_back,
                              color: ColorsConst.white,
                            ),
                          ),
                          Spacer(),
                          Text(
                            "Sign Up",
                            style: textTheme(context).headline1,
                          ),
                          Text(
                            "Welcome back to EA Kazi complete courses , Get trained and certified by experts on the platform",
                            style: textTheme(context).subtitle2,
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
                              hintText: "First name",
                              textInputAction: TextInputAction.next,
                              onSave: (String? value) {
                                signupModel.firstName = value;
                              },
                              validator: (String? value) {
                                if (value == '') {
                                  return '';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.name),
                          const SizedBox(
                            height: 24,
                          ),
                          InputTextNormal(
                              // controller: signUpCtrl.usernameController,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              // validator: signUpCtrl.usernameValidator,
                              hintText: "Last name",
                              textInputAction: TextInputAction.next,
                              onSave: (String? value) {
                                signupModel.lastName = value;
                              },
                              validator: (String? value) {
                                if (value == '') {
                                  return '';
                                }
                              },
                              keyboardType: TextInputType.name),
                          const SizedBox(
                            height: 24,
                          ),
                          InputTextNormal(
                              // controller: signUpCtrl.usernameController,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              // validator: signUpCtrl.usernameValidator,
                              hintText: "Email",
                              textInputAction: TextInputAction.next,
                              onSave: (String? value) {
                                signupModel.email = value;
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
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: ServiceDropDown(
                              services: const [
                                "Freelancer",
                                "Employer",
                              ],
                              onSaved: (value) {
                                String role = value == 'Freelancer'
                                    ? 'trainee'
                                    : 'business';
                                signupModel.role = role;
                                print("value $role");
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
                                signupModel.password = value;
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

                          Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, right: 16),
                                child: AuthBtn(
                                  isComplete: c.isValidated.value == true
                                      ? true
                                      : false,
                                  onPressed: () {
                                    submit(context);
                                    // Loader<void>(context)
                                    //     .simpleLoader(() => signUpCtrl.signUp());
                                  },
                                  text: "Sign Up",
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.toNamed(Routes.login);
                                },
                                child: RichText(
                                  text: TextSpan(
                                    text: "Already have an account",
                                    style: textTheme(context)
                                        .subtitle1
                                        ?.copyWith(
                                            color:
                                                Colors.black.withOpacity(0.3)),
                                    children: [
                                      TextSpan(
                                        text: "  Signin",
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
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // const Spacer(),
              ],
            ),
          ),
        ));
  }
}

// controller should be in controller file na
class ValidateInputController extends GetxController {
  RxBool isValidated = false.obs;

  void updateValidateStatus(state) => isValidated.value = state;
}
