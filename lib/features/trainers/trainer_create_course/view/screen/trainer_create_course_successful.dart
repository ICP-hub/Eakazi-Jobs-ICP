import 'package:eakazijobs/helpers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../../../constants/assets/images_constants.dart';
import '../../../../../helpers/routes/app_pages.dart';
import '../../../../shared_widgets/buttons.dart';

class TrainerCreateCourseSuccessful extends StatelessWidget {
  const TrainerCreateCourseSuccessful({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Assesment Courses")),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              Image.asset(ImageAssets.done),
              Text(
                "Successful",
                style: textTheme(context).headline4?.copyWith(fontSize: 35),
              ),
              Spacer(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 17, vertical: 30),
                child: AuthBtn(
                    text: "Take course",
                    isComplete: true,
                    onPressed: () {
                      Get.toNamed(Routes.freelancercoursesassesment);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
