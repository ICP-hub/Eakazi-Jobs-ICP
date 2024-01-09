import 'package:eakazijobs/helpers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../../helpers/routes/app_pages.dart';
import '../../../../shared_widgets/buttons.dart';
import '../../../../shared_widgets/input_text.dart';
import 'package:get/get.dart';

class EmployePostJobsScreen extends StatelessWidget {
  const EmployePostJobsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                "What is the name of the project they would work on?",
                style: textTheme(context).bodyText1?.copyWith(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 29,
              ),
              InputTextNormal2(
                  // controller: signUpCtrl.usernameController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // validator: signUpCtrl.usernameValidator,
                  hintText: "e.g create graphics  designs",
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name),
              Spacer(),
              SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: AuthBtn(
                      text: "Next",
                      isComplete: false,
                      onPressed: () {
                        Get.toNamed(Routes.empPostJoBScreen2);
                        // Get.toNamed(Routes.freelancercoursesassesment);
                      }),
                ),
              ),
            ],
          ),
        ));
  }
}
