import 'package:flutter/material.dart';

import '../../../view_model/utils/colors/app_colors.dart';

class TextFormFieldCustom extends StatelessWidget {
  final String ?labelText;
  final IconData? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  final int? maxLines;
  final void Function()? onTapIcon;
  final String? hintText;
  final void Function(String)? onChanged;
  final AutovalidateMode? autovalidateMode;
  final int? maxLength;
  final void Function()? onTap;
  final bool readOnly;
  final void Function(String)? onFieldSubmitted;
   const TextFormFieldCustom({
    super.key,
     this.labelText,
    this.validator,
    this.controller, this.keyboardType,
     this.obscureText=false,
     this.onTapIcon,
     this.suffixIcon,
     this.maxLines=1,
     this.hintText,
     this.onTap,
     this.readOnly=false,
     this.onFieldSubmitted,
     this.autovalidateMode,
     this.maxLength,
     this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.appColor,
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      maxLines: maxLines,
      onTap: onTap,
      readOnly:readOnly ,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      autovalidateMode: autovalidateMode,
      maxLength:maxLength ,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.whiteColor,
        labelText: labelText,
        hintText: hintText,
        labelStyle: const TextStyle(
            color: AppColors.appColor,
          fontSize: 18
        ),
        suffixIcon: InkWell(
          onTap: onTapIcon,
          child: Icon(
            suffixIcon,
            color: AppColors.appColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: AppColors.appColor
            ),
            borderRadius: BorderRadius.circular(10)
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: AppColors.appColor
            ),
            borderRadius: BorderRadius.circular(10)
        ),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: AppColors.errorColor
            ),
            borderRadius: BorderRadius.circular(10)
        ),
      ),
    );
  }
}
