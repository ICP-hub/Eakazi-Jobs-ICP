import 'package:eakazijobs/helpers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../../helpers/routes/app_pages.dart';
import '../../../../../helpers/theme/theme.dart';
import '../../../../shared_widgets/buttons.dart';
import '../../../../shared_widgets/options_drop_down.dart';
import 'package:get/get.dart';

class EmployePostJobsFinalScreen extends StatelessWidget {
  const EmployePostJobsFinalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String jobTitle = Get.arguments ?? "Job Title";
    return Scaffold(
        appBar: AppBar(
          title: const Text("Post Jobs"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                "Choose budget and skills required for this project",
                style: textTheme(context).bodyText1?.copyWith(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 29,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: PostJobsDropDown(
                  hint: "UX Design",
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
                height: 9,
              ),
              Text(
                "Type required skills or select from the options below",
                style: extraTheme.copyWith(
                    color: colorScheme(context).secondary.withOpacity(0.3),
                    fontSize: 13),
              ),
              SizedBox(
                height: 29,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: PostJobsDropDown(
                  hint: "Select currency",
                  services: const ["Naira", "Pounds", "Dollars"],
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
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: PostJobsDropDown(
                  hint: "Select budget",
                  services: const [
                    "50,000 - 100,000",
                    "150,000 - 200,000",
                    "500,000 - 1,000,000"
                  ],
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
                height: 9,
              ),
              Text(
                "Kindly select your currency and estimated budget",
                style: extraTheme.copyWith(
                    color: colorScheme(context).secondary.withOpacity(0.3),
                    fontSize: 13),
              ),
              Spacer(),
              SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: AuthBtn(
                      text: "Post project",
                      isComplete: false,
                      onPressed: () {
                        Get.toNamed(Routes.empConfirmDetailsScreen, arguments: jobTitle);
                      }),
                ),
              ),
            ],
          ),
        ));
  }
}
