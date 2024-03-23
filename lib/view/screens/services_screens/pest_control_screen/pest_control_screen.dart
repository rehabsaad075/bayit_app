import 'package:bati_app/i10l/locale_keys.g.dart';
import 'package:bati_app/view/componetes/custom_widgets/next_button_custom.dart';
import 'package:bati_app/view/componetes/custom_widgets/radio_service_select_custom.dart';
import 'package:bati_app/view/componetes/custom_widgets/text_custom.dart';
import 'package:bati_app/view_model/cubits/app_cubit/app_cubit.dart';
import 'package:bati_app/view_model/utils/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PestControlScreen extends StatefulWidget {
  const PestControlScreen({super.key});

  @override
  State<PestControlScreen> createState() => _PestControlScreenState();
}

class _PestControlScreenState extends State<PestControlScreen> {
 String? pestControlServices;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: AppColors.appColor,
          size: 27,
        ),
        backgroundColor: Colors.transparent ,
        elevation: 0,
        title:TextCustom(
          textValue: LocaleKeys.pestControlTittle.tr(),
          fontSize: 22,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 8),
        children: [
          RadioServiceSelectCustom(
              value: LocaleKeys.crawlingInsects.tr(),
              groupValue: pestControlServices,
              onChanged: (val){
                setState(() {
                  pestControlServices=val??'';
                  AppCubit.get(context).selectedServicesController.text=val??'';
                });
              },
              textValue: LocaleKeys.crawlingInsects.tr()
          ),
          const SizedBox(height: 10,),
          RadioServiceSelectCustom(
              value: LocaleKeys.rodents.tr(),
              groupValue: pestControlServices,
              onChanged: (val){
                setState(() {
                  pestControlServices=val??'';
                  AppCubit.get(context).selectedServicesController.text=val??'';
                });
              },
              textValue: LocaleKeys.rodents.tr()
          ),
          const SizedBox(height: 10,),
          RadioServiceSelectCustom(
              value: LocaleKeys.gecko.tr(),
              groupValue: pestControlServices,
              onChanged: (val){
                setState(() {
                  pestControlServices=val??'';
                  AppCubit.get(context).selectedServicesController.text=val??'';
                });
              },
              textValue: LocaleKeys.gecko.tr()
          ),
          const SizedBox(height: 10,),
          RadioServiceSelectCustom(
              value: LocaleKeys.flyingBugs.tr(),
              groupValue: pestControlServices,
              onChanged: (val){
                setState(() {
                  pestControlServices=val??'';
                  AppCubit.get(context).selectedServicesController.text=val??'';
                });
              },
              textValue: LocaleKeys.flyingBugs.tr()
          ),
          const SizedBox(height: 10,),
          RadioServiceSelectCustom(
              value: LocaleKeys.disinfection.tr(),
              groupValue: pestControlServices,
              onChanged: (val){
                setState(() {
                  pestControlServices=val??'';
                  AppCubit.get(context).selectedServicesController.text=val??'';
                });
              },
              textValue: LocaleKeys.disinfection.tr()
          ),
          const NextButtonCustom(),
        ],
      ),
    );
  }
}