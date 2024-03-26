import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../helpers/routes/app_pages.dart';
import '../../../../../helpers/utils/utils.dart';
import '../../../../../integrations.dart';
import '../../../../authentication/login/view/screen/sign_in.dart' as SignIn;
import '../../../../shared_widgets/buttons.dart';
import 'package:eakazijobs/helpers/utils/customLoader.dart';

class JobDescription extends StatefulWidget {
  const JobDescription({
    Key? key,
    required this.title,
    required this.body,
    required this.jobId,
  }) : super(key: key);

  final String title;
  final String body;
  final String jobId;

  @override
  _JobDescriptionState createState() => _JobDescriptionState();
}

class _JobDescriptionState extends State<JobDescription> {
  late Future<bool> isAppliedFuture;
  CustomLoader customLoader = CustomLoader();

  @override
  void initState() {
    super.initState();
    isAppliedFuture = checkIfApplied();
  }

  Future<bool> checkIfApplied() async {
    return await SignIn.newActor!.getFunc(FieldsMethod.checkAppliedJob)?.call([
      widget.jobId,
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
                        ? DisabledBtn(
                      text: "Applied",
                    )
                        : AuthBtn(
                      text: "Apply Job",
                      isComplete: true,
                      onPressed: () async {
                        customLoader.showLoader('Applying...');
                        var applyJob = await SignIn.newActor!
                            .getFunc(FieldsMethod.applyJobs)
                            ?.call([widget.jobId]);

                        print(applyJob);
                        customLoader.showSuccess('Job applied');
                        Get.toNamed(Routes.successful);
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
