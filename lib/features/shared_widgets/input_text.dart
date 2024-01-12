import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../constants/assets/icon_constans.dart';
import '../../constants/theme/color_selection.dart';
// import '../../helper/theme/theme.dart';
import '../../helpers/theme/theme.dart';
import '../../helpers/utils/utils.dart';
import 'svgs.dart';
import 'widget_helper/input_text_helper.dart';

typedef SaveCallBack = void Function(String? value);
typedef ValidateCallBack = String? Function(String? value);

const inputTextHeight = 50.0;

//TODO: when editing is true add an elevation in the focusedBorder

class InputTextNormal extends StatelessWidget {
  final String hintText;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  // final TextEditingController controller;
  final Function(String?)? onSave;
  final String? Function(String?)? validator;

  const InputTextNormal({
    Key? key,
    required this.hintText,
    required this.textInputAction,
    required this.keyboardType,
    // this.controller,
    this.onSave,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // controller: controller,
      onSaved: onSave,
      validator: validator,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
        decoration: InputTExtxHelper(context, hintText, 14.0).decoration2(),
    );
  }
}

class InputTextNormal2 extends StatelessWidget {
  final String hintText;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;

  // final TextEditingController controller;
  //TODO: learn how to use voidcallback here
  final dynamic onSave;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final AutovalidateMode? autovalidateMode;
  const InputTextNormal2({
    Key? key,
    required this.hintText,
    required this.textInputAction,
    required this.keyboardType,
    this.onSave,
    this.validator,
    this.controller,
    this.autovalidateMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: TextFormField(
        // controller: controller,
        key: key,

        onChanged: (change) {},
        onSaved: onSave,
        validator: validator,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        autovalidateMode: autovalidateMode,
        controller: controller,
        style: extraTheme.copyWith(
            color: colorScheme(context).secondary, fontSize: 18),
        cursorColor: Colors.black,
        // style:
        //     textTheme(context).bodyText1?.copyWith(color: ColorConst.blackTwo),
        decoration: InputTExtxHelper(context, hintText, 18.0).decoration2(),
      ),
    );
  }
}

class InputTextNormal3 extends StatelessWidget {
  final String hintText;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;

  // final TextEditingController controller;
  //TODO: learn how to use voidcallback here
  final dynamic onSave;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final AutovalidateMode? autovalidateMode;
  const InputTextNormal3({
    Key? key,
    required this.hintText,
    required this.textInputAction,
    required this.keyboardType,
    this.onSave,
    this.validator,
    this.controller,
    this.autovalidateMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        // controller: controller,
        key: key,

        onChanged: (change) {},
        onSaved: onSave,
        validator: validator,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        autovalidateMode: autovalidateMode,
        controller: controller,
        style: textTheme(context).subtitle2,
        cursorColor: Colors.black,
        // style:
        //     textTheme(context).bodyText1?.copyWith(color: ColorConst.blackTwo),
        decoration: InputTExtxHelper(context, hintText, 18.0).decoration3(),
      ),
    );
  }
}

class InputTextArea extends StatelessWidget {
  final String hintText;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;

  // final TextEditingController controller;
  //TODO: learn how to use voidcallback here
  final dynamic onSave;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final AutovalidateMode? autovalidateMode;
  const InputTextArea({
    Key? key,
    required this.hintText,
    required this.textInputAction,
    required this.keyboardType,
    this.onSave,
    this.validator,
    this.controller,
    this.autovalidateMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 185,
      child: TextFormField(
        // controller: controller,
        key: key,

        maxLines: 14,

        onChanged: (change) {},
        onSaved: onSave,
        validator: validator,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        autovalidateMode: autovalidateMode,
        controller: controller,
        style: extraTheme.copyWith(
            color: colorScheme(context).secondary, fontSize: 18),
        cursorColor: Colors.black,
        // style:
        //     textTheme(context).bodyText1?.copyWith(color: ColorConst.blackTwo),
        decoration: InputTExtxHelper(context, hintText, 18.0).decoration2(),
      ),
    );
  }
}

class InputPasswordText extends StatelessWidget {
  final String hintText;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final AutovalidateMode? autovalidateMode;

  // final TextEditingController controller;
  //TODO: learn how to use voidcallback here
  final dynamic onSave;
  final String? Function(String?)? validator;
  const InputPasswordText({
    Key? key,
    required this.hintText,
    required this.textInputAction,
    required this.keyboardType,
    this.onSave,
    this.validator,
    this.controller,
    this.autovalidateMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isVissible = false.obs;
    return Obx(() => SizedBox(
        height: 64,
        child: TextFormField(
          // controller: controller,
          key: key,
          // maxLines: null,
          // minLines: null,
          // expands: true,
          onChanged: (change) {},
          onSaved: onSave,
          validator: validator,
          keyboardType: keyboardType,
          controller: controller,
          textInputAction: textInputAction,
          obscureText: !isVissible.value,
          cursorColor: Colors.black,
          autovalidateMode: autovalidateMode,
          // style:
          //     textTheme(context).bodyText1?.copyWith(color: ColorConst.blackTwo),
          decoration: InputDecoration(
            fillColor: ColorsConst.blackSix.withOpacity(0.7),
            filled: true,
            // errorStyle: const TextStyle(height: 64),

            // floatingLabelBehavior: FloatingLabelBehavior.auto,
            // labelText: hintText,
            // labelStyle:
            //     textTheme(context).caption?.copyWith(color: Colors.black),
            suffixIcon: isVissible.value
                ? IconButton(
                splashRadius: 0.1,
                onPressed: () {
                  isVissible.value = false;
                },
                icon: SvgIcon(
                  IconsAssets.visibility,
                ))
                : IconButton(
                splashRadius: 0.1,
                onPressed: () {
                  isVissible.value = true;
                },
                icon: SvgIcon(
                  IconsAssets.visibilityOff,
                )),

            // prefixIcon: Icon(Icons.email),
            // contentPadding: const EdgeInsets.only(
            //   // left: 19.0,
            //   top: 64.0,
            // ),

            // errorBorder: ,
            // prefix: const SizedBox(
            //   width: 19,
            // ),
            errorMaxLines: null,
            errorStyle: const TextStyle(fontSize: 0.01),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: smallBoxCornerRadius,
              borderSide:
              BorderSide(color: colorScheme(context).error, width: 1),
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: smallBoxCornerRadius,
                borderSide:
                BorderSide(color: colorScheme(context).error, width: 1)),
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
                color: colorScheme(context).secondary.withOpacity(0.3)),
          ),
        )));
  }
}