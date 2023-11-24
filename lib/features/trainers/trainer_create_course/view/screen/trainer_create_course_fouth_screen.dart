import 'package:dotted_border/dotted_border.dart';
import 'package:eakazijobs/helpers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';

import '../../../../shared_widgets/buttons.dart';
import '../../../../shared_widgets/dotted_border.dart';
import '../../../../shared_widgets/input_text.dart';
import '../../../../shared_widgets/options_drop_down.dart';

class TrainerCreateFouthCourse extends StatelessWidget {
  const TrainerCreateFouthCourse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Create Course"),
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
                "Add Topic",
                style: textTheme(context).headline4?.copyWith(fontSize: 17),
              ),
              const SizedBox(
                height: 10,
              ),
              const InputTextNormal2(
                  // controller: signUpCtrl.usernameController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // validator: signUpCtrl.usernameValidator,
                  hintText: "Topic name",
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name),
              SizedBox(
                height: 29,
              ),
              const InputTextArea(
                // controller: signUpCtrl.usernameController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                // validator: signUpCtrl.usernameValidator,
                hintText: "Topic summary",
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Add Video",
                style: textTheme(context).headline4?.copyWith(fontSize: 17),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: PostJobsDropDown(
                  hint: "Select video source",
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
              SizedBox(
                height: 10,
              ),
              DottedBorderContainer(),
              const Spacer(),
              SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: AuthBtn(
                      text: "Next",
                      isComplete: false,
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
