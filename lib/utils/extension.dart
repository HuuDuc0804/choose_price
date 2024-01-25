import 'package:flutter/material.dart';

extension GetOrientation on BuildContext {
  Orientation get orientation => MediaQuery.of(this).orientation;
}
