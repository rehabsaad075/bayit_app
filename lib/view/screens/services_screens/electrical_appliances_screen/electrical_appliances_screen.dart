import 'package:bati_app/i10l/locale_keys.g.dart';
import 'package:bati_app/view/componetes/custom_widdgets/radio_service_select_custom.dart';
import 'package:bati_app/view/componetes/custom_widdgets/next_button_custom.dart';
import 'package:bati_app/view/componetes/custom_widdgets/text_custom.dart';
import 'package:bati_app/view_model/cubits/app_cubit/app_cubit.dart';
import 'package:bati_app/view_model/utils/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ElectricityAppliancesScreen extends StatefulWidget {
  const ElectricityAppliancesScreen({super.key});

  @override
  State<ElectricityAppliancesScreen> createState() => _ElectricityAppliancesScreenState();
}

class _ElectricityAppliancesScreenState extends State<ElectricityAppliancesScreen> {
  String ?electricityAppliancesServices;
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
        title: TextCustom(
          textValue: LocaleKeys.electricalAppliancesTittle.tr(),
          fontSize: 22,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 8),
        children: [
          RadioServiceSelectCustom(
              value: LocaleKeys.gasStove.tr(),
              groupValue: electricityAppliancesServices,
              onChanged: (val){
                setState(() {
                  electricityAppliancesServices=val??'';
                  AppCubit.get(context).selectedServicesController.text=val??'';
                });
              },
              textValue: LocaleKeys.gasStove.tr()
          ),
          const SizedBox(height: 10,),
          RadioServiceSelectCustom(
              value: LocaleKeys.washingMachine.tr(),
              groupValue: electricityAppliancesServices,
              onChanged: (val){
                setState(() {
                  electricityAppliancesServices=val??'';
                  AppCubit.get(context).selectedServicesController.text=val??'';
                });
              },
              textValue: LocaleKeys.washingMachine.tr()
          ),
          const SizedBox(height: 10,),
          RadioServiceSelectCustom(
              value: LocaleKeys.refrigerator.tr(),
              groupValue: electricityAppliancesServices,
              onChanged: (val){
                setState(() {
                  electricityAppliancesServices=val??'';
                  AppCubit.get(context).selectedServicesController.text=val??'';
                });
              },
              textValue: LocaleKeys.refrigerator.tr()
          ),
          const NextButtonCustom(),
        ],
      ),
    );
  }
}