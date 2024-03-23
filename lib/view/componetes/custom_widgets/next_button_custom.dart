import 'package:bati_app/i10l/locale_keys.g.dart';
import 'package:bati_app/view/componetes/custom_widgets/text_custom.dart';
import 'package:bati_app/view/screens/request_screen/notes_screen.dart';
import 'package:bati_app/view_model/cubits/app_cubit/app_cubit.dart';
import 'package:bati_app/view_model/utils/functions/navigation_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'elevatetButton_custom.dart';
import 'textFormField_custom.dart';

class NextButtonCustom extends StatelessWidget {
  const NextButtonCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 24),
      child: Column(
        children: [
           TextFormFieldCustom(
            hintText: LocaleKeys.otherServices.tr(),
            maxLength: 90,
            controller: AppCubit.get(context).otherServicesController,
          ),
          const SizedBox(height: 30,),
          ElevatedButtonCustom(
            onPressed: (){
              navigationPushFunction(
                  context: context,
                  screen: const NotesAndAddressScreen()
              );
            },
            child: TextCustom(
              textValue: LocaleKeys.nextButton.tr(),
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
