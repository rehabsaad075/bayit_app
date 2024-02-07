import 'package:bati_app/i10l/locale_keys.g.dart';
import 'package:bati_app/view_model/cubits/app_cubit/app_cubit.dart';
import 'package:bati_app/view_model/utils/colors/app_colors.dart';
import 'package:bati_app/view_model/utils/icons/app_icons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit,AppStates>(
     builder: (context, state) {
       AppCubit appCubit=AppCubit.get(context);
      return Scaffold(
       body: appCubit.screens[appCubit.buttonNavigationBarIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.appColor,
        selectedFontSize: 16,
        selectedIconTheme: const IconThemeData(size: 30),
        unselectedItemColor: AppColors.grayColor,
        type: BottomNavigationBarType.fixed,
        currentIndex: appCubit.buttonNavigationBarIndex,
        onTap: (int value){
          appCubit.changeIndexButtonNavigationBar(value);
        },
        items:  [
          BottomNavigationBarItem(
              icon:const Icon(AppIcons.homeIcon) ,
              label: LocaleKeys.home.tr(),
          ),
          BottomNavigationBarItem(
              icon:const Icon(AppIcons.services) ,
              label: LocaleKeys.services.tr()
          ),
          BottomNavigationBarItem(
              icon:const Icon(AppIcons.myServices) ,
              label: LocaleKeys.myServices.tr()
          ),
          BottomNavigationBarItem(
              icon:const Icon(AppIcons.settings) ,
              label: LocaleKeys.settings.tr()
          ),
        ],
      ),
    );
  },
);
  }
}
//The Beyti application allows you to request maintenance services such as an air conditioning technician, electrician, or plumber. The Beyti application is the best way to complete all your household chores.