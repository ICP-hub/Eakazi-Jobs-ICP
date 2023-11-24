import 'package:eakazijobs/helpers/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import '../../../../../helpers/utils/utils.dart';

class NoDataEmployers extends StatelessWidget {
  const NoDataEmployers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10.h,
        ),
        Icon(
          Icons.error_outline_outlined,
          color: Colors.grey,
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: () {
                Get.toNamed(Routes.empPostJoBScreen);
              },
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'You have no published Jobs yet...',
                  style: textTheme(context)
                      .subtitle1
                      ?.copyWith(color: Colors.grey),
                  children: [
                    TextSpan(
                      text: "  Click create a Job to get started",
                      style: textTheme(context)
                          .subtitle1
                          ?.copyWith(color: colorScheme(context).primary),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
