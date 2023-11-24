import 'package:intl/intl.dart';

import 'package:timeago/timeago.dart' as timeago;

class SimpleFormaters {
  static String getTime(int day) {
//TODO: fixx current time issue
    // final currentTime = DateTime.now().microsecond;
    // final newDay = currentTime - day;

    final fifteenAgo = DateTime.fromMillisecondsSinceEpoch(day);
    final time = timeago.format(fifteenAgo, locale: 'en_short');

    // Log.d(_tag, "The time is $time");
    final formatedTime = time == "now" ? time + "." : time + " ago.";
    return formatedTime;
  }

  static String dateformatString(int millisecounds) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(millisecounds);

    final format = DateFormat("dd/MMM/yyyy");
    final dateString = format.format(date);
    return dateString;
  }

  static int getCurrentTime() {
    return DateTime.now().millisecondsSinceEpoch;
  }

  /// helper funtions to convert date in millisecounds to string with a specified format e.g {"dd/MMM/yyyy"}
  static String dateWithFormatToString(
      {required int millisecounds, required String format}) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(millisecounds);

    final formated = DateFormat(format);
    final dateString = formated.format(date);
    return dateString;
  }

  static String timeFormatString(int millisecounds) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(millisecounds);

    final format = DateFormat("h:m a");
    final dateString = format.format(date);
    return dateString;
  }

  static String stringformatTime(String time) {
    DateTime date = DateTime.parse(time);

    final format = DateFormat("h:m a");
    final dateString = format.format(date);
    return dateString;
  }
}

const _tag = "SimpleFormaters";

extension StringExtension on String {
  String capitalizeFirstLetter() {
    if (isEmpty) {
      return "";
    }
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}
