import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../helpers/routes/app_pages.dart';
import '../../../../../helpers/utils/utils.dart';
import '../../../../integrations.dart';
import '../../../authentication/login/view/screen/sign_in.dart' as SignIn;
import '../../../shared_widgets/buttons.dart';


class CourseDescription extends StatefulWidget {
  const CourseDescription({
    Key? key,
    required this.title,
    required this.body,
    required this.courseId,
  }) : super(key: key);

  final String title;
  final String body;
  final String courseId;

  @override
  _CourseDescriptionSate createState() => _CourseDescriptionSate();
}

class _CourseDescriptionSate extends State<CourseDescription> {

  late Future<bool> isAppliedFuture;

  @override
  void initState() {
    super.initState();
    isAppliedFuture = checkIfApplied();
  }

  Future<bool> checkIfApplied() async {
    return await SignIn.newActor!.getFunc(FieldsMethod.checkAppliedCourse)?.call([
      widget.courseId,
    ]) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: isAppliedFuture,
        builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        bool isApplied = snapshot.data ?? false;
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 28, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: textTheme(context).bodyText1?.copyWith(fontSize: 14),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.body,
              style: textTheme(context).bodyText2?.copyWith(fontSize: 14),
              textAlign: TextAlign.justify,
            ),
            Spacer(),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: isApplied
                    ? AuthBtn(
                    text: "Go to course",
                    isComplete: true,
                    onPressed: () {
                      Get.toNamed(Routes.freeLanceCourseVideos);
                    })
                    : AuthBtn(
                  text: "Take Course",
                  isComplete: true,
                  onPressed: () async {
                    var applyJob = await SignIn.newActor!
                        .getFunc(FieldsMethod.applyCourse)
                        ?.call([widget.courseId]);

                    print(applyJob);
                    Get.toNamed(Routes.flCourseSuccessful);
                  },
                ),
              ),
            ),
          ],
        ),
    );
      } else {
        return Container(); // You can return an empty container or a placeholder widget here
      }
        },
    );
  }
}

