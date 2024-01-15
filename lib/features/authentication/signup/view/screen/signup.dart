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
  // AuthService authService = AuthService();
  CustomLoader customLoader = CustomLoader();
  // final TextEditingController firstNameController = TextEditingController();
  // final TextEditingController lastNameController = TextEditingController();
  // final TextEditingController emailController = TextEditingController();

  submit(context) async {

    try {
      if (!_formKey.currentState!.validate()) {
        return;
      }
      _formKey.currentState!.save();
      customLoader.showLoader('Creating your account...');

      // Use actual values instead of string literals
      signupModel.fullName = signupModel.firstName! + ' ' + signupModel.lastName!;
      // signupModel.email = signupModel.email!;
      // signupModel.role = signupModel.role!;

      Map<String, dynamic> jsonObject = {
        "first_name": signupModel.firstName,
        "last_name": signupModel.lastName,
        "full_name": signupModel.fullName,
        "email": signupModel.email,
        "user_role": signupModel.role,
        "password": "12345678"
      };

      SignupModel.fromJson(jsonObject);

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
                              ],
                              onSaved: (value) {
                                String role = value == 'Freelancer'
                                    ? 'Trainee'
                                    : 'business';
                                signupModel.role = role;
                                print("value $role");
                                // ctrl.bussinesCategory.value = value!;
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