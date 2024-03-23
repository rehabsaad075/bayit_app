import 'package:bati_app/i10l/locale_keys.g.dart';
import 'package:bati_app/view/componetes/custom_widgets/text_custom.dart';
import 'package:bati_app/view_model/cubits/app_cubit/app_cubit.dart';
import 'package:bati_app/view_model/utils/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../componetes/service_home_item/service_item.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<AppCubit, AppStates>(
  builder: (context, state) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 3,
        title:  TextCustom(
          textValue: LocaleKeys.services.tr(),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.only(
          left: 34,
          right: 34,
          top: 34,
          bottom: 80
        ),
          gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 70,
              crossAxisSpacing: 50,
            childAspectRatio: 1/1.007
          ),
          itemBuilder: (context,index){
            return  ServiceItem(
              onTap: (){
                AppCubit.get(context).changeServicesIndex(index, context);
              },
              servicesLogoModel: AppCubit.get(context).servicesLogoList[index]
            );
          },
        itemCount:  AppCubit.get(context).servicesLogoList.length,
      ),
    );
  },
);
  }
}
