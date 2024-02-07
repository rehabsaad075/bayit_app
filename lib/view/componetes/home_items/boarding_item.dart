import 'package:bati_app/models/boarding_model.dart';
import 'package:bati_app/view/componetes/custom_widdgets/text_custom.dart';
import 'package:bati_app/view_model/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';

class BoardingItem extends StatelessWidget {
  final BoardingModel boardingModel;
  const BoardingItem({super.key, required this.boardingModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 280,
          width: 280,
          child: Image.asset(boardingModel.image),
        ),
         TextCustom(
            textValue: boardingModel.tittle,
           fontSize: 24,
           fontWeight: FontWeight.w500,
        ),
        const SizedBox(height: 10,),
         TextCustom(
            textValue: boardingModel.subTittle,
           fontSize: 18,
           color: AppColors.blackColor,
           fontWeight: FontWeight.w500,
        ),
        const SizedBox(height: 10,),
         TextCustom(
            textValue: boardingModel.body,
           fontSize: 16,
           color: AppColors.gray2Color,
        ),
      ],
    );
  }
}
