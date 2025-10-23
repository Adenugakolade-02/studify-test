import 'package:flutter/material.dart';

extension XBuildContext<T> on BuildContext{
  // TextTheme get textTheme => Theme.of(this).textTheme;
  Size get screenSize => MediaQuery.sizeOf(this);

}