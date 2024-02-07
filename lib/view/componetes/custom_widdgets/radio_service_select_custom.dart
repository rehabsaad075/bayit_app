import 'package:bati_app/view_model/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';

import 'text_custom.dart';

class RadioServiceSelectCustom extends StatelessWidget {
  final String value;
  final String textValue;
  final  String? groupValue;
  final void Function(String?)? onChanged;
  const RadioServiceSelectCustom({
    super.key,
    required this.value,
    required  this.onChanged,
    required this.textValue,
    required this.groupValue,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
        activeColor: AppColors.appColor,
      tileColor: AppColors.radioColor,
        value:value ,
        onChanged: onChanged,
      groupValue: groupValue,
      contentPadding: const EdgeInsets.symmetric(vertical: 3,horizontal: 3),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
      ),
      title:  TextCustom(
        textValue: textValue ,
        color: AppColors.blackColor,
        fontSize: 20,
        maxLines: 2,
      ),
    );
  }
}

