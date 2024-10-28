
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_date_picker/cubit/date_cubit.dart';
import 'package:simple_date_picker/model/date.dart';
import 'package:simple_date_picker/widget/simple_year_picker_widget.dart';

Future<void> showSimpleYearPicker(
    BuildContext context, Color barrierColor, StreamController yearController, DateTime yearDateTime) async {
  await showCupertinoModalPopup(
    context: context,
    barrierColor: barrierColor,
    builder: (context) {
      return BlocProvider(
          create: (context) => DateCubit(Date(dateTime: yearDateTime)),
          child: BlocBuilder<DateCubit, Date>(
            builder: (context, state) {
              return SimpleYearPickerWidget(controller: yearController,);
            }
          ));
    },
  );
}
