import 'package:flutter/material.dart';

class AxisDivider extends StatelessWidget {
  final Axis axis;
  final double thickness;
  final Color? color;

  const AxisDivider({
    super.key,
    required this.axis,
    this.thickness = 1,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final c = color ?? Colors.grey.shade300;

    if (axis == Axis.vertical) {
      return Container(width: thickness, color: c);
    }
    return Container(height: thickness, color: c);
  }
}
