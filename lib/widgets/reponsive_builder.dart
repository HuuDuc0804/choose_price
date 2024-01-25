import 'package:choose_price/utils/extension.dart';
import 'package:flutter/material.dart';

class ReponsiveBuilder extends StatelessWidget {
  const ReponsiveBuilder({
    super.key,
    required this.portrait,
    required this.landscape,
  });
  final Widget portrait;
  final Widget landscape;
  @override
  Widget build(BuildContext context) {
    return context.orientation == Orientation.portrait ? portrait : landscape;
  }
}
