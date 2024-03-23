import 'package:bati_app/i10l/locale_keys.g.dart';
import 'package:bati_app/view/componetes/custom_widgets/elevatetButton_custom.dart';
import 'package:bati_app/view/componetes/custom_widgets/textFormField_custom.dart';
import 'package:bati_app/view/componetes/custom_widgets/text_custom.dart';
import 'package:bati_app/view_model/cubits/auth_cubit/auth_cubit.dart';
import 'package:bati_app/view_model/utils/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthStates>(
    builder: (context, state) {
      AuthCubit authCubit =AuthCubit.get(context);
      return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: AppColors.appColor,
            size: 25,
          ),
          backgroundColor: Colors.transparent ,
          elevation: 0,
          title: TextCustom(
            textValue: LocaleKeys.helpCenter.tr(),
          ),
        ),
        body:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 22),
          child: Column(
            children: [
               TextCustom(
                  textValue: LocaleKeys.helpMessage.tr(),
                color: AppColors.blackColor,
                fontSize: 22,
              ),
              const SizedBox(height: 25,),
               TextFormFieldCustom(
                hintText: LocaleKeys.sendHelpMessage.tr(),
                maxLines: 7,
                controller: authCubit.sendMessageController,
              ),
              const SizedBox(height: 30,),
              ElevatedButtonCustom(
                onPressed: (){
                  authCubit.sendMessage();
                },
                child: Visibility(
                  visible: state is SendMessageLoadingState,
                  replacement:TextCustom(
                    textValue: LocaleKeys.sendHelpMessage.tr(),
                    fontSize: 20,
                  ) ,
                  child: const CircularProgressIndicator(
                    color: AppColors.appColor,
                  ),
                ),
              )
            ],
          ),
        ),
      );
    },
);
  }
}
