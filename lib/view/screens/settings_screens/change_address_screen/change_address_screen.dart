import 'package:bati_app/i10l/locale_keys.g.dart';
import 'package:bati_app/view/componetes/custom_widdgets/elevatetButton_custom.dart';
import 'package:bati_app/view/componetes/custom_widdgets/searchBar_item.dart';
import 'package:bati_app/view/componetes/custom_widdgets/text_custom.dart';
import 'package:bati_app/view_model/utils/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ChangeAddressScreen extends StatelessWidget {
  const ChangeAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: AppColors.appColor,
          size: 25,
        ),
        backgroundColor: Colors.transparent ,
        elevation: 0,
        title: TextCustom(
          textValue: LocaleKeys.changeLocation.tr(),
        ),
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchBarItem(),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 170,
                    child: ElevatedButtonCustom(
                      onPressed: (){},
                      child: TextCustom(
                        textValue: LocaleKeys.changeLocation.tr(),
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
