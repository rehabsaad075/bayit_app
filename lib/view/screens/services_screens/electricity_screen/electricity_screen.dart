import 'package:bati_app/i10l/locale_keys.g.dart';
import 'package:bati_app/view/componetes/custom_widdgets/radio_service_select_custom.dart';
import 'package:bati_app/view/componetes/custom_widdgets/next_button_custom.dart';
import 'package:bati_app/view/componetes/custom_widdgets/text_custom.dart';
import 'package:bati_app/view_model/cubits/app_cubit/app_cubit.dart';
import 'package:bati_app/view_model/utils/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';


class ElectricityScreen extends StatefulWidget {
  const ElectricityScreen({super.key});

  @override
  State<ElectricityScreen> createState() => _ElectricityScreenState();
}

class _ElectricityScreenState extends State<ElectricityScreen> {

  String ?electricityServices;

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
          textValue: LocaleKeys.electricityTittle.tr(),
          fontSize: 22,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 8),
        children: [
          RadioServiceSelectCustom(
              value: LocaleKeys.lightingRepair.tr(),
              groupValue:electricityServices ,
              onChanged: (val){
                setState(() {
                  electricityServices=val;
                  AppCubit.get(context).selectedServicesController.text=val??'';
                });
              },
              textValue: LocaleKeys.lightingRepair.tr()
          ),
          const SizedBox(height: 10,),
          RadioServiceSelectCustom(
              value: LocaleKeys.lightingInstallation.tr(),
              groupValue:electricityServices ,
              onChanged: (val){
                setState(() {
                  electricityServices=val;
                  AppCubit.get(context).selectedServicesController.text=val??'';
                });
              },
              textValue: LocaleKeys.lightingInstallation.tr()
          ),
          const SizedBox(height: 10,),
          RadioServiceSelectCustom(
              value: LocaleKeys.electricalFaults.tr(),
              groupValue:electricityServices ,
              onChanged: (val){
                setState(() {
                  electricityServices=val;
                  AppCubit.get(context).selectedServicesController.text=val??'';
                });
              },
              textValue:  LocaleKeys.electricalFaults.tr()
          ),
          const SizedBox(height: 10,),
          RadioServiceSelectCustom(
              value:  LocaleKeys.electricalWires.tr(),
              groupValue:electricityServices ,
              onChanged: (val){
                setState(() {
                  electricityServices=val;
                  AppCubit.get(context).selectedServicesController.text=val??'';
                });
              },
              textValue:  LocaleKeys.electricalWires.tr()
          ),
          const SizedBox(height: 10,),
          RadioServiceSelectCustom(
              value:  LocaleKeys.electricalSwitches.tr() ,
              groupValue:electricityServices ,
              onChanged: (val){
                setState(() {
                  electricityServices=val;
                  AppCubit.get(context).selectedServicesController.text=val??'';
                });
              },
              textValue: LocaleKeys.electricalSwitches.tr()
          ),
          const SizedBox(height: 10,),
          RadioServiceSelectCustom(
              value: LocaleKeys.ceilingFan.tr(),
              groupValue:electricityServices ,
              onChanged: (val){
                setState(() {
                  electricityServices=val;
                  AppCubit.get(context).selectedServicesController.text=val??'';
                });
              },
              textValue: LocaleKeys.ceilingFan.tr()
          ),
          const NextButtonCustom(),
        ],
      ),
    );
  }
}
