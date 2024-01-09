import 'package:flutter/material.dart';

/// height of the screen
double height(BuildContext context) => MediaQuery.of(context).size.height;
double width(BuildContext context) => MediaQuery.of(context).size.width;

ColorScheme colorScheme(BuildContext context) => Theme.of(context).colorScheme;
TextTheme textTheme(BuildContext context) => Theme.of(context).textTheme;
/// color scheme


