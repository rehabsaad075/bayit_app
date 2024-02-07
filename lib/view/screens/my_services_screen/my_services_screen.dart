import 'package:bati_app/i10l/locale_keys.g.dart';
import 'package:bati_app/view_model/utils/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'active_services_screen.dart';
import 'done_services_screen.dart';

class MyServicesScreen extends StatelessWidget {
  const MyServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 6),
          child: Column(
            children: [
              TabBar(
                labelColor: AppColors.appColor,
                  labelStyle: const TextStyle(
                    fontSize: 18
                  ),
                  indicatorColor: AppColors.appColor,
                  tabs: [
                    Tab(
                      text: LocaleKeys.activeServices.tr(),
                    ),
                     Tab(
                      text: LocaleKeys.doneServices.tr(),
                    ),
                  ]
              ),
              const Expanded(
                child: TabBarView(
                    children: [
                      ActiveServicesScreen(),
                      DoneServicesScreen()
                    ]
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
