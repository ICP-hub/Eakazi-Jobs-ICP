import 'package:eakazijobs/helpers/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import '../../../../../constants/theme/color_selection.dart';
import '../../../../../helpers/utils/utils.dart';
import '../../employers/employers_profile/view/widgets/employer_profile_container.dart';
import '../../shared_widgets/buttons.dart';
import '../../shared_widgets/dotted_border.dart';
import '../../shared_widgets/input_text.dart';
import '../../shared_widgets/options_drop_down.dart';

class TrEditCourse extends StatelessWidget {
  TrEditCourse({Key? key}) : super(key: key);

  String? title = " ";

  @override
  Widget build(BuildContext context) {
    final tittle = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(tittle ?? "Course details"),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 24, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Overview",
                      style: textTheme(context).bodyText1?.copyWith(
                            color: ColorsConst.tittleColor2,
                          ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      height: 80,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.trainerCourseStudentsEnrolled);
                            },
                            child: OverviewContainer(
                              text: "100",
                              subText: "Students Enrolled",
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.trainerCertificateIssued);
                            },
                            child: OverviewContainer(
                              text: "100",
                              subText: "Certificates Issued",
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 80,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: const [
                          OverviewContainer(
                            text: "0",
                            subText: "Commision(\$)",
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          OverviewContainer(
                            text: "120",
                            subText: "Days Left",
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 29,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Course Title",
                            style: TextStyle(
                              color: ColorsConst.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          InputTextNormal4(
                              // controller: signUpCtrl.usernameController,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
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
                            height: 16,
                          ),
                          Text(
                            "Description",
                            style: TextStyle(
                              color: ColorsConst.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const InputTextArea2(
                            // controller: signUpCtrl.usernameController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            // validator: signUpCtrl.usernameValidator,
                            hintText: "Enter description",
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.name,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            "Category",
                            style: TextStyle(
                              color: ColorsConst.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          PostJobsDropDown2(
                            hint: "Select a category",
                            services: const [
                              "Programmer",
                              "Team lead",
                              "Trainer"
                            ],
                            onSaved: (value) {
                              print("object");
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            "Total Duration",
                            style: TextStyle(
                              color: ColorsConst.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const InputTextNormal4(
                              // controller: signUpCtrl.usernameController,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              // validator: signUpCtrl.usernameValidator,
                              hintText: "120 Days",
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            "Price",
                            style: TextStyle(
                              color: ColorsConst.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          InputTextNormal4(
                            // controller: signUpCtrl.usernameController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            // validator: signUpCtrl.usernameValidator,
                            hintText: "\$0.00",
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.name,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            "Benefits",
                            style: TextStyle(
                              color: ColorsConst.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const InputTextNormal4(
                            // controller: signUpCtrl.usernameController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            // validator: signUpCtrl.usernameValidator,
                            hintText: "List benefits of taking this course",
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.name,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            "Target Audience",
                            style: TextStyle(
                              color: ColorsConst.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const InputTextNormal4(
                            // controller: signUpCtrl.usernameController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            // validator: signUpCtrl.usernameValidator,
                            hintText: "State target audience",
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.name,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            "Difficulty Level",
                            style: TextStyle(
                              color: ColorsConst.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          PostJobsDropDown2(
                            hint: "All levels",
                            services: const [
                              "Beginner",
                              "Intermediate",
                              "Advance"
                            ],
                            onSaved: (value) {
                              print("object");
                              // ctrl.bussinesCategory.value = value!;
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            "Schedule",
                            style: TextStyle(
                              color: ColorsConst.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Row(
                              children: [
                                Expanded(
                                  child: PostJobsDropDown2(
                                    hint: "0 Hours",
                                    services: const [
                                      "1 Hours",
                                      "2 Hours",
                                      "3 Hours"
                                    ],
                                    onSaved: (value) {
                                      print("object");
                                      // ctrl.bussinesCategory.value = value!;
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: PostJobsDropDown2(
                                    hint: "Weekly/Daily",
                                    services: const [
                                      "Hourly",
                                      "Monthly",
                                      "Yearly"
                                    ],
                                    onSaved: (value) {
                                      print("object");
                                      // ctrl.bussinesCategory.value = value!;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "Upload Image",
                            style: TextStyle(
                              color: ColorsConst.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          DottedBorderContainer(),
                          const SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            child: singleButton(context),
          ),
        ],
      ),
    );
  }
}

Widget singleButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: AuthBtn(
      text: "Edit Course",
      isComplete: true,
      onPressed: () {},
    ),
  );
}
