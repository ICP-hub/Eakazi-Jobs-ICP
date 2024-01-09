import 'package:eakazijobs/constants/theme/color_selection.dart';
import 'package:eakazijobs/helpers/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JobsEmployesrWidgte extends StatelessWidget {
  const JobsEmployesrWidgte({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        "UX Design Project",
        style: textTheme(context).headline6?.copyWith(fontSize: 14),
      ),
      subtitle: Text(
        "Ui/Ux Design skills required",
        style: textTheme(context)
            .headline6
            ?.copyWith(fontSize: 10, color: ColorsConst.greyColorText),
      ),
      trailing: Text(
        "N50,000 - N100,000",
        style: textTheme(context)
            .headline6
            ?.copyWith(fontSize: 13, color: ColorsConst.greyColorText),
      ),
    );
  }
}
