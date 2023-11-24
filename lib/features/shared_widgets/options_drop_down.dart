import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helpers/theme/theme.dart';
import '../../helpers/utils/utils.dart';
import 'custom_drop_down.dart';

typedef ValidatorCallBAck = String? Function(String?)?;

class ServiceDropDown extends StatefulWidget {
  const ServiceDropDown({
    Key? key,
    required this.services,
    this.validator,
    required this.onSaved,
    this.hint = 'sign up as ',
  }) : super(key: key);

  final List<String> services;
  final String? Function(String?)? validator;
  final void Function(String?) onSaved;
  final String hint;
  @override
  State<ServiceDropDown> createState() => _ServiceDropDownState();
}

class _ServiceDropDownState extends State<ServiceDropDown> {
  String? selectedValue;
  // List<String> items = [
  //   'Item1',
  //   'Item2',
  //   'Item3',
  //   'Item4',
  //   'Item5',
  //   'Item6',
  //   'Item7',
  //   'Item8',
  // ];

  @override
  Widget build(BuildContext context) {
    // Log.d("serviceInfoOne", "lists ${widget.services}");
    // final ctrl = Get.find<BookingCtrl>();
    // Log.d("serviceInfoOne", "lists ${ctrl.services}");
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: CustomDropdownButton2(
        // validator: widget.validator,
        onSaved: widget.onSaved,
        hint: widget.hint,
        dropdownElevation: 1,
        // icon: Icon(
        //   Icons.arrow_drop_down,
        //   size: 20,
        // ),
        iconSize: 22,

        dropdownItems: widget.services,
        offset: const Offset(0, -30),
        value: selectedValue,
        onChanged: (value) {
          setState(() {
            print("value tapped");
            selectedValue = value as String;
          });
        },
      ),
    );
  }
}

class PostJobsDropDown extends StatefulWidget {
  const PostJobsDropDown({
    Key? key,
    required this.services,
    this.validator,
    required this.onSaved,
    this.hint = 'sign up as ',
  }) : super(key: key);

  final List<String> services;
  final String? Function(String?)? validator;
  final void Function(String?) onSaved;
  final String hint;
  @override
  State<PostJobsDropDown> createState() => _PostJobsDropDownState();
}

class _PostJobsDropDownState extends State<PostJobsDropDown> {
  String? selectedValue;
  // List<String> items = [
  //   'Item1',
  //   'Item2',
  //   'Item3',
  //   'Item4',
  //   'Item5',
  //   'Item6',
  //   'Item7',
  //   'Item8',
  // ];

  @override
  Widget build(BuildContext context) {
    // Log.d("serviceInfoOne", "lists ${widget.services}");
    // final ctrl = Get.find<BookingCtrl>();
    // Log.d("serviceInfoOne", "lists ${ctrl.services}");
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: CustomDropdownButton2(
        // validator: widget.validator,
        onSaved: widget.onSaved,
        hint: widget.hint,
        dropdownElevation: 1,
        // icon: Icon(
        //   Icons.arrow_drop_down,
        //   size: 20,
        // ),
        iconSize: 22,

        dropdownItems: widget.services,
        offset: const Offset(0, -30),
        hintStyle: extraTheme.copyWith(
            color: colorScheme(context).secondary.withOpacity(0.3),
            fontSize: 18),
        textStyle: extraTheme.copyWith(
            color: colorScheme(context).secondary, fontSize: 18),
        value: selectedValue,
        onChanged: (value) {
          setState(() {
            print("value tapped");
            selectedValue = value as String;
          });
        },
      ),
    );
  }
}

class WalletsDropDown extends StatefulWidget {
  const WalletsDropDown({
    Key? key,
    required this.services,
    this.validator,
    required this.onSaved,
    this.hint = 'sign up as ',
    this.newValue,
  }) : super(key: key);

  final List<String> services;
  final String? Function(String?)? validator;
  final void Function(String?) onSaved;
  final void Function(String?)? newValue;
  final String hint;
  @override
  State<WalletsDropDown> createState() => _WalletsDropDownState();
}

class _WalletsDropDownState extends State<WalletsDropDown> {
  String? selectedValue;
  // List<String> items = [
  //   'Item1',
  //   'Item2',
  //   'Item3',
  //   'Item4',
  //   'Item5',
  //   'Item6',
  //   'Item7',
  //   'Item8',
  // ];

  @override
  Widget build(BuildContext context) {
    // Log.d("serviceInfoOne", "lists ${widget.services}");
    // final ctrl = Get.find<BookingCtrl>();
    // Log.d("serviceInfoOne", "lists ${ctrl.services}");
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: CustomDropdownButton3(
        // validator: widget.validator,
        onSaved: widget.onSaved,
        hint: widget.hint,
        dropdownElevation: 1,
        // icon: Icon(
        //   Icons.arrow_drop_down,
        //   size: 20,
        // ),
        iconSize: 22,

        dropdownItems: widget.services,
        offset: const Offset(0, -10),
        hintStyle: textTheme(context)
            .subtitle2
            ?.copyWith(color: Colors.black.withOpacity(0.4)),

        textStyle: textTheme(context).subtitle2,
        value: selectedValue,
        onChanged: (value) {
          if (widget.newValue != null) {
            widget.newValue!(value);
          }

          setState(() {
            print("value tapped $value");
            selectedValue = value as String;
          });
        },
      ),
    );
  }
}
