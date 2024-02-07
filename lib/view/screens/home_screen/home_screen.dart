import 'package:bati_app/i10l/locale_keys.g.dart';
import 'package:bati_app/view_model/cubits/app_cubit/app_cubit.dart';
import 'package:bati_app/view_model/utils/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../componetes/custom_widdgets/text_custom.dart';
import '../../componetes/home_items/boarding_item.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28,vertical: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25,),
               TextCustom(
                textValue: LocaleKeys.welcomeAppMessage.tr(),
                color: AppColors.blackColor,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(height: 5,),
               TextCustom(
                textValue: LocaleKeys.helpAppMessage.tr(),
                color: AppColors.blackColor,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              Expanded(
                child: PageView.builder(
                  controller: AppCubit.get(context).boardController,
                    physics: const BouncingScrollPhysics(),
                    itemCount: AppCubit.get(context).boarding.length,
                    itemBuilder: (context,index){
                      return  BoardingItem(
                        boardingModel: AppCubit.get(context).boarding[index],
                      );
                    }
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SmoothPageIndicator(
                    controller: AppCubit.get(context).boardController,
                    effect: const ScrollingDotsEffect(
                        activeDotColor: AppColors.appColor,
                        dotColor: Colors.grey,
                        dotHeight: 12,
                        dotWidth: 12,
                        spacing: 5
                    ),
                    count: AppCubit.get(context).boarding.length,
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}
