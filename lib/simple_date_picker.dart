import 'dart:async';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:simple_date_picker/utils/simple_year_month_day_picker.dart';
import 'package:simple_date_picker/utils/simple_year_month_picker.dart';
import 'package:simple_date_picker/utils/simple_year_picker.dart';

export 'utils/simple_year_month_day_picker.dart';
export 'utils//simple_year_month_picker.dart';
export 'utils/simple_year_picker.dart';

class SimpleDatePicker {
  StreamController<DateTime> yearMonthDayController = StreamController<DateTime>();
  StreamController<DateTime> yearMonthController = StreamController<DateTime>();
  StreamController<DateTime> yearController = StreamController<DateTime>();

  DateTime yearMonthDayDateTime = DateTime.now();
  DateTime yearMonthDateTime = DateTime.now();
  DateTime yearDateTime = DateTime.now();

  (Function, Stream) yearPicker(
      {required final BuildContext context,
      final int firstYear = 1900,
      final int lastYear = 2100,
      final Color barrierColor = kCupertinoModalBarrierColor,
      final Decoration? decoration,
      final EdgeInsetsGeometry? padding,
      final double? width,
      final double? height,
      final double? yearWidth,
      final double? yearHeight,
      final Decoration? pickerDecoration,
      final Color? pickerBackgroundColor,
      final double? itemHeight,
      final Alignment? textAlignment,
      final TextStyle? textStyle,
      final double? buttonHeight,
      final double? todayButtonWidth,
        final Color? todayButtonColor,
      final Decoration? todayButtonDecoration,
      final String? todayButtonText,
      final TextStyle? todayButtonTextStyle,
      final double? doneButtonWidth,
        final Color? doneButtonColor,
        final Decoration? doneButtonDecoration,
      final String? doneButtonText,
      final TextStyle? doneButtonTextStyle}) {
    Stream<DateTime> broadcast = yearController.stream.asBroadcastStream();
    yearController.add(yearDateTime);
    broadcast.listen((data) {
      yearDateTime = data;
    });
    Future<void> pickerCallback() {
      return showSimpleYearPicker(
          context, barrierColor, yearController, yearDateTime);
    }
    return (pickerCallback, broadcast);
  }

  (Function, Stream) yearMonthPicker(
      {required final BuildContext context,
      final int firstYear = 1900,
      final int lastYear = 2100,
      final Color barrierColor = kCupertinoModalBarrierColor,
      final Decoration? decoration,
      final EdgeInsetsGeometry? padding,
      final double? width,
      final double? height,
      final double? monthWidth,
      final double? yearWidth,
      final double? pickerHeight,
      final Decoration? pickerDecoration,
      final Color? pickerBackgroundColor,
      final double? itemHeight,
      final Alignment? textAlignment,
      final TextStyle? monthTextStyle,
      final TextStyle? yearTextStyle,
      final double? buttonHeight,
      final double? todayButtonWidth,
        final Color? todayButtonColor,
      final Decoration? todayButtonDecoration,
      final String? todayButtonText,
      final TextStyle? todayButtonTextStyle,
      final double? doneButtonWidth,
        final Color? doneButtonColor,
        final Decoration? doneButtonDecoration,
      final String? doneButtonText,
      final TextStyle? doneButtonTextStyle}) {
    Stream<DateTime> broadcast = yearMonthController.stream.asBroadcastStream();
    yearMonthController.add(yearMonthDateTime);
    broadcast.listen((data) {
      yearMonthDateTime = data;
    });
    Future<void> pickerCallback() {
      return showSimpleYearMonthPicker(
          context, barrierColor, yearMonthController, yearMonthDateTime);
    }
    return (pickerCallback, broadcast);
  }

  (Function, Stream) yearMonthDayPicker(
      {required final BuildContext context,
      final int firstYear = 1900,
      final int lastYear = 2100,
      final Color barrierColor = kCupertinoModalBarrierColor,
      final Decoration? decoration,
      final EdgeInsetsGeometry? padding,
      final double? width,
      final double? height,
      final double? monthWidth,
      final double? dayWidth,
      final double? yearWidth,
      final double? pickerHeight,
      final Decoration? pickerDecoration,
      final Color? pickerBackgroundColor,
      final double? itemHeight,
      final Alignment? textAlignment,
      final TextStyle? monthTextStyle,
      final TextStyle? dayTextStyle,
      final TextStyle? yearTextStyle,
      final double? buttonHeight,
      final double? todayButtonWidth,
        final Color? todayButtonColor,
      final Decoration? todayButtonDecoration,
      final String? todayButtonText,
      final TextStyle? todayButtonTextStyle,
      final double? doneButtonWidth,
        final Color? doneButtonColor,
        final Decoration? doneButtonDecoration,
      final String? doneButtonText,
      final TextStyle? doneButtonTextStyle}) {
    Stream<DateTime> broadcast = yearMonthDayController.stream.asBroadcastStream();

    yearMonthDayController.add(yearMonthDayDateTime);
    broadcast.listen((data) {
      yearMonthDayDateTime = data;
    });
    Future<void> pickerCallback() {
      return showSimpleYearMonthDayPicker(
          context, barrierColor, yearMonthDayController, yearMonthDayDateTime);
    }
    return (pickerCallback, broadcast);
  }
}
