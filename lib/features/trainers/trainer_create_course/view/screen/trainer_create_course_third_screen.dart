import 'package:eakazijobs/helpers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../../helpers/theme/theme.dart';
import '../../../../shared_widgets/buttons.dart';
import '../../../../shared_widgets/input_text.dart';
import '../../../../shared_widgets/options_drop_down.dart';

class TrainerCreateCourseThirdScreen extends StatelessWidget {
  const TrainerCreateCourseThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Course Settings"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                "Maximum students",
                style: textTheme(context).headline4?.copyWith(fontSize: 17),
              ),
              const InputTextNormal2(
                  // controller: signUpCtrl.usernameController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // validator: signUpCtrl.usernameValidator,
                  hintText: "0",
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name),
              const SizedBox(
                height: 12,
              ),
              Text(
                "Difficulty Level",
                style: textTheme(context).headline4?.copyWith(fontSize: 17),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: PostJobsDropDown(
                  hint: "All levels",
                  services: const ["Programmer", "Team lead", "Trainer"],
                  onSaved: (value) {
                    print("object");
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
                height: 12,
              ),
              Text(
                "Course Type",
                style: textTheme(context).headline4?.copyWith(fontSize: 17),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: PostJobsDropDown(
                  hint: "Paid",
                  services: const ["Programmer", "Team lead", "Trainer"],
                  onSaved: (value) {
                    print("object");
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
                height: 10,
              ),
              Text(
                "Total Duration",
                style: textTheme(context).headline4?.copyWith(fontSize: 17),
              ),
              const InputTextNormal2(
                  // controller: signUpCtrl.usernameController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // validator: signUpCtrl.usernameValidator,
                  hintText: "HH/MM/SS",
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Benefits",
                style: textTheme(context).headline4?.copyWith(fontSize: 17),
              ),
              const InputTextNormal2(
                  // controller: signUpCtrl.usernameController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // validator: signUpCtrl.usernameValidator,
                  hintText: "List benefits of taking this course",
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Target Audience",
                style: textTheme(context).headline4?.copyWith(fontSize: 17),
              ),
              const InputTextNormal2(
                  // controller: signUpCtrl.usernameController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // validator: signUpCtrl.usernameValidator,
                  hintText: "State target audience",
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name),
              SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                  child: AuthBtn(
                      text: "Next",
                      isComplete: true,
                      onPressed: () {
                        // Get.toNamed(Routes.freelancercoursesassesment);
                      }),
                ),
              ),
            ],
          ),
        ));
  }
}
