import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_date_picker/cubit/date_cubit.dart';
import 'package:simple_date_picker/model/date.dart';
import 'package:simple_date_picker/widget/simple_year_month_day_picker_widget.dart';

Future<void> showSimpleYearMonthDayPicker(BuildContext context, Color barrierColor, StreamController yearMonthDayController, DateTime yearMonthDayDateTime) async {
  await showCupertinoModalPopup(
    context: context,
    barrierColor: barrierColor,
    builder: (context) {
      return BlocProvider(create: (context) => DateCubit(Date(dateTime: yearMonthDayDateTime)), child: SimpleYearMonthDayPickerWidget(controller: yearMonthDayController));
    },
  );
}
