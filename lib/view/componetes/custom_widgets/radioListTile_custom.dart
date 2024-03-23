import 'package:bati_app/view_model/cubits/app_cubit/app_cubit.dart';
import 'package:bati_app/view_model/utils/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'text_custom.dart';

class RadioListTileCustom extends StatelessWidget {
  final String value;
  const RadioListTileCustom({super.key, required this.value,});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
       return RadioListTile(
         tileColor: AppColors.listTileColor,
         activeColor: AppColors.appColor,
         controlAffinity:ListTileControlAffinity.trailing ,
         contentPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
         title:  TextCustom(
           textValue: value,
           color: AppColors.blackColor,
           fontSize: 20,
         ),
         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
         value: value,
         groupValue: AppCubit.get(context).language,
         onChanged: (value) {
           if(context.locale.toString()=='en'){
             context.setLocale(const Locale('ar'));
             context.tr('ar');
           }else{
             context.setLocale(const Locale('en'));
             context.tr('en');
           }
           AppCubit.get(context).changeLanguage(value);
         },
    );
  },
);
  }
}
