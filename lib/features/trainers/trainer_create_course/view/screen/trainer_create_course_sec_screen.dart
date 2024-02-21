import 'package:eakazijobs/helpers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../../../helpers/routes/app_pages.dart';
import '../../../../shared_widgets/buttons.dart';
import '../../../../shared_widgets/options_drop_down.dart';

class TrainerCreateCourseSecoundScreen extends StatelessWidget {
  const TrainerCreateCourseSecoundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Create Course"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                "What is the most suitable category for this course ?",
                style: textTheme(context).bodyText1?.copyWith(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 29,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: PostJobsDropDown(
                  hint: "select a category",
                  services: const ["Programmer", "Team lead", "Trainer"],
                  onSaved: (value) {
                    print("object");
                    // ctrl.bussinesCategory.value = value!;\
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
                    Get.toNamed(Routes.trainerCreateCourseThirdScreen);
                  }),
            ),
          ),
            ],
          ),
        ));
  }
}
