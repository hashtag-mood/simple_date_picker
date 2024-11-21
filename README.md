# Simple Date Picker

#### SHOWCASE

<img src="https://raw.githubusercontent.com/hashtag-mood/simple_date_picker/refs/heads/main/SHOWCASE.gif" width=400>

#### GETTING STARTED

Run the following command in your terminal to get started

```
 $ flutter pub add simple_date_picker
```

#### USAGE

COMPLETE EXAMPLE is [here](https://github.com/hashtag-mood/simple_date_picker/blob/main/example/lib/main.dart)

<b>*SET UP*</b>

Create an instance of SimpleDatePicker and define DateTimes for each picker

```
SimpleDatePicker simpleDatePicker = SimpleDatePicker();
DateTime yearMonthDayDateTime = DateTime.now();
DateTime yearMonthDateTime = DateTime.now();
DateTime yearDateTime = DateTime.now();
int firstYear = 1950;
int lastYear = 2050;
```

<b>*EXAMPLE*</b>

```
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
                          lastYear: lastYear,
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
            );
```