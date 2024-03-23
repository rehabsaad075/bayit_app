import 'package:bati_app/i10l/locale_keys.g.dart';
import 'package:bati_app/view/componetes/custom_widgets/next_button_custom.dart';
import 'package:bati_app/view/componetes/custom_widgets/radio_service_select_custom.dart';
import 'package:bati_app/view/componetes/custom_widgets/text_custom.dart';
import 'package:bati_app/view_model/cubits/app_cubit/app_cubit.dart';
import 'package:bati_app/view_model/utils/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PlumbingScreen extends StatefulWidget {
  const PlumbingScreen({super.key});

  @override
  State<PlumbingScreen> createState() => _PlumbingScreenState();
}

class _PlumbingScreenState extends State<PlumbingScreen> {
  String ?plumbingServices;
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
          textValue: LocaleKeys.plumbingTittle.tr(),
          fontSize: 22,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 8),
        children: [
          RadioServiceSelectCustom(
              value: LocaleKeys.waterHeaters.tr(),
              groupValue: plumbingServices,
              onChanged: (val){
                setState(() {
                  plumbingServices=val;
                  AppCubit.get(context).selectedServicesController.text=val??'';
                });
              },
              textValue: LocaleKeys.waterHeaters.tr(),
          ),
          const SizedBox(height: 10,),
          RadioServiceSelectCustom(
              value: LocaleKeys.repairCloggedDrains.tr(),
              groupValue: plumbingServices,
              onChanged: (val){
                setState(() {
                  plumbingServices=val;
                  AppCubit.get(context).selectedServicesController.text=val??'';
                });
              },
              textValue: LocaleKeys.repairCloggedDrains.tr()
          ),
          const SizedBox(height: 10,),
          RadioServiceSelectCustom(
              value: LocaleKeys.repairLeaking.tr(),
              groupValue: plumbingServices,
              onChanged: (val){
                setState(() {
                  plumbingServices=val;
                  AppCubit.get(context).selectedServicesController.text=val??'';
                });
              },
              textValue:  LocaleKeys.repairLeaking.tr()
          ),
          const SizedBox(height: 10,),
          RadioServiceSelectCustom(
              value:  LocaleKeys.repairingFaucets.tr(),
              groupValue: plumbingServices,
              onChanged: (val){
                setState(() {
                  plumbingServices=val;
                  AppCubit.get(context).selectedServicesController.text=val??'';
                });
              },
              textValue: LocaleKeys.repairingFaucets.tr()
          ),
          const SizedBox(height: 10,),
          RadioServiceSelectCustom(
              value: LocaleKeys.waterFilters.tr(),
              groupValue: plumbingServices,
              onChanged: (val){
                setState(() {
                  plumbingServices=val;
                  AppCubit.get(context).selectedServicesController.text=val??'';
                });
              },
              textValue: LocaleKeys.waterFilters.tr()
          ),
          const SizedBox(height: 10,),
          RadioServiceSelectCustom(
              value: LocaleKeys.waterPipes.tr(),
              groupValue: plumbingServices,
              onChanged: (val){
                setState(() {
                  plumbingServices=val;
                  AppCubit.get(context).selectedServicesController.text=val??'';
                });
              },
              textValue: LocaleKeys.waterPipes.tr()
          ),
          const SizedBox(height: 10,),
          RadioServiceSelectCustom(
              value: LocaleKeys.waterMotors.tr(),
              groupValue: plumbingServices,
              onChanged: (val){
                setState(() {
                  plumbingServices=val;
                  AppCubit.get(context).selectedServicesController.text=val??'';
                });
              },
              textValue: LocaleKeys.waterMotors.tr()
          ),
          const NextButtonCustom(),
        ],
      ),
    );
  }
}
