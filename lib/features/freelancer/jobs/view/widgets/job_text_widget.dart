import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../helpers/routes/app_pages.dart';
import '../../../../../helpers/utils/utils.dart';
import '../../../../shared_widgets/buttons.dart';

class JobDescription extends StatelessWidget {
  const JobDescription({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 28, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: textTheme(context).bodyText1?.copyWith(fontSize: 14),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              body,
              style: textTheme(context).bodyText2?.copyWith(fontSize: 14),
              textAlign: TextAlign.justify,
            ),
            Spacer(),
            SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: AuthBtn(
                    text: "Apply Job",
                    isComplete: true,
                    onPressed: () {
                      Get.toNamed(Routes.successful);
                    }),
              ),
            ),
          ],
        ));
  }
}
