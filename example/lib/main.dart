import 'package:example/utils/safe_area_height.dart';
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(widget.appBarHeight),
          child: AppBar(
            title: const Align(
              alignment: Alignment.center,
              child: Text('SIMPLE DATE PICKER DEMO'),
            ),
          )),
      body: SizedBox(
        height: safeAreaHeight(context) - widget.appBarHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Align(
              alignment: Alignment.center,
              child: TextButton(
                  onPressed: () async {
                    await showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
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
                          lastYear: 2050,
                        );
                      },
                    );
                  },
                  child: Text(
                    '${yearMonthDayDateTime.year}년 ${yearMonthDayDateTime.month}월 ${yearMonthDayDateTime.day}일',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  )),
            ),
            const Text(
              'YEAR MONTH DAY PICKER',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 20),
            ),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                  onPressed: () async {
                    await showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
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
                          lastYear: 2050,
                        );
                      },
                    );
                  },
                  child: Text(
                    '${yearMonthDateTime.year}년 ${yearMonthDateTime.month}월',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  )),
            ),
            const Text(
              'YEAR MONTH PICKER',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 20),
            ),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                  onPressed: () async {
                    await showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return simpleDatePicker.yearPicker(
                          yearDateTime: yearDateTime,
                          yearCallback: (int index) {
                            setState(() {
                              yearDateTime = DateTime(firstYear + index);
                            });
                          },
                          firstYear: firstYear,
                          lastYear: 2050,
                        );
                      },
                    );
                  },
                  child: Text(
                    '${yearDateTime.year}년',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  )),
            ),
            const Text(
              'YEAR PICKER',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 20),
            ),
          ],
        ),
      ),
    ));
  }
}
