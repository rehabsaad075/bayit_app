import 'package:bati_app/view/componetes/custom_widdgets/text_custom.dart';
import 'package:bati_app/view_model/utils/colors/app_colors.dart';
import 'package:bati_app/view_model/utils/icons/app_icons.dart';
import 'package:flutter/material.dart';

class ListTileItem extends StatelessWidget {
  final void Function()? onTap;
  final IconData? leadingIcon;
  final String tittleText;
  const ListTileItem({
    super.key,
    this.onTap,
    this.leadingIcon,
    required this.tittleText,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      tileColor: AppColors.listTileColor,
      contentPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
      leading: Icon(
        leadingIcon
      ),
      minLeadingWidth: 15,
      title:  TextCustom(
        textValue: tittleText,
        color: AppColors.blackColor,
        fontSize: 20,
      ),
      trailing: const Icon(
        AppIcons.arrow,
      ),
    );
  }
}
