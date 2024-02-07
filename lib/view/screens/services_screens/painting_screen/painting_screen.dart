import 'package:bati_app/i10l/locale_keys.g.dart';
import 'package:bati_app/view/componetes/custom_widdgets/radio_service_select_custom.dart';
import 'package:bati_app/view/componetes/custom_widdgets/next_button_custom.dart';
import 'package:bati_app/view/componetes/custom_widdgets/text_custom.dart';
import 'package:bati_app/view_model/cubits/app_cubit/app_cubit.dart';
import 'package:bati_app/view_model/utils/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PaintingScreen extends StatefulWidget {
  const PaintingScreen({super.key});

  @override
  State<PaintingScreen> createState() => _PaintingScreenState();
}

class _PaintingScreenState extends State<PaintingScreen> {
  String ?paintingServices;

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
          textValue: LocaleKeys.paintingTittle.tr(),
          fontSize: 22,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 8),
        children: [
          RadioServiceSelectCustom(
              value: LocaleKeys.wallPaint.tr(),
              groupValue: paintingServices,
              onChanged: (val){
                setState(() {
                  paintingServices=val??'';
                  AppCubit.get(context).selectedServicesController.text=val??'';
                });
              },
              textValue: LocaleKeys.wallPaint.tr()
          ),
          const SizedBox(height: 10,),
          RadioServiceSelectCustom(
              value: LocaleKeys.paintingDoors.tr(),
              groupValue: paintingServices,
              onChanged: (val){
                setState(() {
                  paintingServices=val??'';
                  AppCubit.get(context).selectedServicesController.text=val??'';
                });
              },
              textValue: LocaleKeys.paintingDoors.tr()
          ),
          const SizedBox(height: 10,),
          RadioServiceSelectCustom(
              value: LocaleKeys.furniturePainting.tr(),
              groupValue: paintingServices,
              onChanged: (val){
                setState(() {
                  paintingServices=val??'';
                  AppCubit.get(context).selectedServicesController.text=val??'';
                });
              },
              textValue: LocaleKeys.furniturePainting.tr()
          ),
          const SizedBox(height: 10,),
          RadioServiceSelectCustom(
              value: LocaleKeys.pasteWallpaper.tr(),
              groupValue: paintingServices,
              onChanged: (val){
                setState(() {
                  paintingServices=val??'';
                  AppCubit.get(context).selectedServicesController.text=val??'';
                });
              },
              textValue: LocaleKeys.pasteWallpaper.tr()
          ),
          const SizedBox(height: 10,),
          RadioServiceSelectCustom(
              value: LocaleKeys.treatment.tr(),
              groupValue: paintingServices,
              onChanged: (val){
                setState(() {
                  paintingServices=val??'';
                  AppCubit.get(context).selectedServicesController.text=val??'';
                });
              },
              textValue: LocaleKeys.treatment.tr()
          ),
          const NextButtonCustom(),
        ],
      ),
    );
  }
}
