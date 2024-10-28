import 'package:flutter/cupertino.dart';

class CustomCupertinoPicker extends StatelessWidget {
  final Decoration? decoration;
  final Color backgroundColor;
  final double itemExtent;
  final FixedExtentScrollController controller;
  final Function(int) onChangedCallback;
  final List<Widget> dateTimeList;

  const CustomCupertinoPicker(
      {super.key,
        this.decoration,
        required this.backgroundColor,
        required this.itemExtent,
        required this.onChangedCallback,
        required this.controller,
        required this.dateTimeList});

  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
      selectionOverlay: Container(
        decoration: decoration,
      ),
      backgroundColor: backgroundColor,
      scrollController: controller,
      itemExtent: itemExtent,
      onSelectedItemChanged: onChangedCallback,
      children: dateTimeList,
    );
  }
}
