import 'package:eakazijobs/constants/theme/color_selection.dart';
import 'package:eakazijobs/helpers/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JobsTrainersWidgte extends StatelessWidget {
  const JobsTrainersWidgte({
    Key? key,
    required this.tittle,
  }) : super(key: key);

  final String tittle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Background color
          borderRadius: BorderRadius.circular(10), // Border radius
          border: Border.all(
            color: Colors.black, // Border color
            width: 1.0, // Border width
          ),
        ),
        child: ListTile(
          title: Text(
            tittle,
            style: textTheme(context).headline6?.copyWith(fontSize: 14),
          ),
          subtitle: Text(
            "$tittle skills required",
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
        ),
      ),
    );
  }
}
