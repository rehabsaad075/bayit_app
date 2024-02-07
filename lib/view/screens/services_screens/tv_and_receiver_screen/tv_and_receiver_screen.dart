import 'package:bati_app/i10l/locale_keys.g.dart';
import 'package:bati_app/view/componetes/custom_widdgets/radio_service_select_custom.dart';
import 'package:bati_app/view/componetes/custom_widdgets/next_button_custom.dart';
import 'package:bati_app/view/componetes/custom_widdgets/text_custom.dart';
import 'package:bati_app/view_model/cubits/app_cubit/app_cubit.dart';
import 'package:bati_app/view_model/utils/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TVAndReceiverScreen extends StatefulWidget {
  const TVAndReceiverScreen({super.key});

  @override
  State<TVAndReceiverScreen> createState() => _TVAndReceiverScreenState();
}

class _TVAndReceiverScreenState extends State<TVAndReceiverScreen> {
  String ?tvAndReceiverServices;
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
          textValue:LocaleKeys.tVAndReceiverTittle.tr(),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 8),
        children: [
          RadioServiceSelectCustom(
              value: LocaleKeys.dishInstallation.tr(),
              groupValue: tvAndReceiverServices,
              onChanged: (val){
                setState(() {
                  tvAndReceiverServices=val??'';
                  AppCubit.get(context).selectedServicesController.text=val??'';
                });
              },
              textValue: LocaleKeys.dishInstallation.tr()
          ),
          const SizedBox(height: 10,),
          RadioServiceSelectCustom(
              value: LocaleKeys.dishRepair.tr(),
              groupValue: tvAndReceiverServices,
              onChanged: (val){
                setState(() {
                  tvAndReceiverServices=val??'';
                  AppCubit.get(context).selectedServicesController.text=val??'';
                });
              },
              textValue: LocaleKeys.dishRepair.tr()
          ),
          const SizedBox(height: 10,),
          RadioServiceSelectCustom(
              value: LocaleKeys.tVScreen.tr(),
              groupValue: tvAndReceiverServices,
              onChanged: (val){
                setState(() {
                  tvAndReceiverServices=val??'';
                  AppCubit.get(context).selectedServicesController.text=val??'';
                });
              },
              textValue: LocaleKeys.tVScreen.tr()
          ),
          const NextButtonCustom()
        ],
      ),
    );
  }
}