import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    this.color,
    this.thickness,
    this.indent,
    this.endIndent,
    this.width,
    this.height,
    this.isVertical = false,
  });

  final Color? color;
  final double? thickness, indent, endIndent;
  final double? width, height;
  final bool isVertical;

  @override
  Widget build(BuildContext context) {
    final dividerColor = color ?? Colors.black;
    final dividerThickness = thickness ?? 0.5;

    return Container(
      width: isVertical ? width : width ?? double.infinity,
      height:
          isVertical ? height ?? double.infinity : height ?? dividerThickness,
      decoration: BoxDecoration(
        border: isVertical
            ? Border(
                left: BorderSide(color: dividerColor, width: dividerThickness),
              )
            : Border(
                top: BorderSide(color: dividerColor, width: dividerThickness),
              ),
      ),
      margin: EdgeInsets.only(
        left: isVertical ? indent ?? 0 : 0,
        top: isVertical ? 0 : indent ?? 0,
        right: isVertical ? endIndent ?? 0 : 0,
        bottom: isVertical ? 0 : endIndent ?? 0,
      ),
    );
  }
}
