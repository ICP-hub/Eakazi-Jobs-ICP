import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:eakazijobs/features/shared_widgets/svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/assets/icon_constans.dart';
import '../../constants/theme/color_selection.dart';
import '../../helpers/theme/theme.dart';
import '../../helpers/utils/utils.dart';

class CustomDropdownButton extends StatelessWidget {
  final String hint;
  final String? value;
  final List<String> dropdownItems;
  final ValueChanged<String?>? onChanged;
  final DropdownButtonBuilder? selectedItemBuilder;
  final Alignment? hintAlignment;
  final Alignment? valueAlignment;
  final double? buttonHeight, buttonWidth;
  final EdgeInsetsGeometry? buttonPadding;
  final BoxDecoration? buttonDecoration;
  final int? buttonElevation;
  final Widget? icon;
  final double? iconSize;
  final Color? iconEnabledColor;
  final Color? iconDisabledColor;
  final double? itemHeight;
  final EdgeInsetsGeometry? itemPadding;
  final double? dropdownHeight, dropdownWidth;
  final EdgeInsetsGeometry? dropdownPadding;
  final BoxDecoration? dropdownDecoration;
  final int? dropdownElevation;
  final Radius? scrollbarRadius;
  final double? scrollbarThickness;
  final bool? scrollbarAlwaysShow;
  final Offset? offset;
  final Color? buttonTextColor;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final EdgeInsetsGeometry? conttentPadding;
  final EdgeInsetsGeometry? iconPadding;
  final BorderRadius? borderRadius;

  const CustomDropdownButton({
    required this.hint,
    required this.value,
    required this.dropdownItems,
    required this.onChanged,
    this.selectedItemBuilder,
    this.hintAlignment,
    this.valueAlignment,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonPadding,
    this.buttonDecoration,
    this.buttonElevation,
    this.icon,
    this.iconSize,
    this.iconEnabledColor,
    this.iconDisabledColor,
    this.itemHeight,
    this.itemPadding,
    this.dropdownHeight,
    this.dropdownWidth,
    this.dropdownPadding,
    this.dropdownDecoration,
    this.dropdownElevation,
    this.scrollbarRadius,
    this.scrollbarThickness,
    this.scrollbarAlwaysShow,
    this.offset,
    this.buttonTextColor,
    Key? key,
    this.validator,
    this.onSaved,
    this.conttentPadding,
    this.iconPadding,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField2(
        //To avoid long text overflowing.
        onSaved: onSaved,
        validator: validator,
        isExpanded: true,
        hint: Container(
          margin: selectedItemBuilder == null
              ? null
              : const EdgeInsets.only(top: 10),
          alignment: hintAlignment,
          child: Text(
            hint,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: textTheme(context)
                .caption
                ?.copyWith(color: ColorsConst.blackThree),
          ),
        ),
        value: value,
        // focusColor: Colors.red,
        items: dropdownItems
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Container(
                    alignment: valueAlignment,
                    child: Text(
                      item,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: textTheme(context)
                          .caption
                          ?.copyWith(color: ColorsConst.blackThree),
                    ),
                  ),
                ))
            .toList(),
        onChanged: onChanged,
        selectedItemBuilder: selectedItemBuilder,

        icon: Padding(
          padding: iconPadding ?? const EdgeInsets.all(0),
          child: SvgPicture.asset(
            IconsAssets.dropdown,
            // color: activeColor,
            semanticsLabel: 'dropdown',
          ),
        ),
        iconSize: iconSize ?? 12,
        iconEnabledColor: iconEnabledColor,
        iconDisabledColor: iconDisabledColor,
        buttonHeight: buttonHeight ?? 50,
        buttonWidth: width(context),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        buttonPadding:
            buttonPadding ?? const EdgeInsets.only(left: 14, right: 14),
        // buttonDecoration: buttonDecoration ??
        //     BoxDecoration(
        //       // color: Colors.red,
        //       borderRadius: miniBoxCornerRadius,
        //       border: Border.all(
        //         color: ColorsConst.blackFive,
        //       ),
        //     ),
        decoration: InputDecoration(
          //Add isDense true and zero Padding.
          //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
          // isDense: true,
          contentPadding: conttentPadding ?? const EdgeInsets.all(0),
          isCollapsed: true,
          // constraints: BoxConstraints.expand(),
          filled: true,
          fillColor: ColorsConst.blackSix,
          errorStyle: textTheme(context)
              .caption
              ?.copyWith(color: colorScheme(context).error),
          // errorText: "Category can not be null",
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: borderRadius ?? miniBoxCornerRadius,
              borderSide:
                  BorderSide(color: colorScheme(context).error, width: 1)),
          errorBorder: OutlineInputBorder(
              borderRadius: borderRadius ?? miniBoxCornerRadius,
              borderSide:
                  BorderSide(color: colorScheme(context).error, width: 1)),
          enabledBorder: OutlineInputBorder(
              borderRadius: borderRadius ?? miniBoxCornerRadius,
              borderSide: BorderSide(
                // variant: colorScheme(context).secondaryVariant,
                  color: colorScheme(context).secondary, width: 1)),
          hintText: "000000\n0",
          focusedBorder: OutlineInputBorder(
              borderRadius: borderRadius ?? miniBoxCornerRadius,
              borderSide:
                  const BorderSide(color: ColorsConst.blackFive, width: 1)),
        ),

        itemHeight: itemHeight ?? 40,
        // style: ,
        itemPadding:
            itemPadding ?? const EdgeInsets.only(left: 20, right: 14, top: 16),
        //Max height for the dropdown menu & becoming scrollable if there are more items. If you pass Null it will take max height possible for the items.
        dropdownMaxHeight: dropdownHeight ?? 200,

        dropdownWidth: dropdownWidth,

        dropdownPadding: const EdgeInsets.only(left: 10, right: 10),
        dropdownDecoration: dropdownDecoration ??
            BoxDecoration(
              // color: Colors.redAccent,
              borderRadius: BorderRadius.circular(10),
            ),

        dropdownElevation: dropdownElevation ?? 8,
        scrollbarRadius: scrollbarRadius ?? const Radius.circular(40),
        scrollbarThickness: scrollbarThickness,
        scrollbarAlwaysShow: scrollbarAlwaysShow,
        //Null or Offset(0, 0) will open just under the button. You can edit as you want.
        offset: offset,
        dropdownOverButton: false, //Default is false to show menu below button
      ),
    );
  }
}

// (context) {
//           return dropdownItems
//               .map((e) => Padding(
//                     padding: const EdgeInsets.only(top: 6),
//                     child: Text(
//                       e,
//                       style: textTheme(context)
//                           .caption
//                           ?.copyWith(color: colorScheme(context).onError),
//                     ),
//                   ))
//               .toList();
//         },

class CustomDropdownButton2 extends StatelessWidget {
  final String hint;
  final String? value;
  final List<String> dropdownItems;
  final ValueChanged<String?>? onChanged;
  final DropdownButtonBuilder? selectedItemBuilder;
  final Alignment? hintAlignment;
  final Alignment? valueAlignment;
  final double? buttonHeight, buttonWidth;
  final EdgeInsetsGeometry? buttonPadding;
  final BoxDecoration? buttonDecoration;
  final int? buttonElevation;
  final Widget? icon;
  final double? iconSize;
  final Color? iconEnabledColor;
  final Color? iconDisabledColor;
  final double? itemHeight;
  final EdgeInsetsGeometry? itemPadding;
  final double? dropdownHeight, dropdownWidth;
  final EdgeInsetsGeometry? dropdownPadding;
  final BoxDecoration? dropdownDecoration;
  final int? dropdownElevation;
  final Radius? scrollbarRadius;
  final double? scrollbarThickness;
  final bool? scrollbarAlwaysShow;
  final Offset? offset;
  final Color? buttonTextColor;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final EdgeInsetsGeometry? conttentPadding;
  final EdgeInsetsGeometry? iconPadding;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;

  const CustomDropdownButton2({
    required this.hint,
    required this.value,
    required this.dropdownItems,
    required this.onChanged,
    this.selectedItemBuilder,
    this.hintAlignment,
    this.valueAlignment,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonPadding,
    this.buttonDecoration,
    this.buttonElevation,
    this.icon,
    this.iconSize,
    this.iconEnabledColor,
    this.iconDisabledColor,
    this.itemHeight,
    this.itemPadding,
    this.dropdownHeight,
    this.dropdownWidth,
    this.dropdownPadding,
    this.dropdownDecoration,
    this.dropdownElevation,
    this.scrollbarRadius,
    this.scrollbarThickness,
    this.scrollbarAlwaysShow,
    this.offset,
    this.buttonTextColor,
    Key? key,
    this.validator,
    this.onSaved,
    this.conttentPadding,
    this.iconPadding,
    this.hintStyle,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField2<String>(
        //To avoid long text overflowing.
        onSaved: onSaved,
        validator: validator,
        isExpanded: true,
        hint: Container(
          margin: selectedItemBuilder == null
              ? null
              : const EdgeInsets.only(top: 0),
          alignment: hintAlignment,
          child: Text(
            hint,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: hintStyle ??
                textTheme(context).caption?.copyWith(
                    color: colorScheme(context).secondary.withOpacity(0.3)),
          ),
        ),
        value: value,
        // focusColor: Colors.red,
        items: dropdownItems
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Container(
                    // margin: EdgeInsets.only(left: 10),
                    alignment: valueAlignment,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: textStyle ??
                              textTheme(context)
                                  .caption
                                  ?.copyWith(color: ColorsConst.blackThree),
                        ),
                      ],
                    ),
                  ),
                ))
            .toList(),
        onChanged: onChanged,
        selectedItemBuilder: selectedItemBuilder,
        icon: SvgIcon(IconsAssets.dropDown),
        // icon: Padding(
        //   padding: iconPadding ?? const EdgeInsets.all(0),
        //   child: SvgPicture.asset(
        //     IconsAssets.dropdown,
        //     // color: activeColor,
        //     semanticsLabel: 'dropdown',
        //   ),
        // ),
        iconSize: iconSize ?? 12,
        iconEnabledColor: iconEnabledColor,

        // iconOnClick: (){},
        iconDisabledColor: iconDisabledColor,
        buttonHeight: 64,
        buttonWidth: width(context),
        autovalidateMode: AutovalidateMode.onUserInteraction,

        buttonPadding:
            buttonPadding ?? const EdgeInsets.only(left: 16, right: 15, top: 0),
        // buttonDecoration: buttonDecoration ??
        //     BoxDecoration(
        //       // color: Colors.red,
        //       borderRadius: miniBoxCornerRadius,
        //       border: Border.all(
        //         color: ColorsConst.blackFive,
        //       ),
        //     ),
        decoration: InputDecoration(
          //Add isDense true and zero Padding.
          //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
          // isDense: true,
          // contentPadding: const EdgeInsets.only(
          //     // left: 19.0,
          //     bottom: 22.0,
          //     top: 10),

          isCollapsed: true,

          // constraints: BoxConstraints.expand(),
          fillColor: ColorsConst.blackSix.withOpacity(0.7),
          filled: true,
          errorStyle: textTheme(context)
              .caption
              ?.copyWith(color: colorScheme(context).error),
          // errorText: "Category can not be null",
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: miniBoxCornerRadius,
            borderSide: BorderSide(color: colorScheme(context).error, width: 1),
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: smallBoxCornerRadius,
              borderSide:
                  BorderSide(color: colorScheme(context).error, width: 1)),
          enabledBorder: OutlineInputBorder(
              borderRadius: smallBoxCornerRadius,
              borderSide: BorderSide(
                  color: ColorsConst.blackSix.withOpacity(0.7), width: 1)),
          hintText: "",
          focusedBorder: OutlineInputBorder(
              borderRadius: smallBoxCornerRadius,
              borderSide: BorderSide(
                  color: ColorsConst.blackSix.withOpacity(0.7), width: 1)),

          // errorText: "faliure",
        ),

        itemHeight: itemHeight ?? 40,

        // style: ,
        itemPadding:
            itemPadding ?? const EdgeInsets.only(left: 20, right: 0, top: 0),
        //Max height for the dropdown menu & becoming scrollable if there are more items. If you pass Null it will take max height possible for the items.
        dropdownMaxHeight: dropdownHeight ?? 200,

        dropdownWidth: dropdownWidth,

        dropdownPadding: const EdgeInsets.only(left: 0, right: 10),
        dropdownDecoration: dropdownDecoration ??
            BoxDecoration(
              // color: Colors.redAccent,
              color: ColorsConst.blackSix.withOpacity(0.88),
              borderRadius: BorderRadius.circular(5),
            ),

        dropdownElevation: dropdownElevation ?? 8,

        scrollbarRadius: scrollbarRadius ?? const Radius.circular(0),
        scrollbarThickness: scrollbarThickness,
        scrollbarAlwaysShow: scrollbarAlwaysShow,
        //Null or Offset(0, 0) will open just under the button. You can edit as you want.
        offset: offset,
        dropdownOverButton: false, //Default is false to show menu below button
      ),
    );
  }
}

class CustomDropdownButton3 extends StatelessWidget {
  final String hint;
  final String? value;
  final List<String> dropdownItems;
  final ValueChanged<String?>? onChanged;
  final DropdownButtonBuilder? selectedItemBuilder;
  final Alignment? hintAlignment;
  final Alignment? valueAlignment;
  final double? buttonHeight, buttonWidth;
  final EdgeInsetsGeometry? buttonPadding;
  final BoxDecoration? buttonDecoration;
  final int? buttonElevation;
  final Widget? icon;
  final double? iconSize;
  final Color? iconEnabledColor;
  final Color? iconDisabledColor;
  final double? itemHeight;
  final EdgeInsetsGeometry? itemPadding;
  final double? dropdownHeight, dropdownWidth;
  final EdgeInsetsGeometry? dropdownPadding;
  final BoxDecoration? dropdownDecoration;
  final int? dropdownElevation;
  final Radius? scrollbarRadius;
  final double? scrollbarThickness;
  final bool? scrollbarAlwaysShow;
  final Offset? offset;
  final Color? buttonTextColor;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final EdgeInsetsGeometry? conttentPadding;
  final EdgeInsetsGeometry? iconPadding;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;

  const CustomDropdownButton3({
    required this.hint,
    required this.value,
    required this.dropdownItems,
    required this.onChanged,
    this.selectedItemBuilder,
    this.hintAlignment,
    this.valueAlignment,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonPadding,
    this.buttonDecoration,
    this.buttonElevation,
    this.icon,
    this.iconSize,
    this.iconEnabledColor,
    this.iconDisabledColor,
    this.itemHeight,
    this.itemPadding,
    this.dropdownHeight,
    this.dropdownWidth,
    this.dropdownPadding,
    this.dropdownDecoration,
    this.dropdownElevation,
    this.scrollbarRadius,
    this.scrollbarThickness,
    this.scrollbarAlwaysShow,
    this.offset,
    this.buttonTextColor,
    Key? key,
    this.validator,
    this.onSaved,
    this.conttentPadding,
    this.iconPadding,
    this.hintStyle,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField2<String>(
          //To avoid long text overflowing.
          onSaved: onSaved,
          validator: validator,
          isExpanded: true,
          hint: Container(
            margin: selectedItemBuilder == null
                ? null
                : const EdgeInsets.only(top: 0),
            alignment: hintAlignment,
            child: Text(
              hint,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: hintStyle ??
                  textTheme(context).caption?.copyWith(
                      color: colorScheme(context).secondary.withOpacity(0.3)),
            ),
          ),
          value: value,
          // customItemsHeights: [100, 100],
          // focusColor: Colors.red,
          items: dropdownItems
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Container(
                      // margin: EdgeInsets.only(left: 10),
                      alignment: valueAlignment,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: textStyle ??
                                textTheme(context)
                                    .caption
                                    ?.copyWith(color: ColorsConst.blackThree),
                          ),
                        ],
                      ),
                    ),
                  ))
              .toList(),
          onChanged: onChanged,
          selectedItemBuilder: selectedItemBuilder,
          icon: SvgIcon(IconsAssets.dropDown),
          // icon: Padding(
          //   padding: iconPadding ?? const EdgeInsets.all(0),
          //   child: SvgPicture.asset(
          //     IconsAssets.dropdown,
          //     // color: activeColor,
          //     semanticsLabel: 'dropdown',
          //   ),
          // ),
          iconSize: iconSize ?? 12,
          iconEnabledColor: iconEnabledColor,

          // iconOnClick: (){},
          iconDisabledColor: iconDisabledColor,
          buttonHeight: 50,
          buttonWidth: width(context),
          autovalidateMode: AutovalidateMode.onUserInteraction,

          buttonPadding: buttonPadding ??
              const EdgeInsets.only(left: 16, right: 15, top: 0),
          // buttonDecoration: buttonDecoration ??
          //     BoxDecoration(
          //       // color: Colors.red,
          //       borderRadius: miniBoxCornerRadius,
          //       border: Border.all(
          //         color: ColorsConst.blackFive,
          //       ),
          //     ),
          decoration: InputDecoration(
            //Add isDense true and zero Padding.
            //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
            // isDense: true,
            // contentPadding: const EdgeInsets.only(
            //     // left: 19.0,
            //     bottom: 0
            //     top: 10),

            isCollapsed: true,

            // constraints: BoxConstraints.expand(),
            fillColor: ColorsConst.blackSix.withOpacity(0.7),
            // filled: true,
            errorStyle: textTheme(context)
                .caption
                ?.copyWith(color: colorScheme(context).error),
            // errorText: "Category can not be null",
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: miniBoxCornerRadius,
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
                    color: ColorsConst.dropDownBorderColor, width: 1)),
            hintText: "",
            focusedBorder: OutlineInputBorder(
                borderRadius: smallBoxCornerRadius,
                borderSide: BorderSide(
                    color: ColorsConst.dropDownBorderColor, width: 1)),

            // errorText: "faliure",
          ),

          itemHeight: itemHeight ?? 40,

          // style: ,
          itemPadding:
              itemPadding ?? const EdgeInsets.only(left: 20, right: 0, top: 0),
          //Max height for the dropdown menu & becoming scrollable if there are more items. If you pass Null it will take max height possible for the items.
          dropdownMaxHeight: dropdownHeight ?? 200,

          dropdownWidth: dropdownWidth,

          dropdownPadding: const EdgeInsets.only(left: 0, right: 10),
          dropdownDecoration: dropdownDecoration ??
              BoxDecoration(
                // color: Colors.redAccent,
                // color: ColorsConst.blackSix.withOpacity(0.88),
                borderRadius: BorderRadius.circular(5),
              ),

          dropdownElevation: dropdownElevation ?? 8,

          scrollbarRadius: scrollbarRadius ?? const Radius.circular(0),
          scrollbarThickness: scrollbarThickness,
          scrollbarAlwaysShow: scrollbarAlwaysShow,
          //Null or Offset(0, 0) will open just under the button. You can edit as you want.
          offset: offset,
          // buttonElevation: 10,
          dropdownOverButton:
              false, //Default is false to show menu below button
        ),
      ),
    );
  }
}
