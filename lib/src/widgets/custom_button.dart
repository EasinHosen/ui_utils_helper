import 'package:flutter/material.dart';

import 'custom_sized_box.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    this.onPressed,
    this.primary,
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
  });
  final String label;
  final Function()? onPressed;
  final Color? primary;
  final Color? labelColor;
  final Color? borderColor,
      prefixImageColor,
      prefixImageBgColor,
      suffixImageColor,
      suffixImageBgColor;
  final double? fontSize;
  final double? marginHorizontal;
  final double? marginVertical;
  final double? height,
      prefixImageHeight,
      prefixImageWidth,
      suffixImageHeight,
      suffixImageWidth;
  final double? elevation;
  final double? contentPadding;
  final double? contentHorizontalPadding;
  final double? contentVerticalPadding;
  final double? width;
  final double? borderWidth, prefixImageBorderRadius, suffixImageBorderRadius;
  final double? borderRadiusAll;
  final FontWeight? fontWeight;
  final String? iconData;
  final bool isDisable;
  final String? prefixImage, suffixImage;

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
        onPressed: isDisable ? () {} : onPressed,
        style: ElevatedButton.styleFrom(
          side: BorderSide(
              width: borderWidth ?? 1, color: borderColor ?? Colors.blue),
          foregroundColor: isDisable ? Colors.grey : primary ?? Colors.blue,
          backgroundColor: isDisable ? Colors.grey : primary ?? Colors.blue,
          elevation: elevation ?? 0.5,
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
                    color: prefixImageColor ?? Colors.white,
                  ),
                ),
              ),
            if (prefixImage != null) CustomSizedBox.space12W,
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
                    color: suffixImageColor ?? Colors.white,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
