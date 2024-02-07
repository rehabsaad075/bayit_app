import 'package:bati_app/view_model/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';

class TextCustom extends StatelessWidget {
  final String textValue;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? color;
  final int ?maxLines;
  const TextCustom({
    super.key,
    required this.textValue,
    this.fontWeight,
    this.fontSize,
    this.color=AppColors.appColor,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return  Text(
      textValue,
      maxLines: maxLines,
      style: TextStyle(
          fontSize: fontSize,
          color:color,
          fontWeight:fontWeight
      ),
    );
  }
}
