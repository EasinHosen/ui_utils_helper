import 'package:flutter/material.dart';

import 'custom_sized_box.dart';

/// A customizable button widget.
///
/// The `CustomButton` widget provides a highly customizable button with various
/// properties to control its appearance and behavior.
///
/// ## Parameters:
///
/// - `label` (\[String\]): The text label to display on the button. This parameter is required.
/// - `onPressed` (\[Function()? \]): The callback function to be called when the button is pressed.
/// - `primary` (\[Color? \]): The primary color of the button.
/// - `borderColor` (\[Color? \]): The color of the button's border.
/// - `labelColor` (\[Color? \]): The color of the button's label text.
/// - `fontSize` (\[double? \]): The font size of the button's label text.
/// - `fontWeight` (\[FontWeight? \]): The font weight of the button's label text.
/// - `iconData` (\[String? \]): The icon data to display on the button.
/// - `height` (\[double? \]): The height of the button.
/// - `borderWidth` (\[double? \]): The width of the button's border.
/// - `elevation` (\[double? \]): The elevation of the button.
/// - `width` (\[double? \]): The width of the button.
/// - `borderRadiusAll` (\[double? \]): The border radius of the button.
/// - `contentPadding` (\[double? \]): The padding inside the button.
/// - `marginHorizontal` (\[double? \]): The horizontal margin around the button.
/// - `marginVertical` (\[double? \]): The vertical margin around the button.
/// - `contentHorizontalPadding` (\[double? \]): The horizontal padding inside the button.
/// - `contentVerticalPadding` (\[double? \]): The vertical padding inside the button.
/// - `isDisable` (\[bool\]): Whether the button is disabled. Defaults to `false`.
/// - `prefixImage` (\[String? \]): The image to display before the label.
/// - `prefixImageHeight` (\[double? \]): The height of the prefix image.
/// - `prefixImageWidth` (\[double? \]): The width of the prefix image.
/// - `prefixImageColor` (\[Color? \]): The color of the prefix image.
/// - `prefixImageBgColor` (\[Color? \]): The background color of the prefix image.
/// - `prefixImageBorderRadius` (\[double? \]): The border radius of the prefix image.
/// - `suffixImage` (\[String? \]): The image to display after the label.
/// - `suffixImageHeight` (\[double? \]): The height of the suffix image.
/// - `suffixImageWidth` (\[double? \]): The width of the suffix image.
/// - `suffixImageColor` (\[Color? \]): The color of the suffix image.
/// - `suffixImageBgColor` (\[Color? \]): The background color of the suffix image.
/// - `suffixImageBorderRadius` (\[double? \]): The border radius of the suffix image.
///
/// ## Example:
///
/// ```dart
/// CustomButton(
///   label: 'Click Me',
///   onPressed: () {
///     print('Button Pressed');
///   },
///   primary: Colors.blue,
///   borderColor: Colors.blueAccent,
///   labelColor: Colors.white,
///   fontSize: 16,
///   fontWeight: FontWeight.bold,
///   height: 50,
///   width: 200,
///   borderRadiusAll: 8,
///   contentPadding: 16,
///   prefixImage: 'assets/icon.png',
///   suffixImage: 'assets/icon.png',
/// )
/// ```

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    this.onPressed,
    this.primary,
    this.disabledBackgroundColor,
    this.borderColor,
    this.labelColor,
    this.fontSize,
    this.fontWeight,
    this.iconData,
    this.height,
    this.borderWidth,
    this.elevation,
    this.width,
    this.borderRadiusAll,
    this.contentPadding,
    this.marginHorizontal,
    this.marginVertical,
    this.contentHorizontalPadding,
    this.contentVerticalPadding,
    this.isDisable = false,
    this.prefixImage,
    this.prefixImageHeight,
    this.prefixImageWidth,
    this.prefixImageColor,
    this.prefixImageBgColor,
    this.prefixImageBorderRadius,
    this.suffixImageColor,
    this.suffixImageBgColor,
    this.suffixImageHeight,
    this.suffixImageWidth,
    this.suffixImageBorderRadius,
    this.suffixImage,
    this.prefixImageGap,
  });

  /// The text label to display on the button.
  final String label;

  /// The callback function to be called when the button is pressed.
  final Function()? onPressed;

  /// The primary color of the button.
  final Color? primary;

  ///disabled button background color
  final Color? disabledBackgroundColor;

  /// The color of the button's label text.
  final Color? labelColor;

  /// The color of the button's border.
  final Color? borderColor;

  /// The color of the prefix image.
  final Color? prefixImageColor;

  /// The background color of the prefix image.
  final Color? prefixImageBgColor;

  /// The color of the suffix image.
  final Color? suffixImageColor;

  /// The background color of the suffix image.
  final Color? suffixImageBgColor;

  /// The font size of the button's label text.
  final double? fontSize;

  /// The horizontal margin around the button.
  final double? marginHorizontal;

  /// The vertical margin around the button.
  final double? marginVertical;

  /// The height of the button.
  final double? height;

  /// The height of the prefix image.
  final double? prefixImageHeight;

  /// The width of the prefix image.
  final double? prefixImageWidth;

  /// The height of the suffix image.
  final double? suffixImageHeight;

  /// The width of the suffix image.
  final double? suffixImageWidth;

  /// The elevation of the button.
  final double? elevation;

  /// The padding inside the button.
  final double? contentPadding;

  /// The horizontal padding inside the button.
  final double? contentHorizontalPadding;

  /// The vertical padding inside the button.
  final double? contentVerticalPadding;

  /// The width of the button.
  final double? width;

  /// The width of the button's border.
  final double? borderWidth;

  /// The border radius of the prefix image.
  final double? prefixImageBorderRadius;

  /// The border radius of the suffix image.
  final double? suffixImageBorderRadius;

  /// The border radius of the button.
  final double? borderRadiusAll;

  /// The font weight of the button's label text.
  final FontWeight? fontWeight;

  /// The icon data to display on the button.
  final String? iconData;

  /// Whether the button is disabled.
  final bool isDisable;

  /// The image to display before the label.
  final String? prefixImage;

  final double? prefixImageGap;

  /// The image to display after the label.
  final String? suffixImage;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: height ?? 48,
      width: width ?? size.width,
      margin: EdgeInsets.symmetric(
        horizontal: marginHorizontal ?? 16,
        vertical: marginVertical ?? 36,
      ),
      // decoration: BoxDecoration(
      //   border: Border.all(
      //       // color: borderColor ?? AppColors.kWhiteColor,
      //       width: borderWidth ?? 1),
      // ),
      child: ElevatedButton(
        onPressed: isDisable ? null : onPressed,
        style: ElevatedButton.styleFrom(
          side: BorderSide(
              width: borderWidth ?? 1, color: borderColor ?? Colors.blue),
          foregroundColor: isDisable ? Colors.grey : primary ?? Colors.blue,
          backgroundColor: primary ?? Colors.blue,
          elevation: elevation ?? 0.5,
          disabledBackgroundColor: disabledBackgroundColor ?? Colors.grey,
          padding: EdgeInsets.symmetric(
              horizontal: contentHorizontalPadding ?? contentPadding ?? 8,
              vertical: contentVerticalPadding ?? contentPadding ?? 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadiusAll ?? 4),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (prefixImage != null)
              Container(
                decoration: BoxDecoration(
                    color: prefixImageBgColor ?? Colors.transparent,
                    borderRadius: BorderRadius.all(
                        Radius.circular(prefixImageBorderRadius ?? 100))),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Image.asset(
                    prefixImage!,
                    height: prefixImageHeight ?? 15,
                    width: prefixImageWidth ?? 15,
                    color: prefixImageColor,
                  ),
                ),
              ),
            if (prefixImage != null)
              SizedBox(
                width: prefixImageGap ?? 12,
              ),
            Text(
              label,
              style: TextStyle(
                fontSize: fontSize ?? 16,
                fontWeight: fontWeight ?? FontWeight.w600,
                color: labelColor ?? const Color(0xffFFFFFF),
              ),
            ),
            if (suffixImage != null) CustomSizedBox.space8W,
            if (suffixImage != null)
              Container(
                decoration: BoxDecoration(
                    color: suffixImageBgColor ?? Colors.transparent,
                    borderRadius: BorderRadius.all(
                        Radius.circular(suffixImageBorderRadius ?? 100))),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Image.asset(
                    suffixImage!,
                    height: suffixImageHeight ?? 15,
                    width: suffixImageWidth ?? 15,
                    color: suffixImageColor,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
