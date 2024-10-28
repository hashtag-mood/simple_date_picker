import 'package:flutter_bloc/flutter_bloc.dart';

class DateTimeCubit extends Cubit<DateTime>{
  DateTimeCubit() : super(DateTime.now());

  void updateDateTime(DateTime newDateTime) {
    emit(DateTime(newDateTime.year, newDateTime.month, newDateTime.day));
  }
}