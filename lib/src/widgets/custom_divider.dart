import 'package:flutter/material.dart';

/// A custom divider widget that can be used both horizontally and vertically.
///
/// The [CustomDivider] widget allows you to create a divider with customizable
/// color, thickness, indent, end indent, width, height, and orientation.
///
/// Example usage:
/// ```dart
/// CustomDivider(
///   color: Colors.grey,
///   thickness: 2.0,
///   indent: 16.0,
///   endIndent: 16.0,
///   width: 100.0,
///   height: 50.0,
///   isVertical: true,
/// )
/// ```
class CustomDivider extends StatelessWidget {
  /// Creates a custom divider.
  ///
  /// The [isVertical] parameter determines whether the divider is vertical or horizontal.
  /// By default, it is set to `false` (horizontal).
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

  /// The color of the divider. Defaults to `Colors.black` if not specified.
  final Color? color;

  /// The thickness of the divider. Defaults to `0.5` if not specified.
  final double? thickness;

  /// The amount of space to the leading edge of the divider.
  final double? indent;

  /// The amount of space to the trailing edge of the divider.
  final double? endIndent;

  /// The width of the divider. Used only if [isVertical] is `true`.
  final double? width;

  /// The height of the divider. Used only if [isVertical] is `false`.
  final double? height;

  /// Whether the divider is vertical. Defaults to `false`.
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
