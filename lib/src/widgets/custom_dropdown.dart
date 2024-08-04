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

  /// The selected option in the dropdown.
  final String? _selectedOption;

  /// The hint text displayed in the dropdown.
  final String? _hintText;

  /// The label text displayed above the dropdown.
  final String? label;

  /// The header title displayed above the dropdown.
  final String? headerTitle;

  /// The list of items to display in the dropdown.
  final List<dynamic> _list;

  /// The callback function when an option is selected.
  final Function(String?) onChange;

  /// The font weight of the dropdown text.
  final FontWeight? fontWeight;

  /// The font weight of the selected option text.
  final FontWeight? selectedTextFontWeight;

  /// The font weight of the list items text.
  final FontWeight? listTextFontWeight;

  /// The vertical margin around the dropdown.
  final double? verticalMargin;

  /// The font size of the dropdown text.
  final double? fontSize;

  /// The horizontal margin around the dropdown.
  final double? horizontalMargin;

  /// The height of the dropdown.
  final double? height;

  /// The width of the dropdown.
  final double? width;

  /// The font size of the header title.
  final double? headerTitleFontSize;

  /// Whether the label text is required.
  final bool isRequiredInLabel;

  /// Whether the dropdown is enabled.
  final bool isEnable;

  /// Whether the dropdown has a header title.
  final bool hasHeaderTitle;

  /// Whether the header title is required.
  final bool isRequiredInHeader;

  /// The border radius of the dropdown.
  final BorderRadius? borderRadius;

  /// The alignment of the dropdown items.
  final AlignmentGeometry? dropdownItemAlignment;

  /// The color of the list items text.
  final Color? listTextColor;

  /// The color of the selected option text.
  final Color? selectedTextColor;

  /// The background color of the dropdown.
  final Color? bgColor;

  /// The color of the enabled border.
  final Color? enabledBorderColor;

  /// The color of the focused border.
  final Color? focusedBorderColor;

  /// The color of the header title text.
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
                hint: Text(_hintText ?? ''),
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
                ),
                icon: const Icon(Icons.keyboard_arrow_down_rounded, size: 24),
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: fontWeight ?? FontWeight.w500,
                  fontSize: fontSize ?? 14,
                ),
                value:
                    _selectedOption?.isEmpty ?? true ? null : _selectedOption,
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
