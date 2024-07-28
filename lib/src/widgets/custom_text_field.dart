import 'package:flutter/material.dart';
import 'custom_sized_box.dart';

class CustomTextField extends StatefulWidget {
  final double? height;
  final double? contentPaddingHorizontal;
  final double? width;
  final double? borderRadius;
  final double? passwordIconSize;
  final String? hintText;
  final double? hintSize;
  final Color? hintColor;
  final FontWeight? hintFontWeight;
  final double? textSize;
  final Color? textColor;
  final Color? passwordIconColor;
  final FontWeight? textFontWeight;
  final String? labelText;
  final double? labelSize;
  final Color? labelColor, fillColor;
  final FontWeight? labelFontWeight;
  final String? errorMessage;
  final int? maxLine;
  final TextEditingController? controller;
  final double? marginHorizontal;
  final double? marginVertical;
  final bool? isPassword;
  final bool? obscureText;
  final bool? isInvalid;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final bool isRequiredWithoutHeader;
  final bool enabled;
  final bool? isRightContain;
  final bool isRightAligned;
  final ValueChanged<String>? onChanged;
  final bool? hasHeaderTitle, isRequiredWithHeader;
  final String? headerTitle;
  final double? borderWidth, headerFontSize;
  final Widget? prefixWidget;
  final FontWeight? headerFontWeight;

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
