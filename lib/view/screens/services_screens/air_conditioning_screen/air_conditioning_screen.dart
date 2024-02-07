import 'package:bati_app/i10l/locale_keys.g.dart';
import 'package:bati_app/view/componetes/custom_widdgets/radio_service_select_custom.dart';
import 'package:bati_app/view/componetes/custom_widdgets/next_button_custom.dart';
import 'package:bati_app/view/componetes/custom_widdgets/text_custom.dart';
import 'package:bati_app/view_model/cubits/app_cubit/app_cubit.dart';
import 'package:bati_app/view_model/utils/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AirConditioningScreen extends StatefulWidget {
  const AirConditioningScreen({super.key});

  @override
  State<AirConditioningScreen> createState() => _AirConditioningScreenState();
}

class _AirConditioningScreenState extends State<AirConditioningScreen> {
  String ?airConditioningServices;

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
        title:  TextCustom(
          textValue: LocaleKeys.airConditioningTittle.tr(),
          fontSize: 22,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 8),
        children: [
          RadioServiceSelectCustom(
              value: LocaleKeys.airConditionerCheck.tr(),
              groupValue: airConditioningServices,
              onChanged: (val){
                setState(() {
                  airConditioningServices=val??'';
                  AppCubit.get(context).selectedServicesController.text=val??'';
                });
              },
              textValue: LocaleKeys.airConditionerCheck.tr()
          ),
          const SizedBox(height: 10,),
          RadioServiceSelectCustom(
              value:LocaleKeys.airConditioningCleaning.tr(),
              groupValue: airConditioningServices,
              onChanged: (val){
                setState(() {
                  airConditioningServices=val??'';
                  AppCubit.get(context).selectedServicesController.text=val??'';
                });
              },
              textValue: LocaleKeys.airConditioningCleaning.tr()
          ),
          const SizedBox(height: 10,),
          RadioServiceSelectCustom(
              value: LocaleKeys.installingAirConditioning.tr(),
              groupValue: airConditioningServices,
              onChanged: (val){
                setState(() {
                  airConditioningServices=val??'';
                  AppCubit.get(context).selectedServicesController.text=val??'';
                });
              },
              textValue: LocaleKeys.installingAirConditioning.tr()
          ),
          const SizedBox(height: 10,),
          RadioServiceSelectCustom(
              value: LocaleKeys.airConditioningFreon.tr(),
              groupValue: airConditioningServices,
              onChanged: (val){
                setState(() {
                  airConditioningServices=val??'';
                  AppCubit.get(context).selectedServicesController.text=val??'';
                });
              },
              textValue: LocaleKeys.airConditioningFreon.tr()
          ),
          const NextButtonCustom(),
        ],
      ),
    );
  }
}