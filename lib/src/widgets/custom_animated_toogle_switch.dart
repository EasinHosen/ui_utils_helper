import 'package:flutter/material.dart';

/// A custom animated toggle switch widget.
///
/// This widget provides a toggle switch with an animation effect when switching
/// between two states. It also supports custom child widgets for the left and
/// right states, as well as customizable height and width.
class CustomAnimatedToggleSwitch extends StatefulWidget {
  /// The callback that is called when the toggle switch is changed.
  final ValueChanged<bool> onChanged;

  /// The height of the toggle switch.
  final double height;

  /// The width of the toggle switch.
  final double width;

  /// The widget to display on the left side of the toggle switch.
  final Widget childLeft;

  /// The widget to display on the right side of the toggle switch.
  final Widget childRight;

  /// The color to display on the left side of the toggle switch.
  final Color? colorLeft;

  /// The color to display on the right side of the toggle switch.
  final Color? colorRight;

  /// Creates a custom animated toggle switch widget.
  ///
  /// The [onChanged], [childLeft], and [childRight] parameters are required.
  /// The [height] defaults to 35.0 and the [width] defaults to 70.0.
  const CustomAnimatedToggleSwitch({
    super.key,
    required this.onChanged,
    this.height = 35.0,
    this.width = 70.0,
    required this.childLeft,
    required this.childRight,
    this.colorLeft,
    this.colorRight,
  });

  @override
  State<CustomAnimatedToggleSwitch> createState() =>
      _CustomAnimatedToggleSwitchState();
}

class _CustomAnimatedToggleSwitchState extends State<CustomAnimatedToggleSwitch>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _colorAnimation;
  bool _value = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _colorAnimation = ColorTween(
      begin: widget.colorLeft ?? Colors.blue,
      end: widget.colorLeft ?? Colors.green,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _value = !_value;
          widget.onChanged(_value);
          _value
              ? _animationController.forward()
              : _animationController.reverse();
        });
      },
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: _colorAnimation.value,
              border: Border.all(
                color: Colors.white,
                width: 0.8,
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: widget.childLeft,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: widget.childRight,
                  ),
                ),
                AnimatedAlign(
                  alignment:
                      _value ? Alignment.centerRight : Alignment.centerLeft,
                  duration: _animationController.duration!,
                  curve: Curves.linear,
                  child: Container(
                    width: widget.width / 2,
                    height: widget.height,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
