import 'package:bati_app/models/services_logo_model.dart';
import 'package:bati_app/view/componetes/custom_widgets/text_custom.dart';
import 'package:bati_app/view_model/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';

class ServiceItem extends StatelessWidget {
  final void Function()? onTap;
  final ServicesLogoModel servicesLogoModel;

  const ServiceItem({super.key, this.onTap, required this.servicesLogoModel});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(25),
      color: AppColors.appColor,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(25),
        child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                      image: AssetImage(
                        servicesLogoModel.logo,
                      ),
                      fit: BoxFit.fill,
                    )
                ),
              ),
              Positioned(
                top: 155,
                 left: 30,
                 right: 30,
                child: TextCustom(
                  textValue: servicesLogoModel.serviceName,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                ),
              )
            ]
        ),
      ),
    );
  }
}
