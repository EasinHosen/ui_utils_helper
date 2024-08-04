import 'package:flutter/material.dart';
import 'custom_sized_box.dart';

class CustomTextField extends StatefulWidget {
  /// The height of the text field.
  final double? height;

  /// The horizontal padding inside the text field.
  final double? contentPaddingHorizontal;

  /// The width of the text field.
  final double? width;

  /// The border radius of the text field.
  final double? borderRadius;

  /// The size of the password visibility icon.
  final double? passwordIconSize;

  /// The font size of the hint text.
  final double? hintSize;

  /// The font size of the input text.
  final double? textSize;

  /// The font size of the label text.
  final double? labelSize;

  /// The horizontal margin around the text field.
  final double? marginHorizontal;

  /// The vertical margin around the text field.
  final double? marginVertical;

  /// The width of the text field border.
  final double? borderWidth;

  /// The font size of the header title.
  final double? headerFontSize;

  /// The hint text displayed inside the text field.
  final String? hintText;

  /// The label text displayed above the text field.
  final String? labelText;

  /// The error message displayed below the text field.
  final String? errorMessage;

  /// The header title displayed above the text field.
  final String? headerTitle;

  /// The color of the hint text.
  final Color? hintColor;

  /// The color of the input text.
  final Color? textColor;

  /// The color of the password visibility icon.
  final Color? passwordIconColor;

  /// The color of the label text.
  final Color? labelColor;

  /// The background color of the text field.
  final Color? fillColor;

  /// The font weight of the hint text.
  final FontWeight? hintFontWeight;

  /// The font weight of the input text.
  final FontWeight? textFontWeight;

  /// The font weight of the label text.
  final FontWeight? labelFontWeight;

  /// The font weight of the header title.
  final FontWeight? headerFontWeight;

  /// The maximum number of lines for the input text.
  final int? maxLine;

  /// The controller for the text field.
  final TextEditingController? controller;

  /// Whether the text field is for password input.
  final bool? isPassword;

  /// Whether the input text should be obscured.
  final bool? obscureText;

  /// Whether the text field is in an invalid state.
  final bool? isInvalid;

  /// Whether the text field contains a right-aligned widget.
  final bool? isRightContain;

  /// Whether the text field has a header title.
  final bool? hasHeaderTitle;

  /// Whether the header title is required.
  final bool? isRequiredWithHeader;

  /// Whether the label text is required.
  final bool isRequiredWithoutHeader;

  /// Whether the text field is enabled.
  final bool enabled;

  /// Whether the input text is right-aligned.
  final bool isRightAligned;

  /// The widget displayed at the end of the text field.
  final Widget? suffixIcon;

  /// The widget displayed at the start of the text field.
  final Widget? prefixWidget;

  /// The focus node for the text field.
  final FocusNode? focusNode;

  /// The type of keyboard to use for the text field.
  final TextInputType? keyboardType;

  /// The callback for when the input text changes.
  final ValueChanged<String>? onChanged;

  const CustomTextField({
    super.key,
    this.height,
    this.width,
    this.contentPaddingHorizontal,
    this.borderRadius,
    this.hintText,
    this.hintSize,
    this.hintColor,
    this.hintFontWeight,
    this.textColor,
    this.textSize,
    this.textFontWeight,
    this.labelText,
    this.labelColor,
    this.labelFontWeight,
    this.labelSize,
    this.errorMessage,
    this.onChanged,
    this.maxLine,
    this.controller,
    this.marginHorizontal,
    this.suffixIcon,
    this.marginVertical,
    this.isPassword = false,
    this.obscureText = false,
    this.isInvalid = false,
    this.isRightContain = false,
    this.focusNode,
    this.enabled = true,
    this.keyboardType,
    this.isRequiredWithoutHeader = false,
    this.isRightAligned = false,
    this.headerTitle,
    this.hasHeaderTitle,
    this.isRequiredWithHeader,
    this.borderWidth,
    this.fillColor,
    this.prefixWidget,
    this.headerFontSize,
    this.headerFontWeight,
    this.passwordIconColor,
    this.passwordIconSize,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = false;
  @override
  void initState() {
    _obscureText = widget.obscureText!;
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: widget.marginHorizontal ?? 16,
        // vertical: errorMessage == null ? widget.marginVertical ?? 25 : 25,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.hasHeaderTitle != null && widget.hasHeaderTitle!)
            Row(
              children: [
                Text(
                  widget.headerTitle ?? '',
                  style: TextStyle(
                      fontWeight: widget.headerFontWeight ?? FontWeight.normal,
                      fontSize: widget.headerFontSize ?? 16),
                ),
                if (widget.isRequiredWithHeader != null &&
                    widget.isRequiredWithHeader!)
                  const Text(
                    '*',
                    style: TextStyle(color: Colors.red),
                  )
              ],
            ),
          if (widget.hasHeaderTitle != null && widget.hasHeaderTitle!)
            CustomSizedBox.space4H,
          SizedBox(
            height: widget.height ?? 48,
            width: widget.width ?? MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    textAlign:
                        widget.isRightAligned ? TextAlign.end : TextAlign.start,
                    cursorColor: Colors.black,
                    obscureText: _obscureText,
                    controller: widget.controller,
                    focusNode: widget.focusNode,
                    enabled: widget.enabled,
                    maxLines: widget.maxLine ?? 1,
                    keyboardType: widget.keyboardType,
                    style: TextStyle(
                      color: widget.textColor ?? Colors.black,
                      fontSize: widget.textSize ?? 14,
                      fontWeight: widget.textFontWeight ?? FontWeight.w500,
                    ),
                    onChanged: widget.onChanged,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: widget.fillColor ?? Colors.transparent,
                        prefixIcon: widget.prefixWidget,
                        // errorText: widget.errorMessage,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: widget.contentPaddingHorizontal ?? 20),
                        hintText: widget.hintText,
                        hintStyle: TextStyle(
                          color: widget.hintColor ?? Colors.grey,
                          fontSize: widget.hintSize ?? 14,
                          fontWeight: widget.hintFontWeight ?? FontWeight.w400,
                        ),
                        label: RichText(
                          text: TextSpan(
                            text: widget.labelText,
                            style: TextStyle(
                              color: widget.labelColor ?? Colors.grey,
                              fontSize: widget.labelSize ?? 14,
                              fontWeight:
                                  widget.labelFontWeight ?? FontWeight.w400,
                            ),
                            children: <TextSpan>[
                              if (widget.isRequiredWithoutHeader)
                                const TextSpan(
                                  text: ' *',
                                  style: TextStyle(
                                      color:
                                          // widget.focusNode!.hasFocus ?
                                          Colors.red
                                      // : widget.labelColor ?? Colors.black.withOpacity(.7),
                                      ),
                                )
                            ],
                          ),
                        ),

                        // labelText: widget.labelText,
                        // labelStyle: TextStyle(
                        //   color: widget.labelColor ?? Colors.black.withOpacity(.7),
                        //   fontSize: widget.labelSize ?? 14,
                        //   fontWeight: widget.labelFontWeight ?? FontWeight.w400,
                        // ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(widget.borderRadius ?? 4),
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: widget.borderWidth ?? 1.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(widget.borderRadius ?? 4),
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: widget.borderWidth ?? 0.5,
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(widget.borderRadius ?? 4),
                          borderSide: BorderSide(
                            // color: Styles.appColors['kBorderColor']!,
                            width: widget.borderWidth ?? 0.5,
                          ),
                        ),
                        isDense: true,
                        errorStyle: const TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        suffixIcon: widget.isPassword!
                            ? InkWell(
                                onTap: () {
                                  toggle();
                                },
                                child: Icon(
                                  _obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: widget.passwordIconColor,
                                  size: widget.passwordIconSize,
                                ),
                              )
                            : widget.suffixIcon),
                  ),
                ),
                if (widget.isRightContain!)
                  Container(
                    alignment: Alignment.center,
                    height: widget.height ?? 48,
                    width: 37,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.blue, width: .5),
                    ),
                    child: const Text('%',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        )),
                  )
              ],
            ),
          ),
          if (widget.errorMessage != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 32, top: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 2),
                        child: Icon(
                          Icons.error_outline,
                          color: Colors.red,
                          size: 10,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.errorMessage!,
                              style: TextStyle(
                                color: Colors.red.withOpacity(0.80),
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Inter',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  void toggle() {
    _obscureText = !_obscureText;
    setState(() {});
  }
}
