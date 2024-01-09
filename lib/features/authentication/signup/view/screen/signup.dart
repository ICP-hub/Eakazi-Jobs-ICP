import 'package:eakazijobs/helpers/utils/customLoader.dart';
import 'package:eakazijobs/models/signupModel.dart';
import 'package:eakazijobs/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:eakazijobs/interactions.dart';
import 'package:eakazijobs/integrations.dart';
import 'package:eakazijobs/init.dart';
import 'package:eakazijobs/features/authentication/login/view/screen/sign_in.dart' as signIn;
import 'package:get/get.dart';
import 'package:agent_dart/agent_dart.dart';
import 'package:eakazijobs/features/authentication/login/view/screen/sign_in.dart';
import 'package:eakazijobs/features/shared_widgets/buttons.dart' as btn;

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
  final FocusNode firstNameFocusNode = FocusNode();
  final FocusNode lastNameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();

  Future<void> createUser(fullname, email, role) async {
    // if (_fields == null) {
    //   await initFields();
    // }
    // await _fields!.createUser(fullname: fullname, email: email, role: role);
    // print('result $result');

    var createUser = await newActor?.getFunc(FieldsMethod.createUser)?.call([
      fullname,
      email,
      role,
    ]);

    print("Create User: $createUser");
  }

  @override
  submit(context) async {
    try {
      if (!_formKey.currentState!.validate()) {
        return;
      }

      _formKey.currentState!.save();
      Fields? _fields;
      customLoader.showLoader('Creating your account...');
      fullName = signupModel.firstName! + signupModel.lastName!;
      var email = signupModel.email!;
      var role = signupModel.role!;

      createUser(fullName, email, role);

      // Future<void> initFields() async {
      //   _fields = (await AgentFactory.create(
      //     // the canister id and url for local testing
      //
      //     canisterId: 'd6g4o-amaaa-aaaaa-qaaoq-cai',
      //     url: 'http://10.0.2.2:4943/',
      //     // For Android emulator, please use 10.0.2.2 as endpoint
      //     idl: idl,
      //   ))
      //       .hook(Fields());
      // }



      customLoader.showSuccess('Account created!');
      Get.toNamed(Routes.home);

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

    // final actorController = Get.find<ActorController>();
    //
    // // Now you can access newActor
    // final newActor = actorController.newActor;

    // print('newActor $newActor');

    ValidateInputController c = Get.put(ValidateInputController());
    return Obx(() => Scaffold(
      // appBar: App,

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 40.h,
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
                        "Enter Details",
                        style: textTheme(context).headline2,
                      ),
                      SizedBox(
                        height: 20,
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
                      const SizedBox(
                        height: 24,
                      ),
                      InputTextNormal(
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
                        keyboardType: TextInputType.name,
                        focusNode: firstNameFocusNode,
                        onEditingComplete: () => FocusScope.of(context).requestFocus(lastNameFocusNode),
                      ),

                      const SizedBox(
                        height: 24,
                      ),

                      InputTextNormal(
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
                        keyboardType: TextInputType.name,
                        focusNode: lastNameFocusNode,
                        onEditingComplete: () => FocusScope.of(context).requestFocus(emailFocusNode),
                      ),

                      const SizedBox(
                        height: 24,
                      ),

                      InputTextNormal(
                        hintText: "Email",
                        textInputAction: TextInputAction.done,
                        onSave: (String? value) {
                          signupModel.email = value;
                        },
                        validator: (String? value) {
                          if (value == '') {
                            return '';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        focusNode: emailFocusNode,
                        onEditingComplete: () {
                          emailFocusNode.unfocus();
                        },
                      ),
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
                                ? 'Trainee'
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
                      // InputPasswordText(
                      //     // controller: signUpCtrl.passwordController,
                      //     autovalidateMode:
                      //         AutovalidateMode.onUserInteraction,
                      //     // validator: signUpCtrl.passwordValidtor,
                      //     hintText: "Password",
                      //     textInputAction: TextInputAction.next,
                      //     onSave: (String? value) {
                      //       signupModel.password = value;
                      //     },
                      //     validator: (String? value) {
                      //       if (value == '' || value!.length < 6) {
                      //         return 'Password must be minimum of 6 characters';
                      //       }
                      //     },
                      //     keyboardType: TextInputType.visiblePassword),
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
                            child: btn.AuthBtn(
                              isComplete: c.isValidated.value == true
                                  ? true
                                  : false,
                              onPressed: () {
                                submit(context);
                                // Loader<void>(context)
                                //     .simpleLoader(() => signUpCtrl.signUp());
                              },
                              text: "Get Started",
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // InkWell(
                          //   onTap: () {
                          //     Get.toNamed(Routes.login);
                          //   },
                          //   child: RichText(
                          //     text: TextSpan(
                          //       text: "Already have an account",
                          //       style: textTheme(context)
                          //           .subtitle1
                          //           ?.copyWith(
                          //               color:
                          //                   Colors.black.withOpacity(0.3)),
                          //       children: [
                          //         TextSpan(
                          //           text: "  Signin",
                          //           style: textTheme(context)
                          //               .subtitle1
                          //               ?.copyWith(
                          //                   color: colorScheme(context)
                          //                       .primary),
                          //         )
                          //       ],
                          //     ),
                          //   ),
                          // ),
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