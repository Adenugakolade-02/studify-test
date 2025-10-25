import 'package:intl/intl.dart';

extension DateTimeFormatting on DateTime {
  String toMonthDayYear() {
    return DateFormat('MMM d, y').format(this);
  }
}