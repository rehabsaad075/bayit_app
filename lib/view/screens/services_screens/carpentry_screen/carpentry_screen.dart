import 'package:bati_app/i10l/locale_keys.g.dart';
import 'package:bati_app/view/componetes/custom_widgets/next_button_custom.dart';
import 'package:bati_app/view/componetes/custom_widgets/radio_service_select_custom.dart';
import 'package:bati_app/view/componetes/custom_widgets/text_custom.dart';
import 'package:bati_app/view_model/cubits/app_cubit/app_cubit.dart';
import 'package:bati_app/view_model/utils/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CarpentryScreen extends StatefulWidget {
  const CarpentryScreen({super.key});

  @override
  State<CarpentryScreen> createState() => _CarpentryScreenState();
}

class _CarpentryScreenState extends State<CarpentryScreen> {
 String ?carpentryServices;
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
          textValue: LocaleKeys.carpentryTittle.tr(),
          fontSize: 22,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 8),
        children: [
          RadioServiceSelectCustom(
              value: LocaleKeys.furnitureRepair.tr(),
              groupValue: carpentryServices,
              onChanged: (val){
                setState(() {
                  carpentryServices=val??'';
                  AppCubit.get(context).selectedServicesController.text=val??'';
                });
              },
              textValue: LocaleKeys.furnitureRepair.tr()
          ),
          const SizedBox(height: 10,),
          RadioServiceSelectCustom(
              value: LocaleKeys.repairingDoors.tr(),
              groupValue: carpentryServices,
              onChanged: (val){
                setState(() {
                  carpentryServices=val??'';
                  AppCubit.get(context).selectedServicesController.text=val??'';
                });
              },
              textValue: LocaleKeys.repairingDoors.tr()
          ),
          const SizedBox(height: 10,),
          RadioServiceSelectCustom(
              value: LocaleKeys.repairWindows.tr(),
              groupValue: carpentryServices,
              onChanged: (val){
                setState(() {
                  carpentryServices=val??'';
                  AppCubit.get(context).selectedServicesController.text=val??'';
                });
              },
              textValue: LocaleKeys.repairWindows.tr()
          ),
          const SizedBox(height: 10,),
          RadioServiceSelectCustom(
              value: LocaleKeys.kitchenCabinets.tr(),
              groupValue: carpentryServices,
              onChanged: (val){
                setState(() {
                  carpentryServices=val??'';
                  AppCubit.get(context).selectedServicesController.text=val??'';
                });
              },
              textValue: LocaleKeys.kitchenCabinets.tr()
          ),
          const NextButtonCustom(),
        ],
      ),
    );
  }
}
