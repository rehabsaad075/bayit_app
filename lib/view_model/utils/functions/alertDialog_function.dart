
import 'package:bati_app/i10l/locale_keys.g.dart';
import 'package:bati_app/view/componetes/custom_widgets/text_custom.dart';
import 'package:bati_app/view_model/utils/colors/app_colors.dart';
import 'package:bati_app/view_model/utils/icons/app_icons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void alertDialogFunction({
  required context,
  required String title,
  required String subTitle,
  required String textValueButton,
  required void Function()? onPressed
}){
  showDialog(
      context: context,
      builder: (context)=>AlertDialog(
        title:  Row(
          children: [
            const Icon(AppIcons.info,color: AppColors.appColor,),
            const SizedBox(width: 10,),
            TextCustom(
              textValue: title,
            ),
          ],
        ),
        content:  TextCustom(
          textValue: subTitle,
          color: AppColors.blackColor,
          fontSize: 18,
        ),
        titlePadding: const EdgeInsets.only(top: 24,left: 24,bottom: 6,right: 24),
        contentPadding: const EdgeInsets.symmetric(horizontal: 32,vertical: 12),
        actionsPadding: const EdgeInsets.only(bottom: 12,right: 24,left: 24),
        actions: [
          TextButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: TextCustom(
                textValue: LocaleKeys.cancel.tr(),
                fontSize: 16,
              )
          ),
          TextButton(
              onPressed:onPressed ,
              child:  TextCustom(
                textValue: textValueButton,
                fontSize: 16,
                color: AppColors.errorColor,
              )
          ),
        ],
      )
  );
}