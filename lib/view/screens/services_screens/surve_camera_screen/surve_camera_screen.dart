import 'package:bati_app/i10l/locale_keys.g.dart';
import 'package:bati_app/view/componetes/custom_widdgets/radio_service_select_custom.dart';
import 'package:bati_app/view/componetes/custom_widdgets/next_button_custom.dart';
import 'package:bati_app/view/componetes/custom_widdgets/text_custom.dart';
import 'package:bati_app/view_model/cubits/app_cubit/app_cubit.dart';
import 'package:bati_app/view_model/utils/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SurveillanceCameraScreen extends StatefulWidget {
  const SurveillanceCameraScreen({super.key});

  @override
  State<SurveillanceCameraScreen> createState() => _SurveillanceCameraScreenState();
}

class _SurveillanceCameraScreenState extends State<SurveillanceCameraScreen> {
 String ?surveillanceCameraServices;
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
          textValue: LocaleKeys.surveillanceCameraTittle.tr(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 8),
        children: [
          RadioServiceSelectCustom(
              value: LocaleKeys.installingCameras.tr(),
              groupValue: surveillanceCameraServices,
              onChanged: (val){
                setState(() {
                  surveillanceCameraServices=val??'';
                  AppCubit.get(context).selectedServicesController.text=val??'';
                });
              },
              textValue: LocaleKeys.installingCameras.tr()
          ),
          const SizedBox(height: 10,),
          RadioServiceSelectCustom(
              value:LocaleKeys.changeCameras.tr(),
              groupValue: surveillanceCameraServices,
              onChanged: (val){
                setState(() {
                  surveillanceCameraServices=val??'';
                  AppCubit.get(context).selectedServicesController.text=val??'';
                });
              },
              textValue: LocaleKeys.changeCameras.tr()
          ),
          const SizedBox(height: 10,),
          RadioServiceSelectCustom(
              value: LocaleKeys.changeWires.tr(),
              groupValue: surveillanceCameraServices,
              onChanged: (val){
                setState(() {
                  surveillanceCameraServices=val??'';
                  AppCubit.get(context).selectedServicesController.text=val??'';
                });
              },
              textValue: LocaleKeys.changeWires.tr()
          ),
          const NextButtonCustom(),
        ],
      ),
    );
  }
}