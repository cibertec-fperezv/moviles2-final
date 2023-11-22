import 'package:flutter/cupertino.dart';

deviceSizes(context) => (
  width: MediaQuery.of(context).size.width,
  height: MediaQuery.of(context).size.height
);

deviceWidthPercentage(context, percent) => (deviceSizes(context).width / 100) * percent;

deviceHeightPercentage(context, percent) => (deviceSizes(context).height / 100) * percent;

keyboardSize(context) => MediaQuery.of(context).viewInsets.bottom;

isKeyboardOpen(context) => keyboardSize(context) > 0;