import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_date_picker/cubit/date_cubit.dart';
import 'package:simple_date_picker/model/date.dart';
import 'package:simple_date_picker/widget/custom_cupertino_picker.dart';

class SimpleYearPickerWidget extends StatefulWidget {
  final StreamController controller;
  final int firstYear;
  final int lastYear;
  final Color? barrierColor;
  final Decoration? decoration;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final double? yearWidth;
  final double? yearHeight;
  final Decoration? pickerDecoration;
  final Color pickerBackgroundColor;
  final double itemHeight;
  final Alignment textAlignment;
  final TextStyle? textStyle;
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

  SimpleYearPickerWidget({
    super.key,
    required this.controller,
    this.firstYear = 1900,
    this.lastYear = 2100,
    this.barrierColor,
    this.decoration,
    this.padding = EdgeInsets.zero,
    this.width = 370,
    this.height = 310,
    this.yearWidth,
    this.yearHeight = 250,
    this.pickerDecoration,
    this.pickerBackgroundColor = Colors.white,
    this.itemHeight = 60,
    this.textAlignment = Alignment.center,
    this.textStyle,
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
  State<SimpleYearPickerWidget> createState() => _SimpleYearPickerWidgetState();
}

class _SimpleYearPickerWidgetState extends State<SimpleYearPickerWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DateCubit, Date>(builder: (context, state) {
      int selectedYear = state.dateTime.year;
      int yearIndex = selectedYear - widget.firstYear;
      FixedExtentScrollController yearController =
      FixedExtentScrollController(initialItem: yearIndex);
      return Center(
        child: Container(
          width: widget.width,
          height: widget.height,
          padding: widget.padding,
          decoration: widget.decoration,
          child: Column(
            children: [
              SizedBox(
                width: widget.yearWidth,
                height: widget.yearHeight,
                child: CustomCupertinoPicker(
                  // year
                  decoration: widget.pickerDecoration,
                  backgroundColor: widget.pickerBackgroundColor,
                  itemExtent: widget.itemHeight,
                  controller: yearController,
                  onChangedCallback: (int index) {
                    selectedYear = widget.firstYear + index;
                    context.read<DateCubit>().updateYear(selectedYear);
                    widget.controller.add(DateTime(selectedYear));
                  },
                  dateTimeList: List.generate(
                    widget.lastYear - widget.firstYear + 1,
                        (index) {
                      return Align(
                        alignment: widget.textAlignment,
                        child: Text(
                          '${widget.firstYear + index}',
                          style: widget.textStyle,
                        ),
                      );
                    },
                  ),
                ),
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
                        yearController
                            .jumpToItem(DateTime
                            .now()
                            .year - widget.firstYear);
                      },
                    ),
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

  @override
  void dispose() {
    widget.controller.close();
    super.dispose();
  }
}
