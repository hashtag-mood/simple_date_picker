String yearMonthDayDateFormat(DateTime dateTime) {
  int year = dateTime.year;
  int month = dateTime.month;
  int day = dateTime.day;
  return '${year}年${month}月${day}日';
}

String yearMonthDateFormat(DateTime dateTime) {
  int year = dateTime.year;
  int month = dateTime.month;
  return '${year}年${month}月';
}

String yearDateFormat(DateTime dateTime) {
  int year = dateTime.year;
  return '${year}年';
}