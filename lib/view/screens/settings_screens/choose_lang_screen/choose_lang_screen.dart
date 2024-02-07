import 'package:bati_app/i10l/locale_keys.g.dart';
import 'package:bati_app/view/componetes/custom_widdgets/elevatetButton_custom.dart';
import 'package:bati_app/view/componetes/custom_widdgets/radioListTile_custom.dart';
import 'package:bati_app/view/componetes/custom_widdgets/text_custom.dart';
import 'package:bati_app/view/screens/splash_screen/splash_screen.dart';
import 'package:bati_app/view_model/cubits/app_cubit/app_cubit.dart';
import 'package:bati_app/view_model/utils/colors/app_colors.dart';
import 'package:bati_app/view_model/utils/functions/navigation_functions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseLanguageScreen extends StatelessWidget {
  const ChooseLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(
              color: AppColors.appColor,
              size: 25,
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: TextCustom(
              textValue: LocaleKeys.language.tr(),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextCustom(
                  textValue: LocaleKeys.langMessage.tr(),
                  color: AppColors.blackColor,
                  fontSize: 20,
                ),
                const SizedBox(height: 20,),
                const RadioListTileCustom(
                  value: 'English',
                ),
                const SizedBox(height: 15,),
                const RadioListTileCustom(value: 'اللغة العربية'),
                const SizedBox(height: 30,),
                ElevatedButtonCustom(
                  onPressed: () {
                    navigationPushFunction(context: context, screen: const SplashScreen());
                  },
                  child: TextCustom(
                    textValue: LocaleKeys.saveChanges.tr(),
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

