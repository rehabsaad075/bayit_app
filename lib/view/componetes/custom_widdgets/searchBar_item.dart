import 'package:bati_app/i10l/locale_keys.g.dart';
import 'package:bati_app/view_model/cubits/app_cubit/app_cubit.dart';
import 'package:bati_app/view_model/utils/colors/app_colors.dart';
import 'package:bati_app/view_model/utils/icons/app_icons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SearchBarItem extends StatelessWidget {
  const SearchBarItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 24,vertical: 2)
      ),
      backgroundColor:MaterialStateProperty.all(
          Colors.grey[200]
      ) ,
      constraints:const BoxConstraints(
          maxWidth: 300
      ) ,
      elevation: MaterialStateProperty.all(2),
      controller:AppCubit.get(context).searchBarController,
      hintText: LocaleKeys.yourLocation.tr(),
      hintStyle: MaterialStateProperty.all(
          const TextStyle(
            color: AppColors.grayColor,
            fontSize: 16,

          )
      ),
      textStyle: MaterialStateProperty.all(
          const TextStyle(
              color: AppColors.appColor,
              fontSize: 16
          )
      ),
      onTap: (){},
      leading: const Icon(
        AppIcons.location,
        color: AppColors.appColor,
      ),
    );
  }
}
