import 'package:eakazijobs/constants/theme/color_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class LinerPercentIndicator extends StatelessWidget {
  const LinerPercentIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: LinearPercentIndicator(
        width: 106,
        lineHeight: 5,
        percent: 0.5,
        padding: EdgeInsets.zero,
        barRadius: Radius.circular(10),
        backgroundColor: ColorsConst.grey1,
        progressColor: ColorsConst.orange,
      ),
    );
  }
}
