import 'package:bati_app/i10l/locale_keys.g.dart';
import 'package:bati_app/models/services_model.dart';
import 'package:bati_app/view/componetes/custom_widgets/text_custom.dart';
import 'package:bati_app/view_model/utils/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MyServiceDoneItem extends StatelessWidget {
  final ServicesModel servicesModel;
  const MyServiceDoneItem({super.key, required this.servicesModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.appColor
        )
      ),
      child:   Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
               TextCustom(
                  textValue: LocaleKeys.serviceName.tr(),
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
              TextCustom(
                textValue: servicesModel.serviceName??'',
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: AppColors.blackColor,
              ),
            ],
          ),
          const SizedBox(height: 10,),
           const Divider(
            color: AppColors.grayColor,
             thickness: 0.6,
          ),
           TextCustom(
            textValue: LocaleKeys.selectedServices.tr(),
            fontSize: 18,
           fontWeight: FontWeight.w500,
          ),
          const SizedBox(height: 5,),
          TextCustom(
            textValue: servicesModel.selectedServices??'',
            fontSize: 16,
            color: AppColors.blackColor,
          ),
          if((servicesModel.otherServices??'').isNotEmpty)
            ...[
              const SizedBox(height: 10,),
              const Divider(
                color: AppColors.grayColor,
                thickness: 0.6,
              ),
               TextCustom(
                textValue: LocaleKeys.otherServices.tr(),
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 5,),
              TextCustom(
                textValue: servicesModel.otherServices??'',
                fontSize: 16,
                color: AppColors.blackColor,
              ),
            ],
          const SizedBox(height: 10,),
          const Divider(
            color: AppColors.grayColor,
            thickness: 0.7,
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
               TextCustom(
                textValue: LocaleKeys.day.tr(),
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
              TextCustom(
                textValue: ': ${servicesModel.serviceDate}',
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: AppColors.blackColor,
              ),
              const SizedBox(width: 40,),
               TextCustom(
                textValue: LocaleKeys.time.tr(),
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
              TextCustom(
                textValue: ': ${servicesModel.serviceTime}',
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: AppColors.blackColor,
              ),
            ],
          ),
          const SizedBox(height: 10,),
          const Divider(
            color: AppColors.grayColor,
            thickness: 0.6,
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
               TextCustom(
                textValue: LocaleKeys.phoneNumber.tr(),
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
              TextCustom(
                textValue: ': ${servicesModel.phoneNumber}',
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: AppColors.blackColor,
              ),
            ],
          ),
          const SizedBox(height: 10,),
          const Divider(
            color: AppColors.grayColor,
            thickness: 0.9,
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
               TextCustom(
                textValue: LocaleKeys.cityName.tr(),
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
              TextCustom(
                textValue: ': ${servicesModel.cityName}',
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: AppColors.blackColor,
              ),
            ],
          ),
          const SizedBox(height: 10,),
          const Divider(
            color: AppColors.grayColor,
            thickness: 0.6,
          ),
          Row(
            children: [
               TextCustom(
                textValue: LocaleKeys.area.tr(),
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
              TextCustom(
                textValue: ': ${servicesModel.area}',
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: AppColors.blackColor,
              ),
            ],
          ),
          const SizedBox(height: 10,),
          const Divider(
            color: AppColors.grayColor,
            thickness: 0.6,
          ),
          Row(
            children: [
               TextCustom(
                textValue: LocaleKeys.street.tr(),
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
              TextCustom(
                textValue: ': ${servicesModel.street}',
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: AppColors.blackColor,
              ),
              const SizedBox(width: 100,),
            ],
          ),
        ],
      ),
    );
  }
}
