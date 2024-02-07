import 'package:bati_app/i10l/locale_keys.g.dart';
import 'package:bati_app/models/services_model.dart';
import 'package:bati_app/view/componetes/custom_widdgets/text_custom.dart';
import 'package:bati_app/view_model/utils/colors/app_colors.dart';
import 'package:bati_app/view_model/utils/icons/app_icons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MyServiceActiveItem extends StatelessWidget {
  final ServicesModel serviceRequestModel;
  final  void Function()? editOnPressed;
  final  void Function()? deleteOnPressed;
  final  void Function()? doneOnPressed;
  const MyServiceActiveItem({
    super.key,
    required this.serviceRequestModel,
     this.editOnPressed,
     this.deleteOnPressed,
    this.doneOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: AppColors.appColor
          )
      ),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Row(
            children: [
               TextCustom(
                textValue: LocaleKeys.serviceName.tr(),
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
               Expanded(
                 child: TextCustom(
                  textValue: serviceRequestModel.serviceName??'',
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: AppColors.blackColor,
              ),
               ),
              const SizedBox(width: 40,),
              IconButton(
                  onPressed: editOnPressed,
                  icon: const Icon(
                    AppIcons.edit,
                    color: AppColors.appColor,)
              ),
            ],
          ),
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
            textValue: serviceRequestModel.selectedServices??'',
            fontSize: 16,
            color: AppColors.blackColor,
          ),
          if((serviceRequestModel.otherServices??'').isNotEmpty)
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
                textValue: serviceRequestModel.otherServices??'',
                fontSize: 16,
                color: AppColors.blackColor,
              ),
            ],
          const SizedBox(height: 10,),
          const Divider(
            color: AppColors.grayColor,
            thickness: 0.6,
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
                textValue: ': ${serviceRequestModel.serviceDate}',
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
                textValue: ': ${serviceRequestModel.serviceTime}',
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
                textValue: LocaleKeys.phoneNumber.tr(),
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
              TextCustom(
                textValue: ': ${serviceRequestModel.phoneNumber}',
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
                textValue: ': ${serviceRequestModel.cityName}',
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: AppColors.blackColor,
              ),
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
               TextCustom(
                textValue: LocaleKeys.area.tr(),
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
              TextCustom(
                textValue: ': ${serviceRequestModel.area}',
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: AppColors.blackColor,
              ),
            ],
          ),
          const SizedBox(height: 10,),
           Row(
            children: [
               TextCustom(
                textValue: LocaleKeys.street.tr(),
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
               TextCustom(
                textValue: ': ${serviceRequestModel.street}',
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: AppColors.blackColor,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: doneOnPressed,
                icon: const Icon(
                  AppIcons.doneIcon,
                  color: AppColors.appColor,
                ),
              ),
                  IconButton(
                      onPressed: deleteOnPressed,
                      icon: const Icon(
                        AppIcons.delete,
                        color: AppColors.appColor,)
                  ),
            ],
          ),
        ],
      ),
    );
  }
}