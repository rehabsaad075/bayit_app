import 'package:bati_app/i10l/locale_keys.g.dart';
import 'package:bati_app/view/componetes/custom_widgets/elevatetButton_custom.dart';
import 'package:bati_app/view/componetes/custom_widgets/text_custom.dart';
import 'package:bati_app/view_model/utils/colors/app_colors.dart';
import 'package:bati_app/view_model/utils/functions/navigation_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'request_screen.dart';

class NotesAndAddressScreen extends StatelessWidget {
  const NotesAndAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: AppColors.appColor,
          size: 27,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title:  TextCustom(
          textValue: LocaleKeys.notesTittle.tr(),
          fontSize: 25,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          const SizedBox(height: 10,),
           TextCustom(
            textValue: LocaleKeys.notes1.tr(),
            color: AppColors.blackColor,
             fontSize: 18,
          ),
          const SizedBox(height: 10,),
           TextCustom(
            textValue: LocaleKeys.notes2.tr(),
            color: AppColors.blackColor,
            fontSize: 18,
          ),
          const SizedBox(height: 10,),
           TextCustom(
            textValue: LocaleKeys.notes3.tr(),
            color: AppColors.blackColor,
             fontSize: 18,
           ),
          const SizedBox(height: 10,),
           TextCustom(
            textValue: LocaleKeys.notes4.tr(),
            color: AppColors.blackColor,
            fontSize: 18,
          ),
          const SizedBox(height: 10,),
           TextCustom(
            textValue: LocaleKeys.notes5.tr(),
            color: AppColors.blackColor,
            fontSize: 18,
          ),
          const SizedBox(height: 10,),
           TextCustom(
            textValue: LocaleKeys.notes6.tr(),
            color: AppColors.blackColor,
            fontSize: 18,
          ),
          const SizedBox(height: 50,),
          ElevatedButtonCustom(
            onPressed: (){
              navigationPushFunction(
                  context: context,
                  screen: const RequestScreen()
              );
            },
            child:  TextCustom(
              textValue: LocaleKeys.nextButton.tr(),
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
