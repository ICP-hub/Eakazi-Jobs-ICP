import 'package:eakazijobs/helpers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import '../../../../../services/getStates.dart';
import '../../../../shared_widgets/buttons.dart';
import '../../../../shared_widgets/input_text.dart';
import '../../../../../helpers/routes/app_pages.dart';
import 'package:eakazijobs/integrations.dart';
import 'package:eakazijobs/features/authentication/login/view/screen/sign_in.dart'
    as SignIn;

class TrainerCreateCourse extends StatelessWidget {
  TrainerCreateCourse({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? title = " ";

  submit() async {
    Controller c = Get.put(Controller());
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();

    var createCourse = await SignIn.newActor
        ?.getFunc(FieldsMethod.createCourse)
        ?.call([title]);
    print(createCourse);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Create Course"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    "What is the name of the course you want to create ?",
                    style: textTheme(context).bodyText1?.copyWith(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 29,
                  ),
                  InputTextNormal2(
                      // controller: signUpCtrl.usernameController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onSave: (value) {
                        title = value;
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter course title';
                        }
                        return null;
                      },
                      hintText: "Enter course title",
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name),
                  SizedBox(
                    height: 29,
                  ),
                  const InputTextArea(
                      // controller: signUpCtrl.usernameController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      // validator: signUpCtrl.usernameValidator,
                      hintText: "Enter description",
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name),
                  SizedBox(
                    height: 29,
                  ),
                  SafeArea(
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      child: AuthBtn(
                          text: "Next",
                          isComplete: false,
                          onPressed: () {
                            submit();
                            Get.toNamed(Routes.trainerCreateCourseSecondScreen);
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
