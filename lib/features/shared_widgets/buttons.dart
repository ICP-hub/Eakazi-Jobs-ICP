import 'dart:ui';
import 'package:agent_dart/agent_dart.dart';
import 'package:eakazijobs/constants/theme/color_selection.dart';
import 'package:flutter/material.dart';

import '../../helpers/theme/theme.dart';
import '../../helpers/utils/utils.dart';

typedef ButtonCallback = void Function();

class AuthBtn extends StatelessWidget {
  const AuthBtn({
    required this.text,
    required this.isComplete,
    Key? key,
    required this.onPressed,
    this.borderRadius,
    this.color,
    this.textStyle,
  }) : super(key: key);
  final ButtonCallback? onPressed;
  final String text;
  final bool? isComplete;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        // minimumSize: Size.zero,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        maximumSize: Size(width(context), 50),

        minimumSize: Size(width(context), 50),
        backgroundColor: isComplete == null || isComplete == true
            ? color ?? Theme.of(context).colorScheme.primary
            // : Theme.of(context).colorScheme.primaryVariant,
            : Theme.of(context).colorScheme.primary,

        shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? smallBoxCornerRadius),
        textStyle: textStyle ?? Theme.of(context).textTheme.button,
        // onPrimary: Theme.of(context).colorScheme.onSecondary,
        // elevation: 2.0,
        // minimumSize: Size(width(context), height(context) * 0.08),
      ),
      child: FittedBox(
          child: Text(text, style: textStyle ?? textTheme(context).button)),
    );
  }
}

class AuthIdBtn extends StatelessWidget {
  const AuthIdBtn({
    required this.text,
    required this.isComplete,
    Key? key,
    required this.onPressed,
    this.borderRadius,
    this.color,
    this.textStyle,
  }) : super(key: key);
  final ButtonCallback? onPressed;
  final String text;
  final bool? isComplete;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;
  final TextStyle? textStyle;

    @override
   Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        // minimumSize: Size.zero,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        maximumSize: Size(width(context), 50),

        minimumSize: Size(width(context), 50),
        backgroundColor: isComplete == null || isComplete == true
            ? color ?? Theme.of(context).colorScheme.primary
            // : Theme.of(context).colorScheme.primaryVariant,
            : Theme.of(context).colorScheme.primary,

        shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? smallBoxCornerRadius),
        textStyle: textStyle ?? Theme.of(context).textTheme.button,
        // onPrimary: Theme.of(context).colorScheme.onSecondary,
        // elevation: 2.0,
        // minimumSize: Size(width(context), height(context) * 0.08),
      ),
      child: FittedBox(
          child: Text(text, style: textStyle ?? textTheme(context).button)),
    );
  }



}




class AuthBtnBorder extends StatelessWidget {
  const AuthBtnBorder({
    required this.text,
    required this.isComplete,
    Key? key,
    required this.onPressed,
    this.borderRadius,
    this.color,
  }) : super(key: key);
  final ButtonCallback? onPressed;
  final String text;
  final bool? isComplete;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          // minimumSize: Size.zero,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          maximumSize: Size(width(context), 50),

          minimumSize: Size(width(context), 50),
          // backgroundColor: isComplete == null || isComplete == true
          //     ? color ?? Theme.of(context).colorScheme.primary
          //     : Theme.of(context).colorScheme.primaryVariant,

          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.black.withOpacity(0.5)),
              borderRadius: borderRadius ?? BorderRadius.circular(3)),
          textStyle: textTheme(context)
              .caption
              ?.copyWith(color: ColorsConst.texxtColorWallet),
          // onPrimary: Theme.of(context).colorScheme.onSecondary,
          // elevation: 2.0,
          // minimumSize: Size(width(context), height(context) * 0.08),
        ),
        child: FittedBox(
          child: Text(text,
              style: textTheme(context)
                  .caption
                  ?.copyWith(color: ColorsConst.texxtColorWallet)),
        ));
  }
}

class DisabledBtn extends StatelessWidget {
  const DisabledBtn({
    required this.text,
    this.isComplete,
    Key? key,
    this.onPressed,
    this.borderRadius,
    this.color,
    this.textStyle,
  }) : super(key: key);
  final ButtonCallback? onPressed;
  final String text;
  final bool? isComplete;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: null,
      style: TextButton.styleFrom(
        // minimumSize: Size.zero,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        maximumSize: Size(width(context), 50),

        minimumSize: Size(width(context), 50),
        backgroundColor: isComplete == null || isComplete == true
            ? color ?? Colors.grey
        // : Theme.of(context).colorScheme.primaryVariant,
            : Theme.of(context).colorScheme.onSecondary,

        shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? smallBoxCornerRadius),
        textStyle: textStyle ?? Theme.of(context).textTheme.button,
        // onPrimary: Theme.of(context).colorScheme.onSecondary,
        // elevation: 2.0,
        // minimumSize: Size(width(context), height(context) * 0.08),
      ),
      child: FittedBox(
          child: Text(text, style: textStyle ?? textTheme(context).button)),
    );
  }
}