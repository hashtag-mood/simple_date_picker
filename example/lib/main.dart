import 'package:example/utils/date_format.dart';
import 'package:example/utils/safe_area_height.dart';
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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final double appBarHeight;

  MyHomePage({super.key, this.appBarHeight = 60});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SimpleDatePicker simpleDatePicker = SimpleDatePicker();
  (Function, Stream)? yearMonthDayRecord;
  (Function, Stream)? yearMonthRecord;
  (Function, Stream)? yearRecord;

  @override
  void initState() {
    super.initState();
    yearMonthDayRecord = simpleDatePicker.yearMonthDayPicker(
      context: context,
      barrierColor: Colors.transparent,
      firstYear: 1950,
      lastYear: 2050,
      todayButtonTextStyle: TextStyle(
        color: Colors.black,
      ),
    );
    yearMonthRecord = simpleDatePicker.yearMonthPicker(
      context: context,
      firstYear: 1950,
      lastYear: 2050,
      todayButtonDecoration: BoxDecoration(
        color: Colors.white,
      ),
      todayButtonTextStyle: TextStyle(
        color: Colors.black,
      ),
    );
    yearRecord = simpleDatePicker.yearPicker(
      context: context,
      firstYear: 1950,
      lastYear: 2050,
      todayButtonDecoration: BoxDecoration(
        color: Colors.white,
      ),
      todayButtonTextStyle: TextStyle(
        color: Colors.black,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(widget.appBarHeight),
          child: AppBar(
            title: Align(
              alignment: Alignment.center,
              child: Text('SIMPLE DATE PICKER DEMO'),
            ),
          )),
      body: Container(
        height: safeAreaHeight(context) - widget.appBarHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                yearMonthDayRecord?.$1.call();
              },
              child: StreamBuilder(
                stream: yearMonthDayRecord?.$2,
                builder: (context, snapshot) {
                  return Align(
                    alignment: Alignment.center,
                    child: Text(
                      yearMonthDayDateFormat(snapshot.data ?? DateTime.now()),
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                },
              ),
            ),
            Text(
              'YEAR MONTH DAY PICKER',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 20),
            ),
            GestureDetector(
              onTap: () {
                yearMonthRecord?.$1.call();
              },
              child: StreamBuilder(
                stream: yearMonthRecord?.$2,
                builder: (context, snapshot) {
                  return Align(
                    alignment: Alignment.center,
                    child: Text(
                      yearMonthDateFormat(snapshot.data ?? DateTime.now()),
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                },
              ),
            ),
            Text(
              'YEAR MONTH PICKER',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 20),
            ),
            GestureDetector(
              onTap: () {
                yearRecord?.$1.call();
              },
              child: StreamBuilder(stream: yearRecord?.$2, builder: (context, snapshot) {
                return Align(
                  alignment: Alignment.center,
                  child: Text(
                    yearDateFormat(snapshot.data ?? DateTime.now()),
                    style: TextStyle(fontSize: 20),
                  ),
                );
              },),
            ),
            Text(
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
