import 'package:bati_app/i10l/locale_keys.g.dart';
import 'package:bati_app/view/componetes/custom_widdgets/elevatetButton_custom.dart';
import 'package:bati_app/view/componetes/custom_widdgets/text_custom.dart';
import 'package:bati_app/view_model/cubits/auth_cubit/auth_cubit.dart';
import 'package:bati_app/view_model/utils/colors/app_colors.dart';
import 'package:bati_app/view_model/utils/functions/flutterToastFunctions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../componetes/custom_widdgets/textFormField_custom.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: AppColors.appColor,
          size: 25,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title:  TextCustom(
          textValue: LocaleKeys.changePassword.tr(),
        ),
      ),
      body: BlocBuilder<AuthCubit, AuthStates>(
        builder: (context, state) {
          AuthCubit authCubit=AuthCubit.get(context);
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 22),
            child: Form(
              key: authCubit.formChangePasskey,
              child: Column(
                children: [
                  TextFormFieldCustom(
                    labelText: LocaleKeys.oldPassword.tr(),
                    suffixIcon: authCubit.suffixIcon,
                    keyboardType: TextInputType.text,
                    obscureText: authCubit.oldPassword,
                    maxLength: 8,
                    //autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value){
                      if(value!.isEmpty){
                        return LocaleKeys.passwordValidate.tr();
                      }
                      // else if(value !=authCubit.passwordController.text){
                      //   return 'Password is incorrect';
                      // }
                      return null;
                    },
                    onTapIcon: () {
                      authCubit.changeSuffixIconOldPass();
                    },
                  ),
                  const SizedBox(height: 15,),
                  TextFormFieldCustom(
                    labelText: LocaleKeys.newPassword.tr(),
                    suffixIcon: authCubit.suffixIconNewPass,
                    keyboardType: TextInputType.text,
                    obscureText: authCubit.newPassword,
                    maxLength: 8,
                    validator: (value){
                      if(value!.isEmpty){
                        return LocaleKeys.passwordValidate.tr();
                      }
                      return null;
                    },
                    onTapIcon: () {
                      authCubit.changeSuffixIconNewPass();
                    },
                  ),
                  const SizedBox(height: 30,),
                  ElevatedButtonCustom(
                    onPressed: (){
                      if(authCubit.formChangePasskey.currentState!.validate()){
                        authCubit.changePassword(
                            authCubit.newPasswordController.text,
                          authCubit.oldPasswordController.text
                        )
                            .then((value) {
                          showToast(
                            msg: LocaleKeys.changePassShowToast.tr(),
                          );
                        });
                      }
                    },
                    child: Visibility(
                      visible: state is ChangePasswordLoadingState,
                      replacement: TextCustom(
                        textValue: LocaleKeys.changePassword.tr(),
                        fontSize: 20,
                      ),
                      child:const CircularProgressIndicator(
                        color: AppColors.appColor,
                      ) ,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
