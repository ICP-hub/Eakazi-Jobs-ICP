import 'package:eakazijobs/helpers/utils/utils.dart';
import 'package:eakazijobs/constants/assets/images_constants.dart';
import 'package:eakazijobs/constants/theme/color_selection.dart';
import 'package:eakazijobs/helpers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sizer/sizer.dart';

import '../../../../../helpers/routes/app_pages.dart';
import '../../../../shared_widgets/buttons.dart';
import 'package:get/get.dart';
import '../../../../shared_widgets/input_text.dart';

class EmployerConfirmDetailsScreen extends StatelessWidget {
  const EmployerConfirmDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Confirm Details"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                "Kindly confirm that all the details are correct",
                style: textTheme(context).bodyText1?.copyWith(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 29,
              ),
              Container(
                height: 174,
                width: 100.w,
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 12, top: 11),
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage(ImageAssets.image1))),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  color: ColorsConst.warning,
                  child: Text(
                    "New",
                    style: textTheme(context)
                        .headline4
                        ?.copyWith(color: ColorsConst.white),
                  ),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Text(
                "UX Design Project", style: textTheme(context).headline1,
                // ?.copyWith(color: ColorsConst.white),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                // color: ColorsConst.warning,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey),
                ),
                child: Text(
                  "N50,000 - N100,000",
                  style: textTheme(context)
                      .headline2
                      ?.copyWith(color: ColorsConst.black, fontSize: 16),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Create ui/ux design  prototype for our mobile app",
                style: textTheme(context)
                    .headline4
                    ?.copyWith(color: ColorsConst.black.withOpacity(0.6)),
              ),
              SizedBox(
                height: 19,
              ),
              Text(
                "UI/UX Design skills reuired",
                style: textTheme(context)
                    .headline4
                    ?.copyWith(color: ColorsConst.black.withOpacity(0.6)),
              ),
              Spacer(),
              SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: AuthBtn(
                      text: "Next",
                      isComplete: false,
                      onPressed: () {
                        Get.toNamed(Routes.successful);
                      }),
                ),
              ),
            ],
          ), 
        ));
  }
}
