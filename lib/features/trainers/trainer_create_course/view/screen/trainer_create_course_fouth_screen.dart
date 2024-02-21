import 'package:eakazijobs/helpers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../../../helpers/routes/app_pages.dart';
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
          child: SingleChildScrollView(
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
                  height: 20,
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
                  height: 20,
                ),
                Text(
                  "Add Video",
                  style: textTheme(context).headline4?.copyWith(fontSize: 17),
                ),
                SizedBox(
                  height: 10,
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
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                DottedBorderContainer(),
                // const Spacer(),
                const SizedBox(
                  height: 29,
                ),
                SafeArea(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: AuthBtn(
                        text: "Create Course",
                        isComplete: true,
                        onPressed: () {
                          Get.toNamed(Routes.trainerCreateCourseSuccessful);
                        }),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
