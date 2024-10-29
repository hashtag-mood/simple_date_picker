String yearMonthDayDateFormat(DateTime dateTime) {
  int year = dateTime.year;
  int month = dateTime.month;
  int day = dateTime.day;
  return '$year년 $month월 $day일';
}

String yearMonthDateFormat(DateTime dateTime) {
  int year = dateTime.year;
  int month = dateTime.month;
  return '$year년 $month월';
}

String yearDateFormat(DateTime dateTime) {
  int year = dateTime.year;
  return '$year년';
}