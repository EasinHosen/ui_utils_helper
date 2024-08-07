import 'package:flutter/material.dart';

class CustomOTPWidget extends StatefulWidget {
  final int otpDigits;
  final double? height;
  final double? otpFieldWidth;
  final double? spacing;
  final Color? fillColor;
  final Color? focusedBorderColor;
  final Color? unfocusedBorderColor;
  final TextStyle? textStyle;
  final ValueChanged<String>? onOTPComplete;

  const CustomOTPWidget({
    super.key,
    required this.otpDigits,
    this.height,
    this.otpFieldWidth,
    this.spacing,
    this.fillColor,
    this.focusedBorderColor,
    this.unfocusedBorderColor,
    this.textStyle,
    this.onOTPComplete,
  }) : assert(otpDigits >= 4 && otpDigits <= 8);

  @override
  State<CustomOTPWidget> createState() => _CustomOTPWidgetState();
}

class _CustomOTPWidgetState extends State<CustomOTPWidget> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers =
        List.generate(widget.otpDigits, (index) => TextEditingController());
    _focusNodes = List.generate(widget.otpDigits, (index) => FocusNode());
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  double getOtpFieldWidth() {
    if (widget.otpFieldWidth != null) {
      return widget.otpFieldWidth!;
    } else {
      switch (widget.otpDigits) {
        case 4:
          return 70;
        case 5:
          return 60;
        case 6:
          return 50;
        case 7:
          return 40;
        case 8:
          return 35;
        default:
          return 50;
      }
    }
  }

  String getOTP() {
    String otp = _controllers.map((controller) => controller.text).join();
    return otp;
  }

  void _handleInputChange() {
    String otp = getOTP();
    if (otp.length == widget.otpDigits && widget.onOTPComplete != null) {
      widget.onOTPComplete!(otp);
    }
  }

  @override
  Widget build(BuildContext context) {
    double otpFieldWidth = getOtpFieldWidth();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(widget.otpDigits, (index) {
        return Container(
          alignment: Alignment.center,
          width: otpFieldWidth,
          height: widget.height ?? 60,
          margin: EdgeInsets.symmetric(horizontal: widget.spacing ?? 8),
          child: TextField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            style: widget.textStyle ?? const TextStyle(fontSize: 24),
            decoration: InputDecoration(
              filled: true,
              fillColor: widget.fillColor ?? Colors.white,
              counterText: '',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                    color: widget.unfocusedBorderColor ?? Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:
                    BorderSide(color: widget.focusedBorderColor ?? Colors.blue),
              ),
            ),
            onChanged: (value) {
              _handleInputChange();
              if (value.isNotEmpty && index < widget.otpDigits - 1) {
                FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
              } else if (value.isEmpty && index > 0) {
                FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
              }
            },
          ),
        );
      }),
    );
  }
}
