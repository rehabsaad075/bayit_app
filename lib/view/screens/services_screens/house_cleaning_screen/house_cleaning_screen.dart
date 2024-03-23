import 'package:bati_app/i10l/locale_keys.g.dart';
import 'package:bati_app/view/componetes/custom_widgets/next_button_custom.dart';
import 'package:bati_app/view/componetes/custom_widgets/radio_service_select_custom.dart';
import 'package:bati_app/view/componetes/custom_widgets/text_custom.dart';
import 'package:bati_app/view_model/cubits/app_cubit/app_cubit.dart';
import 'package:bati_app/view_model/utils/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HouseCleaningScreen extends StatefulWidget {
  const HouseCleaningScreen({super.key});

  @override
  State<HouseCleaningScreen> createState() => _HouseCleaningScreenState();
}

class _HouseCleaningScreenState extends State<HouseCleaningScreen> {
  String ?houseCleaningServices;
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
          textValue: LocaleKeys.houseCleaningTittle.tr(),
          fontSize: 22,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 8),
        children: [
          RadioServiceSelectCustom(
              value: LocaleKeys.normalCleaning.tr(),
              groupValue: houseCleaningServices,
              onChanged: (val){
                setState(() {
                  houseCleaningServices=val??'';
                  AppCubit.get(context).selectedServicesController.text=val??'';
                });
              },
              textValue: LocaleKeys.normalCleaning.tr()
          ),
          const SizedBox(height: 10,),
          RadioServiceSelectCustom(
              value: LocaleKeys.deepCleaning.tr(),
              groupValue: houseCleaningServices,
              onChanged: (val){
                setState(() {
                  houseCleaningServices=val??'';
                  AppCubit.get(context).selectedServicesController.text=val??'';
                });
              },
              textValue: LocaleKeys.deepCleaning.tr()
          ),
          const SizedBox(height: 10,),
          RadioServiceSelectCustom(
              value: LocaleKeys.cleaningAfter.tr(),
              groupValue: houseCleaningServices,
              onChanged: (val){
                setState(() {
                  houseCleaningServices=val??'';
                  AppCubit.get(context).selectedServicesController.text=val??'';
                });
              },
              textValue: LocaleKeys.cleaningAfter.tr()
          ),
          const SizedBox(height: 10,),
          RadioServiceSelectCustom(
              value: LocaleKeys.kitchenCleaning.tr(),
              groupValue: houseCleaningServices,
              onChanged: (val){
                setState(() {
                  houseCleaningServices=val??'';
                  AppCubit.get(context).selectedServicesController.text=val??'';
                });
              },
              textValue: LocaleKeys.kitchenCleaning.tr()
          ),
          const SizedBox(height: 10,),
          RadioServiceSelectCustom(
              value: LocaleKeys.furnitureCleaning.tr(),
              groupValue: houseCleaningServices,
              onChanged: (val){
                setState(() {
                  houseCleaningServices=val??'';
                  AppCubit.get(context).selectedServicesController.text=val??'';
                });
              },
              textValue: LocaleKeys.furnitureCleaning.tr()
          ),
          const NextButtonCustom(),
        ],
      ),
    );
  }
}