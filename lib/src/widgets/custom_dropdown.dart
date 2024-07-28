import 'package:flutter/material.dart';
import 'custom_sized_box.dart';

/// A custom dropdown menu widget with extensive customization options.
///
/// The [CustomDropDownMenu] widget allows you to create a dropdown menu with customizable
/// options such as border radius, height, width, margins, font styles, colors, and more.
///
/// Example usage:
/// ```dart
/// CustomDropDownMenu(
///   selectedOption: 'Option 1',
///   hintText: 'Select an option',
///   onChange: (value) {
///     // Handle change
///   },
///   list: ['Option 1', 'Option 2', 'Option 3'],
///   borderRadius: BorderRadius.circular(8),
///   height: 50,
///   width: 200,
///   horizontalMargin: 16,
///   verticalMargin: 8,
///   fontWeight: FontWeight.bold,
///   fontSize: 14,
///   isRequiredInLabel: true,
///   isEnable: true,
///   listTextColor: Colors.black,
///   selectedTextColor: Colors.blue,
///   label: 'Dropdown Label',
///   headerTitle: 'Header Title',
///   hasHeaderTitle: true,
///   isRequiredInHeader: true,
///   bgColor: Colors.white,
///   enabledBorderColor: Colors.blue,
///   focusedBorderColor: Colors.green,
///   selectedTextFontWeight: FontWeight.w600,
///   dropdownItemAlignment: Alignment.centerLeft,
///   listTextFontWeight: FontWeight.normal,
///   headerTitleFontSize: 16,
///   headerTitleFontColor: Colors.black,
/// )
/// ```
class CustomDropDownMenu extends StatelessWidget {
  /// Creates a custom dropdown menu.
  ///
  /// The [selectedOption], [hintText], [onChange], and [list] parameters are required.
  const CustomDropDownMenu({
    super.key,
    required String? selectedOption,
    required String? hintText,
    required this.onChange,
    required List<dynamic> list,
    this.borderRadius,
    this.height,
    this.width,
    this.horizontalMargin,
    this.verticalMargin,
    this.fontWeight,
    this.fontSize,
    this.isRequiredInLabel = false,
    this.isEnable = true,
    this.listTextColor,
    this.selectedTextColor,
    this.label,
    this.headerTitle,
    this.hasHeaderTitle = false,
    this.isRequiredInHeader = false,
    this.bgColor,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.selectedTextFontWeight,
    this.dropdownItemAlignment,
    this.listTextFontWeight,
    this.headerTitleFontSize,
    this.headerTitleFontColor,
  })  : _selectedOption = selectedOption,
        _hintText = hintText,
        _list = list;

  final String? _selectedOption;
  final String? _hintText;
  final String? label;
  final String? headerTitle;
  final List<dynamic> _list;
  final Function onChange;
  final FontWeight? fontWeight;
  final FontWeight? selectedTextFontWeight;
  final FontWeight? listTextFontWeight;
  final double? verticalMargin;
  final double? fontSize;
  final double? horizontalMargin;
  final double? height;
  final double? width;
  final double? headerTitleFontSize;
  final bool isRequiredInLabel;
  final bool isEnable;
  final bool hasHeaderTitle;
  final bool isRequiredInHeader;
  final BorderRadius? borderRadius;
  final AlignmentGeometry? dropdownItemAlignment;
  final Color? listTextColor;
  final Color? selectedTextColor;
  final Color? bgColor;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Color? headerTitleFontColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: verticalMargin ?? 16,
        horizontal: horizontalMargin ?? 16,
      ),
      decoration: BoxDecoration(
        color: bgColor ?? Colors.white,
        borderRadius: borderRadius ?? BorderRadius.circular(4),
        backgroundBlendMode: BlendMode.srcOver,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      height: height ?? 68,
      width: width ?? double.infinity,
      child: Column(
        children: [
          if (headerTitle != null)
            Row(
              children: [
                Text(
                  headerTitle ?? '',
                  style: TextStyle(
                      color: headerTitleFontColor ?? Colors.black,
                      fontSize: headerTitleFontSize ?? 16),
                ),
                if (isRequiredInHeader)
                  const Text(
                    '*',
                    style: TextStyle(color: Colors.red),
                  )
              ],
            ),
          if (headerTitle != null) CustomSizedBox.space8H,
          Expanded(
            child: DropdownButtonHideUnderline(
              child: DropdownButtonFormField<String>(
                isExpanded: true,
                isDense: true,
                // alignment: Alignment.centerLeft,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 18)
                      .copyWith(right: 10),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: enabledBorderColor ?? Colors.blue, width: 0.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: focusedBorderColor ?? Colors.blue, width: 1),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: borderRadius ?? BorderRadius.circular(4),
                  ),
                  // label: RichText(
                  //   text: TextSpan(
                  //     text: label,
                  //     style: TextStyle(
                  //       color: Colors.black.withOpacity(0.70),
                  //       fontSize: 14,
                  //       fontWeight: FontWeight.w400,
                  //     ),
                  //     children: <TextSpan>[
                  //       if (isRequiredInLabel)
                  //         const TextSpan(
                  //           text: ' *',
                  //           style: TextStyle(
                  //               color:
                  //                   // widget.focusNode!.hasFocus ?
                  //                   Colors.red
                  //               // : widget.labelColor ?? Colors.black.withOpacity(.7),
                  //               ),
                  //         )
                  //     ],
                  //   ),
                  // ),
                  // labelStyle: TextStyle(
                  //   color: Colors.black.withOpacity(0.70),
                  //   fontSize: 14,
                  //   fontWeight: FontWeight.w400,
                  // ),
                  // labelText: label,
                  hintText: _hintText,
                ),
                icon: const Icon(Icons.keyboard_arrow_down_rounded,
                    /*color:  Colors.blue!, */ size: 30),
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: fontWeight ?? FontWeight.w500,
                  fontSize: fontSize ?? 14,
                ),
                value: _selectedOption,
                onChanged: isEnable
                    ? (newValue) {
                        onChange(newValue);
                      }
                    : null,
                selectedItemBuilder: (context) {
                  return <Widget>[
                    ...List.generate(
                      _list.length,
                      (index) => Text(
                        _list[index],
                        style: TextStyle(
                          color: selectedTextColor ?? Colors.black,
                          fontWeight: selectedTextFontWeight ?? FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ];
                },
                items: _list
                    .map(
                      (item) => DropdownMenuItem<String>(
                        value: item,
                        child: Container(
                          padding: const EdgeInsets.only(left: 8),
                          decoration: BoxDecoration(
                              color: item == _selectedOption
                                  ? Colors.green.withOpacity(0.08)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(10)),
                          alignment:
                              dropdownItemAlignment ?? Alignment.centerLeft,
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: Text(
                            item,
                            style: TextStyle(
                              color: item == _selectedOption
                                  ? Colors.blue
                                  : listTextColor ?? Colors.black,
                              fontWeight:
                                  listTextFontWeight ?? FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
