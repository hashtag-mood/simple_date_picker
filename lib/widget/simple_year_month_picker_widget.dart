import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_date_picker/cubit/date_cubit.dart';
import 'package:simple_date_picker/model/date.dart';
import 'package:simple_date_picker/widget/custom_cupertino_picker.dart';

class SimpleYearMonthPickerWidget extends StatefulWidget {
  final StreamController controller;
  final int firstYear;
  final int lastYear;
  final Color barrierColor;
  final Decoration? decoration;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final double? monthWidth;
  final double? yearWidth;
  final double? pickerHeight;
  final Decoration? pickerDecoration;
  final Color pickerBackgroundColor;
  final double itemHeight;
  final Alignment textAlignment;
  final TextStyle? monthTextStyle;
  final TextStyle? yearTextStyle;
  final double buttonHeight;
  final double todayButtonWidth;
  final Color todayButtonColor;
  final Decoration? todayButtonDecoration;
  final String todayButtonText;
  final TextStyle? todayButtonTextStyle;
  final double doneButtonWidth;
  final Color doneButtonColor;
  final Decoration? doneButtonDecoration;
  final String doneButtonText;
  final TextStyle? doneButtonTextStyle;

  SimpleYearMonthPickerWidget({
    required this.controller,
    this.firstYear = 1900,
    this.lastYear = 2100,
    this.barrierColor = kCupertinoModalBarrierColor,
    this.decoration,
    this.padding = EdgeInsets.zero,
    this.width = 370,
    this.height = 310,
    this.monthWidth = 185,
    this.yearWidth = 185,
    this.pickerHeight = 250,
    this.pickerDecoration,
    this.pickerBackgroundColor = Colors.white,
    this.itemHeight = 60,
    this.textAlignment = Alignment.center,
    this.monthTextStyle,
    this.yearTextStyle,
    this.buttonHeight = 60,
    this.todayButtonWidth = 185,
    this.todayButtonColor = Colors.white,
    this.todayButtonDecoration,
    this.todayButtonText = 'TODAY',
    this.doneButtonWidth = 185,
    this.doneButtonColor = Colors.white,
    this.doneButtonDecoration,
    this.doneButtonText = 'DONE',
  })
      : todayButtonTextStyle = TextStyle(color: Colors.black),
        doneButtonTextStyle = TextStyle(color: Colors.black);

  @override
  State<SimpleYearMonthPickerWidget> createState() => _SimpleYearMonthPickerWidgetState();
}

class _SimpleYearMonthPickerWidgetState extends State<SimpleYearMonthPickerWidget> {
  List<String> months = [
    'JAN',
    'FEB',
    'MAR',
    'APR',
    'MAY',
    'JUN',
    'JUL',
    'AUG',
    'SEP',
    'OCT',
    'NOV',
    'DEC'
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DateCubit, Date>(builder: (context, state)
    {
      int selectedMonth = state.dateTime.month;
      int selectedYear = state.dateTime.year;
      int yearIndex = selectedYear - widget.firstYear;
      FixedExtentScrollController yearController =
      FixedExtentScrollController(initialItem: yearIndex);
      FixedExtentScrollController monthController =
      FixedExtentScrollController(initialItem: selectedMonth - 1);
      return Center(
        child: Container(
          width: widget.width,
          height: widget.height,
          decoration: widget.decoration,
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: widget.monthWidth,
                    height: widget.pickerHeight,
                    child: CustomCupertinoPicker(
                      // month
                      decoration: widget.pickerDecoration,
                      backgroundColor: widget.pickerBackgroundColor,
                      itemExtent: widget.itemHeight,
                      controller: monthController,
                      onChangedCallback: (int index) {
                        selectedMonth = index + 1;
                        context.read<DateCubit>().updateMonth(
                            selectedMonth);
                        widget.controller.add(DateTime(selectedYear, selectedMonth));
                      },
                      dateTimeList: List.generate(
                        12,
                            (index) {
                          return Align(
                            alignment: widget.textAlignment,
                            child: Text(
                              months[index],
                              style: widget.monthTextStyle,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: widget.yearWidth,
                    height: widget.pickerHeight,
                    child: CustomCupertinoPicker(
                      // year
                      decoration: widget.pickerDecoration,
                      backgroundColor: widget.pickerBackgroundColor,
                      itemExtent: widget.itemHeight,
                      controller: yearController,
                      onChangedCallback: (int index) {
                        selectedYear = widget.firstYear + index;
                        context.read<DateCubit>().updateYear(
                            selectedYear);
                        widget.controller.add(DateTime(selectedYear, selectedMonth));
                      },
                      dateTimeList: List.generate(
                        widget.lastYear - widget.firstYear + 1,
                            (index) {
                          return Align(
                            alignment: widget.textAlignment,
                            child: Text(
                              '${widget.firstYear + index}',
                              style: widget.yearTextStyle,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: widget.todayButtonWidth,
                    height: widget.buttonHeight,
                    decoration: widget.todayButtonDecoration,
                    child: CupertinoButton(
                        color: widget.todayButtonColor,
                        borderRadius: BorderRadius.zero,
                        child: Text(
                          widget.todayButtonText,
                          style: widget.todayButtonTextStyle,
                        ),
                        onPressed: () {
                          context
                              .read<DateCubit>()
                              .updateYear(DateTime
                              .now()
                              .year);
                          context
                              .read<DateCubit>()
                              .updateMonth(DateTime
                              .now()
                              .month);
                          yearController
                              .jumpToItem(DateTime
                              .now()
                              .year - widget.firstYear);
                          monthController
                              .jumpToItem(DateTime
                              .now()
                              .month - 1);
                        }),
                  ),
                  Container(
                    width: widget.doneButtonWidth,
                    height: widget.buttonHeight,
                    decoration: widget.doneButtonDecoration,
                    child: CupertinoButton(
                      color: widget.doneButtonColor,
                      borderRadius: BorderRadius.zero,
                      child: Text(
                        widget.doneButtonText,
                        style: widget.doneButtonTextStyle,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}