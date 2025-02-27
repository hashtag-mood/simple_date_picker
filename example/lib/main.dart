import 'package:example/theme.dart';
import 'package:example/utils/safe_area_height.dart';
import 'package:example/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_date_picker/simple_date_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final double appBarHeight;

  const MyHomePage({super.key, this.appBarHeight = 60});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SimpleDatePicker simpleDatePicker = SimpleDatePicker();
  DateTime yearMonthDayDateTime = DateTime.now();
  DateTime yearMonthDateTime = DateTime.now();
  DateTime yearDateTime = DateTime.now();
  int firstYear = 1950;
  int lastYear = 2050;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(widget.appBarHeight),
          child: AppBar(
            backgroundColor: Colors.white,
            title: const Align(
              alignment: Alignment.center,
              child: Text(
                'SIMPLE DATE PICKER DEMO',
                style: TextStyle(height: 1),
              ),
            ),
            shape: Border.symmetric(
              horizontal: BorderSide(),
            ),
          ),
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              datePickerWidget(
                  context: context,
                  barrierColor: Colors.transparent,
                  color: lightGreenColor,
                  containerBorder: Border(
                    bottom: BorderSide(),
                  ),
                  pickerTypeDescription: 'YEAR MONTH DAY PICKER',
                  pickerType: (context) {
                    return simpleDatePicker.yearMonthDayPicker(
                      yearMonthDayDateTime: yearMonthDayDateTime,
                      monthCallback: (int index) {
                        setState(() {
                          yearMonthDayDateTime = DateTime(
                              yearMonthDayDateTime.year,
                              index + 1,
                              yearMonthDayDateTime.day);
                        });
                      },
                      dayCallback: (int index) {
                        setState(() {
                          yearMonthDayDateTime = DateTime(
                              yearMonthDayDateTime.year,
                              yearMonthDayDateTime.month,
                              index + 1);
                        });
                      },
                      yearCallback: (int index) {
                        setState(() {
                          yearMonthDayDateTime = DateTime(
                              firstYear + index,
                              yearMonthDayDateTime.month,
                              yearMonthDayDateTime.day);
                        });
                      },
                      firstYear: firstYear,
                      lastYear: lastYear,
                      pickerBackgroundColor: lightGreenColor,
                      todayButtonColor: lightGreenColor,
                      doneButtonColor: lightGreenColor,
                      width: 402,
                      height: 312,
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      pickerDecoration: BoxDecoration(
                        border: Border.symmetric(
                          horizontal: BorderSide(),
                        ),
                      ),
                      todayButtonDecoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(),
                          right: BorderSide(),
                        ),
                      ),
                      doneButtonDecoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(),
                        ),
                      ),
                    );
                  },
                  dateTime:
                      '${yearMonthDayDateTime.year}년 ${yearMonthDayDateTime.month}월 ${yearMonthDayDateTime.day}일'),
              Expanded(
                child: SizedBox.shrink(),
              ),
              datePickerWidget(
                context: context,
                barrierColor: Colors.transparent,
                color: lightYellowColor,
                containerBorder: Border.symmetric(
                  horizontal: BorderSide(),
                ),
                pickerTypeDescription: 'YEAR MONTH PICKER',
                pickerType: (context) {
                  return simpleDatePicker.yearMonthPicker(
                    yearMonthDateTime: yearMonthDateTime,
                    monthCallback: (int index) {
                      setState(() {
                        yearMonthDateTime =
                            DateTime(yearMonthDateTime.year, index + 1);
                      });
                    },
                    yearCallback: (int index) {
                      setState(() {
                        yearMonthDateTime = DateTime(
                            firstYear + index, yearMonthDateTime.month);
                      });
                    },
                    firstYear: firstYear,
                    lastYear: lastYear,
                    pickerBackgroundColor: lightYellowColor,
                    todayButtonColor: lightYellowColor,
                    doneButtonColor: lightYellowColor,
                    width: 402,
                    height: 312,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    pickerDecoration: BoxDecoration(
                      border: Border.symmetric(
                        horizontal: BorderSide(),
                      ),
                    ),
                    todayButtonDecoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(),
                        top: BorderSide(),
                      ),
                    ),
                    doneButtonDecoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(),
                      ),
                    ),
                  );
                },
                dateTime:
                    '${yearMonthDateTime.year}년 ${yearMonthDateTime.month}월',
              ),
              datePickerWidget(
                context: context,
                barrierColor: Colors.transparent,
                color: lightPinkColor,
                containerBorder: Border(
                  bottom: BorderSide(),
                ),
                pickerTypeDescription: 'YEAR PICKER',
                pickerType: (context) {
                  return simpleDatePicker.yearPicker(
                    yearDateTime: yearDateTime,
                    yearCallback: (int index) {
                      setState(() {
                        yearDateTime = DateTime(firstYear + index);
                      });
                    },
                    firstYear: firstYear,
                    lastYear: lastYear,
                    pickerBackgroundColor: lightPinkColor,
                    todayButtonColor: lightPinkColor,
                    doneButtonColor: lightPinkColor,
                    width: 402,
                    height: 312,
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    pickerDecoration: BoxDecoration(
                      border: Border.symmetric(
                        horizontal: BorderSide(),
                      ),
                    ),
                    todayButtonDecoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(),
                        top: BorderSide(),
                      ),
                    ),
                    doneButtonDecoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(),
                      ),
                    ),
                  );
                },
                dateTime: '${yearDateTime.year}년',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
