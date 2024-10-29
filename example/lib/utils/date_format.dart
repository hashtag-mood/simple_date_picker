String yearMonthDayDateFormat(DateTime dateTime) {
  int year = dateTime.year;
  int month = dateTime.month;
  int day = dateTime.day;
  return '${year}년 ${month}월 ${day}일';
}

String yearMonthDateFormat(DateTime dateTime) {
  int year = dateTime.year;
  int month = dateTime.month;
  return '${year}년 ${month}월';
}

String yearDateFormat(DateTime dateTime) {
  int year = dateTime.year;
  return '${year}년';
}