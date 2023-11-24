import 'package:flutter/material.dart';

import '../../../constants/theme/color_selection.dart';

import '../../../helpers/theme/theme.dart';
import '../../../helpers/utils/utils.dart';

class InputTExtxHelper {
  final BuildContext context;
  final String hintText;
  final double? fontSize;

  InputTExtxHelper(
    this.context,
    this.hintText,
    this.fontSize,
  );

  InputDecoration decoration() {
    return InputDecoration(
      fillColor: ColorsConst.blackSix.withOpacity(0.7),
      filled: true,
      errorMaxLines: null,
      errorStyle: const TextStyle(fontSize: 0.01),
      // floatingLabelBehavior: FloatingLabelBehavior.auto,
      // labelText: hintText,
      // labelStyle:
      //     textTheme(context).caption?.copyWith(color: Colors.black),

      // prefixIcon: Icon(Icons.email),
      // contentPadding: const EdgeInsets.only(
      //   // left: 19.0,
      //   // top: .0,
      // ),

      // errorBorder: ,
      // prefix: const SizedBox(
      //   width: 19,
      // ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: smallBoxCornerRadius,
        borderSide: BorderSide(color: colorScheme(context).error, width: 1),
      ),
      errorBorder: OutlineInputBorder(
          borderRadius: smallBoxCornerRadius,
          borderSide: BorderSide(color: colorScheme(context).error, width: 1)),
      enabledBorder: OutlineInputBorder(
          borderRadius: smallBoxCornerRadius,
          borderSide: BorderSide(
              color: ColorsConst.blackSix.withOpacity(0.7), width: 1)),
      hintText: hintText,
      focusedBorder: OutlineInputBorder(
          borderRadius: smallBoxCornerRadius,
          borderSide: BorderSide(
              color: ColorsConst.blackSix.withOpacity(0.7), width: 1)),

      // errorText: "faliure",
      hintStyle: textTheme(context).caption?.copyWith(
          color: colorScheme(context).secondary.withOpacity(0.3),
          fontSize: fontSize),
    );
  }

  InputDecoration decoration2() {
    return InputDecoration(
      fillColor: ColorsConst.blackSix.withOpacity(0.7),
      filled: true,

      // floatingLabelBehavior: FloatingLabelBehavior.auto,
      // labelText: hintText,
      // labelStyle:
      //     textTheme(context).caption?.copyWith(color: Colors.black),

      // prefixIcon: Icon(Icons.email),
      contentPadding: const EdgeInsets.only(
        // left: 19.0,
        top: 40.0,
      ),

      // errorBorder: ,
      prefix: const SizedBox(
        width: 19,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: miniBoxCornerRadius,
        borderSide: BorderSide(color: colorScheme(context).error, width: 1),
      ),
      errorBorder: OutlineInputBorder(
          borderRadius: smallBoxCornerRadius,
          borderSide: BorderSide(color: colorScheme(context).error, width: 1)),
      enabledBorder: OutlineInputBorder(
          borderRadius: smallBoxCornerRadius,
          borderSide: BorderSide(
              color: ColorsConst.blackSix.withOpacity(0.7), width: 1)),
      hintText: hintText,
      focusedBorder: OutlineInputBorder(
          borderRadius: smallBoxCornerRadius,
          borderSide: BorderSide(
              color: ColorsConst.blackSix.withOpacity(0.7), width: 1)),

      // errorText: "faliure",
      hintStyle: extraTheme.copyWith(
          color: colorScheme(context).secondary.withOpacity(0.3),
          fontSize: fontSize),
    );
  }

  InputDecoration decoration3() {
    return InputDecoration(
      // fillColor: ColorsConst.blackSix.withOpacity(0.7),
      // filled: true,

      // floatingLabelBehavior: FloatingLabelBehavior.auto,
      // labelText: hintText,
      // labelStyle:
      //     textTheme(context).caption?.copyWith(color: Colors.black),

      // prefixIcon: Icon(Icons.email),
      contentPadding: const EdgeInsets.only(
        // left: 19.0,
        top: 27.0,
      ),

      // errorBorder: ,
      prefix: const SizedBox(
        width: 19,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: miniBoxCornerRadius,
        borderSide: BorderSide(color: colorScheme(context).error, width: 1),
      ),
      errorBorder: OutlineInputBorder(
          borderRadius: smallBoxCornerRadius,
          borderSide: BorderSide(color: colorScheme(context).error, width: 1)),
      enabledBorder: OutlineInputBorder(
          borderRadius: smallBoxCornerRadius,
          borderSide:
              BorderSide(color: ColorsConst.dropDownBorderColor, width: 1)),
      hintText: hintText,
      focusedBorder: OutlineInputBorder(
          borderRadius: smallBoxCornerRadius,
          borderSide:
              BorderSide(color: ColorsConst.dropDownBorderColor, width: 1)),

      // errorText: "faliure",
      hintStyle: textTheme(context)
          .subtitle2
          ?.copyWith(color: Colors.black.withOpacity(0.4)),
    );
  }
}

// var inputDecoration = 