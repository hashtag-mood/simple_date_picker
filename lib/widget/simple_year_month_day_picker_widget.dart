import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_date_picker/widget/custom_cupertino_picker.dart';

class SimpleYearMonthDayPickerWidget extends StatefulWidget {
  final DateTime yearMonthDayDateTime;
  final Function(int) monthCallback;
  final Function(int) dayCallback;
  final Function(int) yearCallback;
  final int firstYear;
  final int lastYear;
  final Decoration? decoration;
  final bool looping;
  final EdgeInsetsGeometry padding;
  final double width;
  final double height;
  final double monthWidth;
  final double dayWidth;
  final double yearWidth;
  final double pickerHeight;
  final Decoration? pickerDecoration;
  final Color pickerBackgroundColor;
  final double itemHeight;
  final Alignment textAlignment;
  final TextStyle? monthTextStyle;
  final TextStyle? dayTextStyle;
  final TextStyle? yearTextStyle;
  final double buttonHeight;
  final double todayButtonWidth;
  final Color todayButtonColor;
  final Decoration? todayButtonDecoration;
  final String todayButtonText;
  final TextStyle todayButtonTextStyle;
  final double doneButtonWidth;
  final Color doneButtonColor;
  final Decoration? doneButtonDecoration;
  final String doneButtonText;
  final TextStyle doneButtonTextStyle;

  const SimpleYearMonthDayPickerWidget({
    super.key,
    required this.yearMonthDayDateTime,
    required this.monthCallback,
    required this.dayCallback,
    required this.yearCallback,
    this.firstYear = 1900,
    this.lastYear = 2100,
    this.decoration,
    this.looping = true,
    this.padding = EdgeInsets.zero,
    this.width = 400,
    this.height = 350,
    this.monthWidth = 110,
    this.dayWidth = 110,
    this.yearWidth = 150,
    this.pickerHeight = 250,
    this.pickerDecoration,
    this.pickerBackgroundColor = Colors.white,
    this.itemHeight = 60,
    this.textAlignment = Alignment.center,
    this.monthTextStyle,
    this.dayTextStyle,
    this.yearTextStyle,
    this.buttonHeight = 60,
    this.todayButtonWidth = 200,
    this.todayButtonColor = Colors.white,
    this.todayButtonDecoration,
    this.todayButtonText = 'TODAY',
    this.todayButtonTextStyle = const TextStyle(color: Colors.black),
    this.doneButtonWidth = 200,
    this.doneButtonColor = Colors.white,
    this.doneButtonDecoration,
    this.doneButtonText = 'DONE',
    this.doneButtonTextStyle = const TextStyle(color: Colors.black),
  });

  @override
  State<SimpleYearMonthDayPickerWidget> createState() => _SimpleYearMonthDayPickerWidgetState();
}

class _SimpleYearMonthDayPickerWidgetState extends State<SimpleYearMonthDayPickerWidget> {
  @override
  Widget build(BuildContext context) {
      int selectedMonth = widget.yearMonthDayDateTime.month;
      int selectedYear = widget.yearMonthDayDateTime.year;
      int selectedDay = widget.yearMonthDayDateTime.day;
      int yearIndex = selectedYear - widget.firstYear;
      FixedExtentScrollController yearController =
          FixedExtentScrollController(initialItem: yearIndex);
      FixedExtentScrollController monthController =
          FixedExtentScrollController(initialItem: selectedMonth - 1);
      FixedExtentScrollController dayController =
          FixedExtentScrollController(initialItem: selectedDay - 1);
      return Center(
        child: Container(
          width: widget.width,
          height: widget.height,
          padding: widget.padding,
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
                      looping: widget.looping,
                      backgroundColor: widget.pickerBackgroundColor,
                      itemExtent: widget.itemHeight,
                      controller: monthController,
                      onChangedCallback: widget.monthCallback,
                      dateTimeList: List.generate(
                        12,
                        (index) {
                          return Align(
                            alignment: widget.textAlignment,
                            child: Text(
                              '${index + 1}',
                              style: widget.monthTextStyle,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: widget.dayWidth,
                    height: widget.pickerHeight,
                    child: CustomCupertinoPicker(
                      // day
                      decoration: widget.pickerDecoration,
                      looping: widget.looping,
                      backgroundColor: widget.pickerBackgroundColor,
                      itemExtent: widget.itemHeight,
                      controller: dayController,
                      onChangedCallback: widget.dayCallback,
                      dateTimeList: List.generate(
                        31,
                        (index) {
                          return Align(
                            alignment: widget.textAlignment,
                            child: Text(
                              '${index + 1}',
                              style: widget.dayTextStyle,
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
                      looping: widget.looping,
                      backgroundColor: widget.pickerBackgroundColor,
                      itemExtent: widget.itemHeight,
                      controller: yearController,
                      onChangedCallback: widget.yearCallback,
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
                        yearController
                            .jumpToItem(DateTime.now().year - widget.firstYear);
                        monthController.jumpToItem(DateTime.now().month - 1);
                        dayController.jumpToItem(DateTime.now().day - 1);
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
  }
}
