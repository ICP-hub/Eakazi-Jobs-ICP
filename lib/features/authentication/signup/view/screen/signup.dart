import 'dart:convert';

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
import 'package:eakazijobs/features/authentication/login/view/screen/sign_in.dart'
    as signIn;
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
import 'package:eakazijobs/features/authentication/login/view/screen/sign_in.dart'
    as signIn;
import 'package:get/get.dart';
import 'package:agent_dart/agent_dart.dart';
import 'package:eakazijobs/features/authentication/login/view/screen/sign_in.dart';
import 'package:eakazijobs/features/shared_widgets/buttons.dart' as btn;
import 'package:eakazijobs/services/getStates.dart';

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
  CustomLoader customLoader = CustomLoader();

  submit(context) async {
    Controller c = Get.put(Controller());
    ValidateInputController e = Get.find();
    try {
      if (!_formKey.currentState!.validate()) {
        return;
      }
      _formKey.currentState!.save();

      if (!e.isRoleSelected.value) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please enter all the details")),
        );
        return;
      }

      customLoader.showLoader('Creating your account...');

      signupModel.fullName =
          signupModel.firstName! + ' ' + signupModel.lastName!;
      signupModel.email = signupModel.email!;
      signupModel.role = signupModel.role!;

      var createUserResult =
          await newActor?.getFunc(FieldsMethod.createUser)?.call([
        signupModel.fullName,
        signupModel.email,
        signupModel.role,
      ]);

      print("Create User: $createUserResult");

      customLoader.showSuccess('Account created!');
      Get.toNamed(Routes.home);
    } catch (e) {
      print(e);
      customLoader.showError("Error creating account: $e");
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
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 24,
                          ),
                          InputTextNormal(
                            hintText: "First Name",
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.name,
                            onSave: (value) {
                              signupModel.firstName = value;
                            },
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text'; // Error message
                              }
                              return null; // Valid input
                            },
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          InputTextNormal(
                            hintText: "Last Name",
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.name,
                            // controller: lastNameController,
                            onSave: (value) {
                              signupModel.lastName = value;
                            },
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text'; // Error message
                              }
                              return null; // Valid input
                            },
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          InputTextNormal(
                            hintText: "Email",
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.emailAddress,
                            // controller: emailController,
                            onSave: (value) {
                              signupModel.email = value;
                            },
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text'; // Error message
                              }
                              return null; // Valid input
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
                                "Trainer"
                              ],
                              onSaved: (value) {
                                if (value != null && value.isNotEmpty) {
                                  c.isRoleSelected.value = true;
                                  // Assign role to signupModel
                                  if (value == "Freelancer") {
                                    signupModel.role = "freelancer";
                                  } else if (value == "Employer") {
                                    signupModel.role = "employer";
                                  } else {
                                    signupModel.role = "trainer";
                                  }
                                } else {
                                  c.isRoleSelected.value = false;
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
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

class ValidateInputController extends GetxController {
  RxBool isValidated = false.obs;
  RxBool isRoleSelected = false.obs;
  void updateValidateStatus(state) => isValidated.value = state;
}

// class UserDetails extends StatelessWidget {
//   final String fullName;
//   final String email;
//   final String role;
//
//   const UserDetails({
//     Key? key,
//     required this.fullName,
//     required this.email,
//     required this.role,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }
