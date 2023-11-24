import 'package:dotted_border/dotted_border.dart';
import 'package:eakazijobs/constants/assets/icon_constans.dart';
import 'package:eakazijobs/features/shared_widgets/svgs.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DottedBorderContainer extends StatelessWidget {
  const DottedBorderContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      dashPattern: [
        6,
        3,
      ],
      radius: Radius.circular(10),
      padding: EdgeInsets.all(6),
      color: Colors.grey,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: Container(
          height: 150,
          width: 100.w,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgIcon(IconsAssets.upload),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Click to browse or drag and drop your files",
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          // color: Colors.amber,
        ),
      ),
    );
  }
}
