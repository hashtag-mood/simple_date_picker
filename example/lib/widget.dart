import 'package:example/utils/safe_area_height.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_date_picker/simple_date_picker.dart';

Widget datePickerWidget(
    {required BuildContext context,
    required Color color,
    required Border containerBorder,
      Color barrierColor = kCupertinoModalBarrierColor,
    required String pickerTypeDescription,
    required Widget Function(BuildContext) pickerType,
    required String dateTime}) {
  return Container(
    decoration: BoxDecoration(
      color: color,
      border: containerBorder,
    ),
    width: MediaQuery.of(context).size.width,
    height: (safeAreaHeight(context) - 60) / 6,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          pickerTypeDescription,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.normal, fontSize: 20),
        ),
        TextButton(
          onPressed: () async {
            await showCupertinoModalPopup(
              barrierColor: barrierColor,
              context: context,
              builder: pickerType,
            );
          },
          child: Text(
            dateTime,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    ),
  );
}
