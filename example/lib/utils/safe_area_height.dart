import 'package:flutter/material.dart';

double safeAreaHeight(BuildContext context) {
  double height = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom;
  return height;
}